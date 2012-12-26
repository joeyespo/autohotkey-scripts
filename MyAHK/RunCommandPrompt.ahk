; By Lifehacker reader Kevin
; Modified by Joe Esposito
; Origin: http://lifehacker.com/#!5306401/open-a-new-command-prompt-from-explorer-with-a-hotkey

; Only do this within Explorer
#IfWinActive ahk_class CabinetWClass
#c::
ControlGetText, AddressText, Edit1
Run, cmd /K "cd `"%AddressText%`""
Return
#IfWinActive

; Do this anywhere else
#IfWinNotActive ahk_class CabinetWClass
#c::
Run, cmd /K "cd `"%HOMEPATH%`\Desktop""
Return
#IfWinActive
