; Nexss PROGRAMMER 2.0.0 - Auto Hot Key
; Default template for JSON Data
; SETUP
#NoEnv 
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir% 
#Include ../../3rdPartyLibraries/AutoHotkey-JSON/JSON.ahk
; STDIN
STDIN := FileOpen("*", "r")
NexssStdin := STDIN.Read()
NexssStdout := JSON.load(NexssStdin)

; Modify Data
; NexssStdout.ahkOutput := "Hello from AHK! " . A_AhkVersion
; NexssStdout.test := "test"
CoordMode, Mouse, Screen
MouseMove, NexssStdout.x, NexssStdout.y
; NexssStdout.moved := "MOVED TO: " . NexssStdout.x . " x " . NexssStdout.y
; STDOUT
NexssStdout := JSON.Dump(NexssStdout)
STDOUT := FileOpen("*", "w")
STDOUT.Write(NexssStdout)
