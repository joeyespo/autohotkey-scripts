; By Joe Esposito

#IfWinActive ahk_class Notepad
^w::SendInput !{F4}
#IfWinActive

#IfWinActive ahk_class ConsoleWindowClass
^w::SendInput +{Escape}exit{Enter}
#IfWinActive
