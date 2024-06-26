###
# WARNING! ⚠️
# I am `git adding` this but has not been really tested.
# Good luck?! ✌️
# @gsweats 2024-06-26 at 01:37:15 MDT (GMT -06:00)
###

#
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/set-psdebug?view=powershell-7.4
#
# Set-PSDebug
#   [-Trace <Int32>]
#   [-Step]     (ask to continue each step / step-by-step)
#   [-Strict]
#   [<CommonParameters>]
#
#
#
# Set-PSDebug
#    [-Off]
#    [<CommonParameters>]
#
#
# Set-PSDebug -Trace 1 -Step
Set-PSDebug -Trace 2

# https://stackoverflow.com/questions/41201878/run-command-on-script-termination-window-closure

# The value is specific to the source of the event. This can be an arbitrary value you created to use with the New-Event cmdlet.
# The PowerShell engine supports the PSEngineEvent values PowerShell.Exiting and PowerShell.OnIdle.

Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action {
    # Stop-Process iris -force
    Set-PSDebug -Off
}



$RootPath = $PSScriptRoot
$RootPath = (Split-Path $RootPath -Parent)
# Write-Debug $RootPath
Write-Output "$$RootPath: [$RootPath]"


# Set-PSDebug -Off

$ShortcutsPath = "$RootPath\shortcuts"
$LinkPath = "$shortcutsPath\off24sharepoint"
$realPath = "F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)"


# debug:
# exit
#


# https://devblogs.microsoft.com/powershell-community/determine-if-a-folder-exists/
if (-Not (Test-Path -Path $ShortcutsPath)) {
    mkdir $ShortcutsPath
}


# mklink /J "$ShortcutsPaths\off24sharepoint" "F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)\graphics\off24-event1"
# [symlink - Creating hard and soft links using PowerShell - Stack Overflow](https://stackoverflow.com/questions/894430/creating-hard-and-soft-links-using-powershell)



# W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1RootPath: [W:\www\gsweats-web24-brutal]
# DEBUG:   27+  >>>> Set-PSDebug -Off


#
# New-Item: W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1:47:1
# Line |
#   47 |  New-Item -Path $LinkPath -ItemType SymbolicLink -Value $RealPath
#      |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#      | Cannot create link because the path already exists: W:\www\gsweats-web24-brutal\shortcuts\off24sharepoint.
# PS W:\www\gsweats-web24-brutal>
#
# https://get-carbon.org/Test-PathIsJunction.html#:~:text=The%20Test%2DPathIsJunction%20function%20tests,you%20can%20use%20instead%20e.g.&text=would%20return%20all%20the%20junctions%20under%20the%20current%20user's%20temporary%20directory.
#
# if (-Not (Test-PathIsJunction -Path $LinkPath)) {

# ---


#
# Get-Item: W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1:81:6
# Line |
#   81 |  if ((Get-Item -Path $LinkPath -Force).LinkType -eq "Junction") {
#      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#      | Cannot find path 'W:\www\gsweats-web24-brutal\shortcuts\off24sharepoint' because it does not exist.
#



# DOES PATH EXIST?
if (Test-Path -Path $LinkPath) {
    # IS PATH JUNCTION POINT (SYMLINK)?
    # https://stackoverflow.com/questions/2311105/test-in-powershell-code-if-a-folder-is-a-junction-point
    if ((Get-Item -Path $LinkPath -Force).LinkType -eq "Junction") {
        Write-Output "EXITING EARLY: $$TargetPath exists but is not a junction point."
        Write-Output "EXITING EARLY: Exiting to avoid data loss."
        Write-Output "EXITING EARLY: Exiting to avoid data loss."
        exit
    }
}


New-Item -Path $LinkPath -ItemType SymbolicLink -Value $RealPath -Force

# New-Item
#    [-Path] <String[]>
#    [-ItemType <String>]
#    [-Value <Object>]
#    [-Force]
#    [-Credential <PSCredential>]
#    [-WhatIf]
#    [-Confirm]
#    [<CommonParameters>]

# New-Item
#    [[-Path] <String[]>]
#    -Name <String>
#    [-ItemType <String>]
#    [-Value <Object>]
#    [-Force]
#    [-Credential <PSCredential>]
#    [-WhatIf]
#    [-Confirm]
#    [<CommonParameters>]






###
# EXAMPLE OUTPUT - SUCCESS
# - Far less info when specifying a path that does not exist.
#
# PS W:\www\gsweats-web24-brutal> . 'W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1'
# DEBUG:    1+  >>>> . 'W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1'
# DEBUG:     ! CALL function '<ScriptBlock>'
# DEBUG:   19+  >>>> Set-PSDebug -Trace 2
#
# DEBUG:     ! CALL function '<ScriptBlock>'  (defined in file 'W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1')
# DEBUG:   26+  >>>> Register-EngineEvent -SourceIdentifier PowerShell.Exiting -Action {
#
#
# Id     Name            PSJobTypeName   State         HasMoreData     Location             Command
# --     ----            -------------   -----         -----------     --------             -------
# 6      PowerShell.Exi…                 NotStarted    False                                …
# DEBUG:   33+  >>>> $RootPath = $PSScriptRoot
#
# DEBUG:     ! SET $RootPath = 'W:\www\gsweats-web24-brutal\script'.
# DEBUG:   34+  >>>> $RootPath = (Split-Path $RootPath -Parent)
#
# DEBUG:     ! SET $RootPath = 'W:\www\gsweats-web24-brutal'.
# DEBUG:   36+  >>>> Write-Output "$$RootPath: [$RootPath]"
#
# W:\www\gsweats-web24-brutal\script\add-shortcuts-symlinks.ps1RootPath: [W:\www\gsweats-web24-brutal]
# DEBUG:   41+  >>>> $ShortcutsPath = "$RootPath\shortcuts"
#
# DEBUG:     ! SET $ShortcutsPath = 'W:\www\gsweats-web24-brutal\shortcuts'.
# DEBUG:   42+  >>>> $LinkPath = "$shortcutsPath\off24sharepoint"
#
# DEBUG:     ! SET $LinkPath = 'W:\www\gsweats-web24-brutal\shortcuts\off24sharepoin…'.
# DEBUG:   43+  >>>> $realPath = "F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)"
#
# DEBUG:     ! SET $realPath = 'F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF…'.
# DEBUG:   52+ if ( >>>> -Not (Test-Path -Path $ShortcutsPath)) {
#
# DEBUG:   92+ if ( >>>> Test-Path -Path $LinkPath) {
#
# DEBUG:   95+     if ( >>>> (Get-Item -Path $LinkPath -Force).LinkType -eq "Junction") {
#
# DEBUG:  104+  >>>> New-Item -Path $LinkPath -ItemType SymbolicLink -Value $RealPath -Force
#
#
# PSPath              : Microsoft.PowerShell.Core\FileSystem::W:\www\gsweats-web24-brutal\shortcuts\off24sharepoint
# PSParentPath        : Microsoft.PowerShell.Core\FileSystem::W:\www\gsweats-web24-brutal\shortcuts
# PSChildName         : off24sharepoint
# PSDrive             : F
# PSProvider          : Microsoft.PowerShell.Core\FileSystem
# PSIsContainer       : True
# Name                : off24sharepoint
# Parent              : W:\www\gsweats-web24-brutal\shortcuts
# Root                : W:\
# Exists              : True
# FullName            : W:\www\gsweats-web24-brutal\shortcuts\off24sharepoint
# Extension           :
# CreationTime        : 2024-06-13 17:31:12
# CreationTimeUtc     : 2024-06-13 23:31:12
# LastAccessTime      : 2024-06-13 17:31:12
# LastAccessTimeUtc   : 2024-06-13 23:31:12
# LastWriteTime       : 2024-06-13 17:31:12
# LastWriteTimeUtc    : 2024-06-13 23:31:12
# LinkTarget          : F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)
# UnixFileMode        : -1
# Attributes          : Directory, ReparsePoint, NotContentIndexed
# Mode                : l----
# ModeWithoutHardLink : l----
# BaseName            : off24sharepoint
# ResolvedTarget      : F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)
# Target              : F:\xl\Dalyle\OFF48 - General\projects\2024-06-04 OFF24 Highlights (Okotoks Film Fest 2024)
# LinkType            : SymbolicLink
#
#
# PS W:\www\gsweats-web24-brutal
###