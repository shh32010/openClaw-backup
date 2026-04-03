Add-Type -AssemblyName System.Windows.Forms,System.Drawing

# 获取主屏幕信息
$screen = [System.Windows.Forms.Screen]::PrimaryScreen
if ($null -eq $screen) {
    Write-Output "ERROR:无法获取屏幕信息"
    exit 1
}

$bounds = $screen.Bounds
Write-Output "SCREEN_SIZE:" + $bounds.Width + "x" + $bounds.Height

# 获取真实的屏幕分辨率
$realWidth = $bounds.Width
$realHeight = $bounds.Height
Write-Output "REAL_SCREEN_SIZE:" + $realWidth + "x" + $realHeight

# 创建与屏幕实际大小匹配的位图
try {
    $bmp = New-Object System.Drawing.Bitmap($realWidth, $realHeight)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    
    # 设置高质量渲染
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    
    # 捕获整个屏幕
    $realSize = New-Object System.Drawing.Size($realWidth, $realHeight)
    $g.CopyFromScreen(0, 0, 0, 0, $realSize)
    
    # 设置输出目录
    $openclaw_media = $env:OPENCLAW_MEDIA_DIR
    if (-not $openclaw_media) {
        $openclaw_media = Join-Path $env:USERPROFILE ".openclaw\media"
    }
    if (!(Test-Path $openclaw_media)) { 
        New-Item -ItemType Directory -Path $openclaw_media | Out-Null 
    }
    
    # 生成文件名并保存
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $path = Join-Path $openclaw_media ("screenshot_" + $timestamp + ".png")
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    
    Write-Output "MEDIA:" + $path
    Write-Output "SCREEN_SIZE:" + $bounds.Width + "x" + $bounds.Height
    Write-Output "REAL_SCREEN_SIZE:" + $realWidth + "x" + $realHeight
    
    # 清理资源
    if ($null -ne $g) { $g.Dispose() }
    if ($null -ne $bmp) { $bmp.Dispose() }
}
catch {
    Write-Output "ERROR:截图失败 - " + $_.Exception.Message
    exit 1
}