; By Joe Esposito

; Only do this within Explorer
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class Progman") or WinActive("ahk_class WorkerW")
!^n::Send {Esc}{F5}{Appskey}{w}{t}
Return
#If

; Do this anywhere else
#If !WinActive("ahk_class CabinetWClass") and !WinActive("ahk_class Progman")
!^n::
MsgBox "Could not create new Text Document -- Windows Explorer is not focused."
Return
#If
