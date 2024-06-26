#
# Run in PowerShell or Bash (maybe?)
# That's why no extension (`.ps1` or `.sh`)
# OH NEVERMIND CUZ POWERSHELL IS KINDA 💩 STILL?

# pwsh .\script\bump-version
# Processing -File '.\script\bump-version' failed because
# the file does not have a '.ps1' extension.
# Specify a valid PowerShell script file name, and then try again.

git cliff -o CHANGELOG.md --bump

###
# Other commands that maybe work???
###
# git-cliff -o CHANGELOG.md
# git cliff -o CHANGELOG.md --bump
# git cliff -t v1.0.1...v1.0.3