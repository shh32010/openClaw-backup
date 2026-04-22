# Bailian Web Search via PowerShell
# Usage: .\mcp-websearch.ps1 "query" [count]
param(
    [string]$Query = "扬州天气",
    [int]$Count = 5
)

$apiKey = $env:DASHSCOPE_API_KEY
if (-not $apiKey) {
    Write-Host "Error: DASHSCOPE_API_KEY environment variable is not set"
    exit 1
}

$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}

$MCP_URL = "https://dashscope.aliyuncs.com/api/v1/mcps/WebSearch/mcp"

Write-Host "=== Bailian Web Search ==="
Write-Host "Query: $Query"
Write-Host "Count: $Count"
Write-Host ""

# Step 1: Initialize
$initBody = @{
    jsonrpc = "2.0"
    id = 0
    method = "initialize"
    params = @{
        protocolVersion = "2024-11-05"
        capabilities = @{}
        clientInfo = @{
            name = "powershell-client"
            version = "1.0.0"
        }
    }
} | ConvertTo-Json -Compress

Write-Host "Step 1: Initializing..."
try {
    $r = Invoke-WebRequest -Uri $MCP_URL -Method POST -Headers $headers -Body $initBody -TimeoutSec 20 -UseBasicParsing
    Write-Host "Init response: $($r.StatusCode)"
} catch {
    Write-Host "Init failed: $($_.Exception.Message)"
}

# Step 2: Send initialized notification
$null = Invoke-WebRequest -Uri $MCP_URL -Method POST -Headers $headers -Body '{"jsonrpc":"2.0","method":"notifications/initialized"}' -TimeoutSec 10 -UseBasicParsing

# Step 3: List tools
$listBody = '{"jsonrpc":"2.0","id":2,"method":"tools/list","params":{}}' | ConvertTo-Json -Compress
Write-Host "Step 2: Listing tools..."
try {
    $r = Invoke-WebRequest -Uri $MCP_URL -Method POST -Headers $headers -Body $listBody -TimeoutSec 20 -UseBasicParsing
    Write-Host "Tools response: $($r.Content.Substring(0, [Math]::Min(500, $r.Content.Length)))"
} catch {
    Write-Host "List tools failed: $($_.Exception.Message)"
}

# Step 4: Call web search
$searchBody = @{
    jsonrpc = "2.0"
    id = 3
    method = "tools/call"
    params = @{
        name = "bailian_web_search"
        arguments = @{
            query = $Query
            count = $Count
        }
    }
} | ConvertTo-Json -Compress

Write-Host "Step 3: Searching..."
try {
    $r = Invoke-WebRequest -Uri $MCP_URL -Method POST -Headers $headers -Body $searchBody -TimeoutSec 30 -UseBasicParsing
    $json = $r.Content | ConvertFrom-Json
    $content = $json.content
    if ($content) {
        $results = $content | ForEach-Object { $_ }
        Write-Host "=== Search Results ==="
        Write-Host $content
    } else {
        Write-Host "Raw: $($r.Content)"
    }
} catch {
    Write-Host "Search failed: $($_.Exception.Message)"
}

Write-Host ""
Write-Host "=== Done ==="
