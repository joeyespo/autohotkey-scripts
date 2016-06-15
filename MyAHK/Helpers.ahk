; Source:
; https://autohotkey.com/board/topic/60985-get-paths-of-selected-items-in-an-explorer-window/

Explorer_GetPath(hwnd="")
{
  if !(window := Explorer_GetWindow(hwnd))
    return ErrorLevel := "ERROR"
  if (window="desktop")
    return A_Desktop
  path := window.LocationURL
  path := RegExReplace(path, "ftp://.*@","ftp://")
  StringReplace, path, path, file:///
  StringReplace, path, path, /, \, All

  ; thanks to polyethene
  Loop
    If RegExMatch(path, "i)(?<=%)[\da-f]{1,2}", hex)
      StringReplace, path, path, `%%hex%, % Chr("0x" . hex), All
    Else Break
  return path
}

Explorer_GetWindow(hwnd="")
{
  ; thanks to jethrow for some pointers here
  WinGet, process, processName, % "ahk_id" hwnd := hwnd? hwnd:WinExist("A")
  WinGetClass class, ahk_id %hwnd%

  if (process!="explorer.exe")
    return
  if (class ~= "(Cabinet|Explore)WClass")
  {
    for window in ComObjCreate("Shell.Application").Windows
      if (window.hwnd==hwnd)
        return window
  }
  else if (class ~= "Progman|WorkerW")
    return "desktop" ; desktop found
}
