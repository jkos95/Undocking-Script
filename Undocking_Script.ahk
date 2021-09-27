#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force
DetectHiddenWindows,OFF

ArrayWinID := []
ArrayXpos := []
ArrayYpos := []
ArrayWidth := []
ArrayHeight :=[]


Gui, Add, Text, x75 y30, Ready to un-dock your PC?
Gui, Add, Button, x90 w100, Yes
Gui, Add, Button, w100, No
Gui, Show, w275 h150, Jeff's Window Saver

Return

ButtonYes:

	WinGet windows, List 

	Loop %windows%
	{
		id := windows%A_Index%
		
		WinGetTitle wt, ahk_id %id%
		WinGetPos X, Y, W, H, %wt%
		
		ArrayWinID[A_index] := id
		ArrayXpos[A_index] := X
		ArrayYpos[A_index] := Y
		ArrayWidth[A_index] := W
		ArrayHeight[A_index] := H
		
	}

	Gui, Destroy

	MsgBox, Windows saved! `n`nWhen ready to re-dock, open the minimized AutoHotKey window and click the button

	gosub WindowRestoreSub

	Return
	
	
ButtonNo:
	
	ExitApp
	
	
WindowRestoreSub:	
	Gui, 2: Add, Text, x50 y30, Click this button AFTER re-docking your PC to snap your windows back to their previous position!
	Gui, 2: Add, Button, x225 y75 h50 w125, Restore Windows
	Gui, 2: Show, w550 h150, Restore Windows
	Gui, 2:Minimize

	Return

	2ButtonRestoreWindows:

		Counter = 1
		
		Loop % ArrayWinID.length()
		{
			id := ArrayWinID[Counter]
			
			WinMove, ahk_id %id%,, ArrayXpos[Counter], ArrayYpos[Counter], ArrayWidth[Counter], ArrayHeight[Counter],,
			
			Counter += 1
		}

		ExitApp
		
		Return	
	




;          -------------  EXAMPLE  -------------
; Below is a commented-out copy of the above script to explain what each part is for. 

;ArrayWinID := []
;ArrayXpos := []
;ArrayYpos := []
;ArrayWidth := []
;ArrayHeight :=[]
;-------The above declares the arrays used to store window information---

;Gui, Add, Text, x75 y30, Ready to un-dock your PC?
;Gui, Add, Button, x90 w100, Yes
;Gui, Add, Button, w100, No
;Gui, Show, w275 h150, Jeff's Window Saver
;-------Created a GUI window with text and 2 buttons. widths and heights set, as well as certain x/y positions

;Return
;-------Pauses script

;ButtonYes:
;-------If yes button is clicked, do this
	
	;WinGet windows, List 
;-------Finds all open windows on the computer and puts them in a list

	;Loop %windows%
	;{
;-------Creates a loop, and loops the number of times equal to the number of windows found by WinGet
		
		;id := windows%A_Index%
;-------creates a variable and assigns the windows unique ID to it. Updates on every pass to account for every window so it can be saved to an array

		;WinGetTitle wt, ahk_id %id%
;-------Gets the title of each window (ex. Untitled - Notepad) and assigns the value to a variable 

		;WinGetPos X, Y, W, H, %wt%
;-------Grabs the X,Y position and height/width of each window by its title. Assigns the values to X/Y/H/W
		
		;ArrayWinID[A_index] := id
		;ArrayXpos[A_index] := X
		;ArrayYpos[A_index] := Y
		;ArrayWidth[A_index] := W
		;ArrayHeight[A_index] := H
;-------Arrays to store every window's X/Y position, height, width, and unique windows ID. 1 new value is saved to each array per pass until all windows are accounted for. 
		
	;}

	;Gui, Destroy
;-------closes the first GUI window after clicking the yes button	

	;MsgBox, Windows saved! `n`nWhen ready to re-dock, open the minimized AutoHotKey window and click the button
;-------Popup box to show the windows positions/sizes were all saved and it is safe to undock.

	;gosub WindowRestoreSub
;-------Jumps down to subroutine for yes button

	;Return
;-------Pause	
	
;ButtonNo:
;-------Happens if no is clicked instead of yes
	
	;ExitApp
;-------Kills the app if user is not ready to undock	
	
	
;WindowRestoreSub:
;-------Subroutine of yes button. 	

	;Gui, 2: Add, Text, x50 y30, Click this button AFTER re-docking your PC to snap your windows back to their previous position!
	;Gui, 2: Add, Button, x225 y75 h50 w125, Restore Windows
	;Gui, 2: Show, w550 h150, Restore Windows
	;Gui, 2:Minimize
;-------Creates a new GUI for when the PC is ready to redock. Windows are saved at this point, and this GUI is minimized right after it is created. This button will force all windows back to their original positions when re-docked.	

	;Return
;-------Pause	

	;2ButtonRestoreWindows:
;-------When the restore windows button is clicked.	

		;Counter = 1
;-------Counter variable to recursively loop through the values of all the window info arrays. Value starts at 1 instead of 0 like many OOP languages.
		
		;Loop % ArrayWinID.length()
		;{
;-------Starts loop. Loops the number of times equal to the number of window IDs stored in the ArrayWinID
		
			;id := ArrayWinID[Counter]
;-------Assigns the current iteration of ArrayWinID to the "id" variable. 
			
			;WinMove, ahk_id %id%,, ArrayXpos[Counter], ArrayYpos[Counter], ArrayWidth[Counter], ArrayHeight[Counter],,
;-------		Moves the windows. Uses the unique ID stored in ArrayWinID to find the window, then assigns it the saved X/Y position, width, and height that was recorded before undocking. This recalls the saved info and forces the windows back into place.
		
			;Counter += 1
;-------Increments the counter by 1 each pass. This is how it moves through the Array (ex. ArrayValue[1], then [2]. etc for each loop iteration.
		;}

		;ExitApp
;-------Kills the script from the background once the task is completed.		
		
		;Return	