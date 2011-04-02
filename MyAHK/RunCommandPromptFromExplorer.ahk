; By Lifehacker reader Kevin
; Modified by Joe Esposito
; Origin: http://lifehacker.com/#!5306401/open-a-new-command-prompt-from-explorer-with-a-hotkey

; Only do this within Explorer
#IfWinActive ahk_class CabinetWClass
#c::
ClipSaved := ClipboardAll
Send !d
Sleep 10
Send ^c
Run, cmd /K "cd `"%clipboard%`""
Clipboard := ClipSaved
ClipSaved =
Return
#IfWinActive

; Only do this within the desktop
#IfWinActive ahk_class Progman
#c::
#IfWinActive ahk_class WorkerW
#c::
#IfWinActive ahk_class Shell_TrayWnd
#c::
Run, cmd /K "cd `"%HOMEPATH%`\Desktop""
Return
#IfWinActive
