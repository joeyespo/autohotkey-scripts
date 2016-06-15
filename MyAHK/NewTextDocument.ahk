; By Joe Esposito

; Only do this within Explorer
#IfWinActive ahk_class CabinetWClass
+#n::Send, !{f}{w}{t}
Return
#IfWinActive

; Do this anywhere else
#IfWinNotActive ahk_class CabinetWClass
+#n::
MsgBox "Could not create new Text Document -- Windows Explorer is not focused."
Return
#IfWinActive


; https://gist.github.com/davejamesmiller/1965432
; Only run when Windows Explorer is active
; (Note: If this doesn't work, try ExploreWClass instead)
#IfWinActive ahk_class CabinetWClass
^!n::
    ; Get full path from open Explorer window
    WinGetText, FullPath, A

    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n

    ; Get first item
    FullPath = %PathArray1%

    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^Address: )", "")
    StringReplace, FullPath, FullPath, `r, , all

    ; Change working directory
    SetWorkingDir, %FullPath%

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, Enter new text file name, , , 250, 100

    ; User pressed cancel
    If ErrorLevel
        Return

    ; Create file
    FileAppend, , %UserInput%.txt

    Return
#IfWinActive
