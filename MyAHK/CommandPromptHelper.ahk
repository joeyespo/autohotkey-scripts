; Origin: http://www.howtogeek.com/howto/25590/how-to-enable-ctrlv-for-pasting-in-the-windows-command-prompt/

#IfWinActive ahk_class ConsoleWindowClass
^V::
s = %clipboard%
StringReplace, s, s, `r, , All
SendInput {Raw}%s%
return
#IfWinActive
