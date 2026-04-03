Add-Type -AssemblyName System.Windows.Forms,System.Drawing
$screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
Write-Output "SCREEN_SIZE:" + $screen.Width + "x" + $screen.Height
$bmp = New-Object System.Drawing.Bitmap($screen.Width, $screen.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size)
$openclaw_media = $env:OPENCLAW_MEDIA_DIR
if (-not $openclaw_media) {
  $openclaw_media = Join-Path $env:USERPROFILE ".openclaw\media"
}
if (!(Test-Path $openclaw_media)) { 
  New-Item -ItemType Directory -Path $openclaw_media | Out-Null 
}
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$path = Join-Path $openclaw_media ("screenshot_" + $timestamp + ".png")
$bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()
Write-Output "MEDIA:" + $path