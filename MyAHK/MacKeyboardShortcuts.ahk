; By Joe Esposito
; Adds Mac-like keyboard shortcuts.

!w::SendInput ^w

#If WinActive("ahk_class ConsoleWindowClass")
!w::SendInput !{F4}
#IfWinActive
