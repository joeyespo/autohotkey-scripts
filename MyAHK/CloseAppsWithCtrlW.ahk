; By Joe Esposito

#If WinActive("ahk_class Notepad")
^w::SendInput !{F4}
#IfWinActive

#If WinActive("ahk_class ConsoleWindowClass")
^w::SendInput !{F4}
#IfWinActive
