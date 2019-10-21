; Nexss PROGRAMMER 2.0.0 - Auto Hot Key
; Default template for JSON Data
; SETUP
SetBatchLines, -1 ; For superior speed
CoordMode, Tooltip, Screen		; Work with the screen rather than the window
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

#NoEnv 
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include ./3rdPartyLibraries/AutoHotkey-JSON/JSON.ahk
; STDIN
STDIN := FileOpen("*", "r")
NexssStdin := STDIN.Read()
NexssStdout := JSON.load(NexssStdin)

; Modify Data
; NexssStdout.ahkOutput := "Hello from AHK! " . A_AhkVersion


if(! NexssStdout.image){
    MsgBox You must provide the image parameter
}else{
    CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
    cwd := NexssStdout.cwd
    image:=NexssStdout.image
    ImageVar = %cwd%\%image%
    STDOUT := FileOpen("*", "w")
    ; STDOUT.Write(ImageVar)
    IfNotExist, %ImageVar%
        {
            MsgBox Error: File %ImageVar% not found
            Exit
        }
    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %ImageVar%

    
    ; ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *Icon3 %A_ProgramFiles%\SomeApp\SomeApp.exe
    if (ErrorLevel = 2)
    {
        MsgBox Could not conduct the search.
        NexssStdout.nexss := "Could not conduct the search."
    }
    else if (ErrorLevel = 1)
    {
        NexssStdout.nexss := "Image could not be found on the screen."
        MsgBox Image could not be found on the screen.
    }
    else
    {
        NexssStdout.nexss := "ok"
        ; MsgBox The image was found at %FoundX%x%FoundY%.
        MouseMove, %FoundX%, %FoundY%
    }

    ; STDOUT
    if(FoundX){
        NexssStdout.FoundX := FoundX
    }
    if(FoundY){
        NexssStdout.FoundY := FoundY
    }
    
    NexssStdout := JSON.Dump(NexssStdout)
    
    STDOUT.Write(NexssStdout)

}
