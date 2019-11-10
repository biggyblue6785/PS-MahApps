# Add required assemblies.
Add-Type -Path "$PSScriptRoot\Assembly\MahApps.Metro.dll"

# Load WPF XAML.
[xml]$loadXAML = Get-Content "$PSScriptRoot\MahApps.xaml"
$readXAML = (New-Object System.Xml.XmlNodeReader $loadXAML)

$GUI = [Windows.Markup.XamlReader]::Load($readXAML)

# Open an external input modal on button click.
$GUI.FindName("LoginBtn").add_Click({
	[MahApps.Metro.Controls.Dialogs.DialogManager]::ShowModalInputExternal($GUI,"Server Login:","Please enter your faculty login.") # <<<<<<<< Problem happens here
})

# Show MahApps window.
$GUI.ShowDialog() | Out-Null
