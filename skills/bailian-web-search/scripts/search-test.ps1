[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$apiKey = $env:DASHSCOPE_API_KEY
$headers = @{
    "Authorization" = "Bearer $apiKey"
    "Content-Type" = "application/json"
    "Accept" = "application/json"
}
$mcp = "https://dashscope.aliyuncs.com/api/v1/mcps/WebSearch/mcp"

$init = '{"jsonrpc":"2.0","id":0,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"ps","version":"1.0"}}}'
$null = Invoke-WebRequest -Uri $mcp -Method POST -Headers $headers -Body $init -TimeoutSec 20 -UseBasicParsing
$null = Invoke-WebRequest -Uri $mcp -Method POST -Headers $headers -Body '{"jsonrpc":"2.0","method":"notifications/initialized"}' -TimeoutSec 10 -UseBasicParsing

$queries = @(
    @{ query = "今日金价 黄金价格 2026"; count = 5 },
    @{ query = "今日银价 白银价格 2026"; count = 5 }
)

foreach ($q in $queries) {
    Write-Host "=== $($q.query) ==="
    $search = @{
        jsonrpc = "2.0"
        id = 3
        method = "tools/call"
        params = @{
            name = "bailian_web_search"
            arguments = @{
                query = $q.query
                count = $q.count
            }
        }
    } | ConvertTo-Json -Compress

    try {
        $r = Invoke-WebRequest -Uri $mcp -Method POST -Headers $headers -Body $search -TimeoutSec 30 -UseBasicParsing
        $json = $r.Content | ConvertFrom-Json
        $content = $json.result.content[0].text | ConvertFrom-Json
        $content.pages | ForEach-Object {
            Write-Host ""
            Write-Host $_.title
            Write-Host $_.snippet.Substring(0, [Math]::Min(200, $_.snippet.Length))
            Write-Host $_.url
        }
    } catch {
        Write-Host "Search failed: $($_.Exception.Message)"
    }
    Write-Host ""
}
