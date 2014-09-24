; By Joe Esposito
;
; NOTE: This script will only work when the following option is on:
; - Display the full path in the title bar (Classic theme only)
; Turn this on by going to Tools, Folder Options in Explorer.

#IfWinActive ahk_class CabinetWClass
#a::
Command = commit
Goto, GetCwd
#s::
Command = sync
Goto, GetCwd
#f::
Command = log
Goto, GetCwd
#g::
Command = switch
Goto, GetCwd

GetCwd:
WinGetTitle, AddressText
IfExist %AddressText%
    path = %AddressText%
Else
{
    ControlGetText, AddressText, Edit1
    IfExist %AddressText%
        path = %AddressText%
    Else
        path = %A_Desktop%
}
Goto, Run
#IfWinActive

; Do this anywhere else
#IfWinNotActive ahk_class CabinetWClass
#a::
#s::
#f::
#g::
path = %A_Desktop%
Goto, Run
#IfWinActive

Run:
; TODO: Find TortoiseGitProc another way
Run, C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe /command:%Command% /path:%path%, %path%, , CmdPID
WinWait ahk_pid %CmdPID%
WinActivate
Return
