; Nexss PROGRAMMER 2.0.0 - Auto Hot Key
; Default template for JSON Data
; SETUP
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
; NexssStdout.test := "test"
CoordMode, Mouse, Screen

if(! NexssStdout._x){
    MsgBox You must provide the _x parameter
    NexssStdout.nxsStop:=true
}

if(! NexssStdout._y){
    MsgBox You must provide the _y parameter
    NexssStdout.nxsStop:=true
}

MouseMove, NexssStdout._x, NexssStdout._y
; NexssStdout.moved := "MOVED TO: " . NexssStdout._x . " x " . NexssStdout._y
; STDOUT
NexssStdout := JSON.Dump(NexssStdout)
STDOUT := FileOpen("*", "w")
STDOUT.Write(NexssStdout)
