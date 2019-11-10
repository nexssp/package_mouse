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
#Include 3rdPartyLibraries/AutoHotkey-JSON/JSON.ahk
; STDIN

STDIN := FileOpen("*", "r")
NexssStdin := STDIN.Read()
NexssStdout := JSON.load(NexssStdin)

; Modify Data
; NexssStdout.ahkOutput := "Hello from AHK! " . A_AhkVersion

if(!NexssStdout.button){
    NexssStdout.button:="Left"
}
DetectHiddenWindows, On
    CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.

    STDOUT := FileOpen("*", "w")
 
    Switch NexssStdout.button
    {
        Case "Left","Middle","Right":
        Default:
            NexssStdout.button:="Left"
    }

    if(NexssStdout.double){
        MouseClick, %NexssStdout%.button, , , 2
    }else{
        MouseClick, %NexssStdout%.button,
    }
    
    NexssStdout := JSON.Dump(NexssStdout)
    
    STDOUT.Write(NexssStdout)