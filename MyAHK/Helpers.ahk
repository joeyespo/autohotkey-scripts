; https://autohotkey.com/docs/commands/WinMove.htm
CenterWindow(WinTitle)
{
  WinGet, WinState, MinMax, %WinTitle%
  if WinState = 0  ; Only if the window isn't maximized
  {
    WinGetPos,,, Width, Height, %WinTitle%
    WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
  }

}

CenterWindowById(WinId)
{
  WinGet, WinState, MinMax, ahk_id %WinId%
  if WinState = 0  ; Only if the window isn't maximized
  {
    WinGetPos,,, Width, Height, ahk_id %WinId%
    WinMove, ahk_id %WinId%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
  }

}

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

; https://autohotkey.com/board/topic/60985-get-paths-of-selected-items-in-an-explorer-window/
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
      if (window And window.hwnd==hwnd)
        return window
  }
  else if (class ~= "Progman|WorkerW")
    return "desktop" ; desktop found
}

; https://autohotkey.com/board/topic/60985-get-paths-of-selected-items-in-an-explorer-window/
Explorer_GetAll(hwnd="")
{
  return Explorer_Get(hwnd)
}
Explorer_GetSelected(hwnd="")
{
  return Explorer_Get(hwnd,true)
}
Explorer_Get(hwnd="",selection=false)
{
  if !(window := Explorer_GetWindow(hwnd))
    return ErrorLevel := "ERROR"
  if (window="desktop")
  {
    ControlGet, hwWindow, HWND,, SysListView321, ahk_class Progman
    if !hwWindow ; #D mode
      ControlGet, hwWindow, HWND,, SysListView321, A
    ControlGet, files, List, % ( selection ? "Selected":"") . "Col1",,ahk_id %hwWindow%
    base := SubStr(A_Desktop,0,1)=="\" ? SubStr(A_Desktop,1,-1) : A_Desktop
    Loop, Parse, files, `n, `r
    {
      path := base "\" A_LoopField
      ret .= path "`n"
    }
  }
  else
  {
    if selection
      collection := window.document.SelectedItems
    else
      collection := window.document.Folder.Items
    for item in collection
      ret .= item.path "`n"
  }
  return Trim(ret,"`n")
}
