; By Joe Esposito

#include Helpers.ahk

; Only do this within Explorer
#If WinActive("ahk_class CabinetWClass") or WinActive("ahk_class Progman") or WinActive("ahk_class WorkerW")
+^d::
Selected := Explorer_GetSelected()
If (Selected = "")
{
  SoundPlay *-1
  SoundPlay *-1
  Return
}
IsDesktopFocused := (Explorer_GetWindow(hwnd) == "desktop")

Elements := StrSplit(Selected, "`n")
For Index, Element in Elements
{
  SplitPath, Element, Name, FileDir, FileExt

  If (FileExt)
  {
    Name := SubStr(Name, 1, -(StrLen(FileExt) + 1))
  }

  SepPos := InStr(Name, " - ", false, -1)
  If (SepPos)
  {
    Name := SubStr(Name, 1, SepPos - 1)
  }

  Path := FileDir . "\" . Name
  If (FileExist(Path) == "")  ; TODO: And only if the file is not a directory
  {
    FileCreateDir, %Path%
  }

  Send {F5}
  If (IsDesktopFocused)
  {
    Sleep, 100
  }
  Send {Home}
  Send %Name%
  Send {F2}
}
Return
#If

; Do this anywhere else
#If !WinActive("ahk_class CabinetWClass") and !WinActive("ahk_class Progman")
!^n::
+#n::
MsgBox "Could not create directory -- Windows Explorer is not focused."
Return
#If
