; By Lifehacker reader Kevin
; Modified by Joe Esposito
; Origin: http://lifehacker.com/#!5306401/open-a-new-command-prompt-from-explorer-with-a-hotkey

; Only do this within Explorer
#IfWinActive ahk_class CabinetWClass
#c::
WinGetTitle, AddressText
IfExist %AddressText%
    Run, cmd /K "cd `"%AddressText%`""
Else
{
    ControlGetText, AddressText, Edit1
    IfExist %AddressText%
        Run, cmd /K "cd `"%AddressText%`""
    Else
        Run, cmd /K "cd `"%A_Desktop%`""
}
Return
#IfWinActive

; Do this anywhere else
#IfWinNotActive ahk_class CabinetWClass
#c::
Run, cmd /K "cd `"%A_Desktop%`""
Return
#IfWinActive
