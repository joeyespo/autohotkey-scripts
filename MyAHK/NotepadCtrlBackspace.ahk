; By How-To Geek
; Modified by Joe Esposito
; Origin: https://superuser.com/questions/33142/ctrlbackspace-inserts-a-small-box-instead-of-erasing/636973#636973

#IfWinActive ahk_class CabinetWClass ; File Explorer
    ^Backspace::Return
#IfWinActive ahk_class Notepad
    ^Backspace::
        Send ^+{Left}{Backspace}
    Return
#IfWinActive
