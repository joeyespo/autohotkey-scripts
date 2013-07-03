; By Lifehacker reader Kevin
; Modified by Joe Esposito
; Origin: http://lifehacker.com/#!5306401/open-a-new-command-prompt-from-explorer-with-a-hotkey
; 
; NOTE: This script will only work when the following option is on:
; - Display the full path in the title bar (Classic theme only)
; Turn this on by going to Tools, Folder Options in Explorer.

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
