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
    Source := ""
    If (FileExt = "lnk")
    {
      ExtLen := StrLen(FileExt) + 1
    }
    Else If (StrLen(FileExt) == 0)
    {
      CurrentFileDir := FileDir
      Loop
      {
        SplitPath, CurrentFileDir, ParentFilename, ParentFileDir
        CurrentFileDir := ParentFileDir

        If (ParentFilename = "timeline")
          Continue

        ParentFilenameChar := SubStr(ParentFilename, 1, 1)
        If ParentFilenameChar is Number
          Continue

        If (StrLen(ParentFilename) > 0)
          Source := " (" . ParentFilename . ")"

        Break
      }
    }
    LinkTitle := SubStr(Filename, 1, StrLen(Filename) - ExtLen) . Source . ".lnk"
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
