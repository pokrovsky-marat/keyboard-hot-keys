#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

IfTextSelected(ifTrue,ifFalse){
  clipboard := ""
  Send, ^c
  If(clipoard)
    Send, %ifTrue%
  else
    Send %ifFalse%
}

ClipboardWrapper(InputLine){
  temp_clipboard:= clipboard
  clipboard:=""
  SendInput %InputLine%
  Sleep, 100
  clipboard:=temp_clipboard
  return
}
isAltPressed(ifTrue,ifFalse){
  if GetKeyState("Alt")
    Send %ifTrue%
  else
    Send %ifFalse%    
  return
}

DoubleLine(){
  ClipboardWrapper("{End}+{Home}^c{End}{Enter}^v")
}
MoveLineDown()
{
  ClipboardWrapper("{End}+{Home}^c+{Home}{Delete}{Delete}{End}{Enter}^v")
}
; Double {home} to select spaces and tabs
MoveLineUp()
{
  ClipboardWrapper("{End}+{Home}^c+{Home}{Delete}{Delete}{Up}^v{Enter}{Up}")
} 
