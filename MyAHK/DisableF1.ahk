; By Joe Esposito
; Turns off the use of F1 to lower the odds of accidentally pressing it.
; Use Ctrl+F1 for normal F1 behavior instead.

F1::Return

^F1::
Hotkey, F1, off
SendInput {F1}
Hotkey, F1, on
Return
