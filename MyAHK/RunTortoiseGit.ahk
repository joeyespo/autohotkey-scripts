; By Joe Esposito
;
; NOTE: This requires TortoiseGit to be is installed in C:\Program Files

#include Helpers.ahk

#a::
Command = commit
Goto, RunTortoise
#s::
Command = sync
Goto, RunTortoise
#f::
Command = log
Goto, RunTortoise
#g::
Command = switch
Goto, RunTortoise
#z::
Command = rebase
Goto, RunTortoise

RunTortoise:
ExplorerPath := Explorer_GetPath()
If ErrorLevel
  ExplorerPath := A_Desktop

Run, C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe /command:%Command% /path:"%ExplorerPath%", %ExplorerPath%, , CmdPID
WinWait ahk_pid %CmdPID%
WinActivate
Return
