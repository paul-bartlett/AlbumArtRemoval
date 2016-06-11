[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

Function Get-Folder($initialDirectory)
{
    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.rootfolder = "MyComputer"

    if($foldername.ShowDialog() -eq "OK")
    {
        return $foldername.SelectedPath
    }
    else
	{
		Exit 0
	}
}
$Path = Get-Folder

Remove-Item -path $Path -recurse -Force -include *.jpg, *.png -exclude folder.*, cover.*, *$(($Path -split '\\')[-1])*, *$(($Path -split '\\')[-2])* 

<# 2.0 version
 Get-ChildItem -path $Path -include *.jpg, *.png -exclude folder.*, cover.* -Force -recurse | Remove-Item -Force
 #>