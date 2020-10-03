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

if(!NexssStdout._button){
    NexssStdout._button:="Left"
}

DetectHiddenWindows, On
CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.

STDOUT := FileOpen("*", "w")

Switch NexssStdout._button
{
    Case "Left","Middle","Right":
    Default:
        NexssStdout._button:="Left"
}

if(NexssStdout._double){
    MouseClick, %NexssStdout%._button, , , 2
}else{
    MouseClick, %NexssStdout%._button,
}

NexssStdout := JSON.Dump(NexssStdout)

STDOUT.Write(NexssStdout)
