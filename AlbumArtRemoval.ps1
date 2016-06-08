[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
Function Get-Folder($initialDirectory)

{
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

$Path = Get-Folder
Remove-Item -path $Path -recurse -include *.jpg, *.png -exclude folder.*, cover.*