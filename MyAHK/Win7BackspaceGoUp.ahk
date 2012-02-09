; By How-To Geek
; Modified by Joe Esposito
; Origin: http://www.howtogeek.com/howto/8955/make-backspace-in-windows-7-or-vista-explorer-go-up-like-xp-did/

#IfWinActive, ahk_class CabinetWClass
Backspace::
    ControlGet renamestatus,Visible,,Edit1,A
    ControlGetFocus focussed, A
    if(renamestatus != 1 && (focussed = "DirectUIHWND3" || focussed = SysTreeView321))
    {
        SendInput {Alt Down}{Up}{Alt Up}
    }
    else
    {
        Send {Backspace}
    }
#IfWinActive
