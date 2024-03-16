$SavedGames = "$env:Userprofile\Saved Games"
Function Get-Folder($initialDirectory="")
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")|Out-Null
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.Description = "Select a folder"
    $foldername.rootfolder = "MyComputer"
    $foldername.SelectedPath = $initialDirectory
    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}
$dcsfolder = Get-Folder
if ( -NOT (Test-Path "$dcsfolder\Mods\Aircraft")){
    Copy-Item ".\Civil Aircraft Mod" "$dcsfolder\Mods\Aircraft\" -Recurse -Force -EA SilentlyContinue
    Copy-Item ".\Civil Aircraft Mod" "$dcsfolder\Mods\Aircraft\" -Recurse -Force -EA SilentlyContinue
    } ELSE {
    Copy-Item ".\Civil Aircraft Mod\*" "$dcsfolder\Mods\Aircraft\Civil Aircraft Mod\" -Recurse -Force -EA SilentlyContinue
    Copy-Item ".\Civil Aircraft Mod\*" "$dcsfolder\Mods\Aircraft\Civil Aircraft Mod\" -Recurse -Force -EA SilentlyContinue
    }