; By Joe Esposito

#include Helpers.ahk

!^v::
  ExplorerPath := Explorer_GetPath()
  If ErrorLevel
    ExplorerPath := A_Desktop

  Target := Clipboard
  If FileExist(Target)
  {
    SplitPath, Target, Filename, FileDir, FileExt
    ExtLen := 0
    If (FileExt = "lnk")
    {
      ExtLen := StrLen(FileExt) + 1
    }
    LinkTitle := SubStr(Filename, 1, StrLen(Filename) - ExtLen) . ".lnk"
    LinkFile := ExplorerPath . "\" . LinkTitle
    FileCreateShortcut, %Target%, %LinkFile%
    If (ErrorLevel = 0)
    {
      Loop
      {
        If FileExist(LinkFile)
          Break
        Sleep 250
      }
      Sleep 100
      Send {F5}{Home}
      Sleep 250
      TypeLinkTitle := SubStr(Filename, 1, 8)
      Send %TypeLinkTitle%
    }
  }
Return
