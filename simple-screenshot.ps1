# 简化的屏幕截图脚本
Add-Type -AssemblyName System.Windows.Forms,System.Drawing

# 获取屏幕信息
try {
    $screen = [System.Windows.Forms.Screen]::AllScreens[0]
    $bounds = $screen.Bounds
    
    Write-Output "SCREEN_SIZE:" + $bounds.Width + "x" + $bounds.Height
    
    # 创建位图
    $bmp = New-Object System.Drawing.Bitmap($bounds.Width, $bounds.Height)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    
    # 设置渲染质量
    $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    
    # 捕获屏幕
    $g.CopyFromScreen($bounds.X, $bounds.Y, 0, 0, $bounds.Size)
    
    # 保存路径
    $openclaw_media = $env:OPENCLAW_MEDIA_DIR
    if (-not $openclaw_media) {
        $openclaw_media = Join-Path $env:USERPROFILE ".openclaw\media"
    }
    if (!(Test-Path $openclaw_media)) { 
        New-Item -ItemType Directory -Path $openclaw_media | Out-Null 
    }
    
    # 保存截图
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $path = Join-Path $openclaw_media ("screenshot_" + $timestamp + ".png")
    $bmp.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
    
    Write-Output "MEDIA:" + $path
    Write-Output "SCREEN_SIZE:" + $bounds.Width + "x" + $bounds.Height
    
    # 清理
    $g.Dispose()
    $bmp.Dispose()
}
catch {
    Write-Output "ERROR:" + $_.Exception.Message
    exit 1
}