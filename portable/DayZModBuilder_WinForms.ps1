# DayZ Mod Builder Portable Host — Author: KRa Tos (Константин)
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$candidates = @(
  (Join-Path $root "app\index.html"),
  (Join-Path $root "index.html"),
  (Join-Path $root "..\index.html")
)
$html = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $html) {
  [System.Windows.Forms.MessageBox]::Show("index.html not found","DayZ Mod Builder")
  exit 1
}
$form = New-Object System.Windows.Forms.Form
$form.Text = "DayZ Mod Builder v2.0 Portable — KRa Tos (Константин)"
$form.Size = New-Object System.Drawing.Size(1100, 800)
$form.StartPosition = "CenterScreen"
$form.MinimumSize = New-Object System.Drawing.Size(800, 600)
$web = New-Object System.Windows.Forms.WebBrowser
$web.Dock = "Fill"
$web.ScriptErrorsSuppressed = $true
$form.Controls.Add($web)
$uri = (New-Object System.Uri ((Resolve-Path $html).Path)).AbsoluteUri
$web.Navigate($uri)
[void]$form.ShowDialog()
