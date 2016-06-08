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

<# Statement not supported in 3.0 due to bug with removing
Remove-Item -path $Path -recurse -include *.jpg, *.png -exclude folder.*, cover.*, *$(($Path -split '\\')[-1])*, *$(($Path -split '\\')[-2])* 
#>
Get-ChildItem -path $Path -include *.jpg, *.png -exclude folder.*, cover.*, *$(($Path -split '\\')[-1])*, *$(($Path -split '\\')[-2])* -recurse | Remove-Item