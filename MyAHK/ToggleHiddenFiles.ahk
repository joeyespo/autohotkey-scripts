; By How-To Geek
; Modified by Joe Esposito
; Origin: http://www.howtogeek.com/howto/keyboard-ninja/keyboard-ninja-toggle-hidden-files-with-a-shortcut-key-in-windows/

; WINDOWS KEY + H TOGGLES HIDDEN FILES
#h:: 
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden 
If HiddenFiles_Status = 2  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
Else  
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 
WinGetClass, eh_Class,A 
If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA") 
send, {F5} 
Else
PostMessage, 0x111, 28931,,, A 
Return
