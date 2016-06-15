; By How-To Geek
; Modified by Joe Esposito
; Origin: http://www.howtogeek.com/howto/25590/how-to-enable-ctrlv-for-pasting-in-the-windows-command-prompt/

; Check Windows version

PreWin10() {
  StringSplit, Array, A_OSVersion, .
  if Array1 < 10
      Return True
  Else
      Return False
}

; Only do this within a command prompt window on Windows 8 and below
#If PreWin10() and WinActive("ahk_class ConsoleWindowClass")
^v::
+Insert::
s = %clipboard%
StringReplace, s, s, `r, , All
SendInput {Raw}%s%
Return
#If
