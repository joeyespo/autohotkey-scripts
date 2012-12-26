; By AutoHotkey member Lexikos
; Modified by Joe Esposito
; Origin: http://www.autohotkey.net/~Lexikos/AutoHotkey_L/docs/commands/_If.htm

#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::
SendInput {Volume_Up}
SoundPlay *-1
return

WheelDown::
SendInput {Volume_Down}
SoundPlay *-1
return

MButton::
SendInput {Volume_Mute}
SoundPlay *-1
return
#If

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
