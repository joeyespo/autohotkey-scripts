; By Joe Esposito
; Origin: https://www.autohotkey.com/boards/viewtopic.php?t=60831

#include Helpers.ahk

On_Notepad_Active(event, hwnd)
{
    ; Use "A_ScriptHwnd" in use instead the above "hWnd" variable
    ; https://autohotkey.com/board/topic/80644-how-to-hook-on-to-shell-to-receive-its-messages/
    Static RunAtScriptExecution1 := DllCall("RegisterShellHookWindow", UInt, A_ScriptHwnd)
    Static SH_MsgNum := DllCall("RegisterWindowMessage", Str, "SHELLHOOK")

    ; MaxThreads = 1000
    ; Func("Name_Of_Function") is recommended instead "Name_Of_Function" only
    Static RunAtScriptExecution2 := OnMessage(SH_MsgNum, Func("On_Notepad_Active"), 1000)

    ; HSHELL_WINDOWACTIVATED = 4
    ; HSHELL_RUDEAPPACTIVATED = 32772
    if ((event == 32772) || (event == 4))
    {
        WinGetClass, Class_Found, % "ahk_id" hwnd
        if (Class_Found == "CabinetWClass" || (Class_Found == "ExploreWClass"))
        {
            CenterWindowById(hwnd)
        }
    }
}
