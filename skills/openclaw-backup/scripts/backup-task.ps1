$DATE = Get-Date -Format "yyyy-MM-dd_HHmm"
$TMP = "$env:TEMP\openclaw-backup-tmp"
$BACKUP_DIR = "C:\Users\002\openclaw-backups"
$BACKUP = "$BACKUP_DIR\openclaw-$DATE.zip"
$WS = "C:\Users\002\.openclaw\workspace"

# Clean old temp
Remove-Item $TMP -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $TMP -Force | Out-Null

# Copy .openclaw (exclude locked/big dirs)
robocopy "$env:USERPROFILE\.openclaw" $TMP /MIR `
    /XD completions "browser\openclaw\user-data" "extensions\openclaw-weixin\node_modules" `
    /XF "*.lock" "*.sqlite*" "*.log" `
    /NP /NDL /NJH /NJS 2>$null | Out-Null

# Zip
Compress-Archive -Path "$TMP\*" -DestinationPath $BACKUP -CompressionLevel Optimal -Force
$size = (Get-Item $BACKUP).Length

# Cleanup
Remove-Item $TMP -Recurse -Force -ErrorAction SilentlyContinue

# Rotate: keep last 7
Get-ChildItem $BACKUP_DIR -Filter "openclaw-*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -Skip 7 | Remove-Item -Force -ErrorAction SilentlyContinue

# Update BACKUP.md
$entry = "| $((Get-Date).ToString('yyyy-MM-dd')) | $($DATE.Substring(11,2) + ':' + $DATE.Substring(13)) | $([math]::Round($size/1MB,1)) MB ($size bytes) | ``$BACKUP`` |"
$mdPath = "$WS\BACKUP.md"
$mdContent = Get-Content $mdPath -Raw
# Match any date format: 2026-04-04, 2026-04-09, etc.
$mdContent = $mdContent -replace '(?<line>\| \d{4}-\d{2}-\d{2} \|.*?\|`C:\\Users\\002\\openclaw-backups\\openclaw-[^`]+` \|)', $entry
Set-Content -Path $mdPath -Value $mdContent -NoNewline

# Git add+commit+push
git -C $WS add BACKUP.md
git -C $WS commit -m "Backup $(Get-Date -Format 'yyyy-MM-dd_HHMM')" 2>$null
git -C $WS push origin main 2>$null

Write-Host "DONE:$size"
