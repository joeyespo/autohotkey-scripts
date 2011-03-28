; By Joe Esposito

#n::
SetTitleMatchMode, 2
If WinExist("Untitled - Notepad")
{
    WinActivate
}
else
{
    Run "Notepad.exe"
}
return
