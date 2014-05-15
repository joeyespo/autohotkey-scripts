; By Joe Esposito

#n::
SetTitleMatchMode, 2
If WinExist("Untitled - Notepad")
{
    WinActivate
}
else
{
    Run "Notepad.exe", %A_Desktop%, , CmdPID
    WinWait ahk_pid %CmdPID%
    WinActivate
}
return
