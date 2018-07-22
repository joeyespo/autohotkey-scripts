; By Joe Esposito

#include Helpers.ahk

; Only do this within Explorer
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class Progman") or WinActive("ahk_class WorkerW")
!^d::
selected := Explorer_GetSelected()
If (selected = "")
{
  MsgBox % "Could not rename file -- no files selected."
  Return
}

Elements := StrSplit(selected, "`n")
For Index, Element in Elements
{
  SplitPath, Element, Filename, FileDir
  StringLeft, FileDot, Filename, 1
  If (FileDot = ".")
  {
    Renamed := SubStr(Filename, 2)
  }
  Else
  {
    Renamed := "." . Filename
  }
  Filename := FileDir . "\" . Filename
  NewName := FileDir . "\" . Renamed
  If InStr(FileExist(Filename), "D")
  {
    FileMoveDir, %Filename%, %NewName%
  }
  Else
  {
    FileMove, %Filename%, %NewName%
  }
  Send {F5}{Home}
  Sleep 250
  Send %Renamed%
}
Return
#If

; Do this anywhere else
#If !WinActive("ahk_class CabinetWClass") and !WinActive("ahk_class Progman")
!^d::
MsgBox % "Could not rename file -- Windows Explorer is not focused."
Return
#If
