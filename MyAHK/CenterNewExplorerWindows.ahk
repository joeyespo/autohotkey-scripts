; By Joe Esposito
; Origin: https://www.autohotkey.com/boards/viewtopic.php?t=60831

#include Helpers.ahk

On_Message(event, hwnd)
{
    ; Register event handler on script execution
    ; https://autohotkey.com/board/topic/80644-how-to-hook-on-to-shell-to-receive-its-messages/
    ; Use "A_ScriptHwnd" instead the above "hWnd" variable
    ; Use Func("Name_Of_Function") instead of "Name_Of_Function" only
    ; MaxThreads = 1000
    Static SH_MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")
    Static RunAtScriptExecutionRegister := DllCall("RegisterShellHookWindow", UInt, A_ScriptHwnd)
    Static RunAtScriptExecution := OnMessage(SH_MsgNum, Func("On_Message"), 1000)

    ; Check for activate event
    ; HSHELL_WINDOWACTIVATED = 4
    ; HSHELL_RUDEAPPACTIVATED = 32772
    if ((event <> 4) && (event <> 32772))
    {
        Return
    }

    ; Check for Explorer window
    WinGetClass, ClassValue, % "ahk_id" hwnd
    If ((ClassValue <> "CabinetWClass") && (ClassValue <> "ExploreWClass"))
    {
        Return
    }

    ; Check current window state and center only if in the "restored" state
    WinGet MinMaxState, MinMax, % "ahk_id" hwnd
    If (MinMaxState <> 0)
    {
        Return
    }

    ; Center the new Explorer window
    CenterWindowById(hwnd)
}
