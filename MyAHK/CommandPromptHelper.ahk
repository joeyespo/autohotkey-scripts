; By How-To Geek
; Modified by Joe Esposito
; Origin: http://www.howtogeek.com/howto/25590/how-to-enable-ctrlv-for-pasting-in-the-windows-command-prompt/

#IfWinActive ahk_class ConsoleWindowClass
^v::
s = %clipboard%
StringReplace, s, s, `r, , All
SendInput {Raw}%s%
return
#IfWinActive
