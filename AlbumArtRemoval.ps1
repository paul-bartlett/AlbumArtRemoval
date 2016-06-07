Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$a = Get-Folder
Remove-Item $a\* -recurse -include *.jpg, *.png -exclude folder.*, cover.*, *((get-item Get-ScriptDirectory).Directory.parent)*, *((get-item Get-ScriptDirectory).Directory.parent.parent)*