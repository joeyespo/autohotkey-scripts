; By Lifehacker reader Kevin
; Modified by Joe Esposito
; Origin: http://lifehacker.com/#!5306401/open-a-new-command-prompt-from-explorer-with-a-hotkey

#include Helpers.ahk

#+c::
  ExplorerPath := Explorer_GetPath()
  If ErrorLevel
    ExplorerPath := A_Desktop

  Run, Cmder, %ExplorerPath%, , CmdPID

  WinWait ahk_pid %CmdPID%
  WinActivate
  CenterWindow(A)
Return
