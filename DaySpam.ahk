#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input
SetWorkingDir %A_ScriptDir% 
;CoordMode Pixel 

StartSpamming() ;Hit enter every n milliseconds
{
	global spamming
	spamming := true
	SoundBeep, 400, 500
	
	n = 500
	screenWidth := A_ScreenWidth / 2
	screenHeight := (A_ScreenHeight / 2) + 50

	while (spamming)
	{
		sleep, %n%
		MouseMove, %screenWidth%, %screenHeight%
		;DllCall("SetCursorPos", int, int(%screenWidth%), int, int(%screenHeight%))
		Send, {Enter}
	}
}

StopSpamming() 
{
	global spamming
	spamming := false
	SoundBeep, 300, 500
}

^1:: ; Ctrl+1 - Start spamming	
	StartSpamming()
return

^2:: ; Ctrl+2 - Stop spamming
	StopSpamming()
return
	
; Ctrl+3 - Stop the script
^3:: 
	SoundBeep, 200, 500
	ExitApp
return

^4:: ; Ctrl+4 - kill DayZ process
	process, close, DayZ.exe
return
	
#IfWinActive DayZ
{
	^1:: ; Ctrl+1 - Start spamming
		StartSpamming()
	return

	^2:: ; Ctrl+2 - Stop spamming
		StopSpamming()
	return
	
	^3::
		SoundBeep, 300, 500
	return

	^4:: ; Ctrl+4 - kill DayZ process
		process, close, DayZ.exe
	return
}
