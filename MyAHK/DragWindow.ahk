; By How-To Geek
; Origin: http://www.howtogeek.com/howto/windows-vista/get-the-linux-altwindow-drag-functionality-in-windows/
;
; This script modified from the original: http://www.autohotkey.com/docs/scripts/EasyWindowDrag.htm
; by The How-To Geek
; http://www.howtogeek.com

#include Helpers.ahk

#If MouseIsNotOver("ahk_class Progman")
#If MouseIsNotOver("ahk_class WorkerW")

Alt & LButton::
If (A_TimeSincePriorHotkey<400) and (A_TimeSincePriorHotkey<>-1)
  Goto, EWD_CenterWindow

CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin%
If EWD_WinState = 0  ; Only if the window isn't maximized
  SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
Return

EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
If EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
  SetTimer, EWD_WatchMouse, off
  Return
}
GetKeyState, EWD_EscapeState, Escape, P
If EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
  SetTimer, EWD_WatchMouse, off
  WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
  Return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
Return
#If
#If

EWD_CenterWindow:
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos,,, EWD_MouseWin
CenterWindowById(EWD_MouseWin)
Return

MouseIsNotOver(WinTitle) {
  MouseGetPos,,, Win
  return !WinExist(WinTitle . " ahk_id " . Win)
}
