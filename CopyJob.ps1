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

if ($dcsfolder -and -not (Test-Path (Join-Path -Path $dcsfolder -ChildPath "Mods\Aircraft")))
{
    Copy-Item -Path ".\Civil Aircraft Mod" -Destination (Join-Path -Path $dcsfolder -ChildPath "Mods\Aircraft") -Recurse -Force -ErrorAction SilentlyContinue
}
else
{
    $targetPath = Join-Path -Path $dcsfolder -ChildPath "Mods\Aircraft\Civil Aircraft Mod"
    if (-not (Test-Path $targetPath))
    {
        New-Item -Path $targetPath -Type Directory -Force | Out-Null
    }
    Copy-Item -Path ".\Civil Aircraft Mod\*" -Destination $targetPath -Recurse -Force -ErrorAction SilentlyContinue
}