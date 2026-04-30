$DATE = Get-Date -Format "yyyy-MM-dd_HHmm"
$BACKUP_DIR = "C:\Users\002\openclaw-backups"
$BACKUP = "$BACKUP_DIR\openclaw-$DATE.zip"
$SRC = "$env:USERPROFILE\.openclaw"
$WS = "C:\Users\002\.openclaw\workspace"

New-Item -ItemType Directory -Path $BACKUP_DIR -Force | Out-Null

# Use tar - handles junction points properly
tar -cf $BACKUP -C $SRC `
    --exclude="completions" `
    --exclude="browser" `
    --exclude="plugin-runtime-deps" `
    --exclude="plugin-runtime" `
    --exclude="canvas" `
    --exclude="extensions\openclaw-weixin\node_modules" `
    --exclude="*.lock" `
    --exclude="*.sqlite*" `
    --exclude="*.log" `
    .

$size = (Get-Item $BACKUP).Length

# Rotate: keep last 7
Get-ChildItem $BACKUP_DIR -Filter "openclaw-*.zip" | Sort-Object LastWriteTime -Descending | Select-Object -Skip 7 | Remove-Item -Force -ErrorAction SilentlyContinue

# Git push workspace
git -C $WS add -A 2>$null
git -C $WS commit -m "Auto backup $DATE" 2>$null
git -C $WS push origin main 2>$null

Write-Host "DONE: $([math]::Round($size/1MB,1)) MB -> $BACKUP"
