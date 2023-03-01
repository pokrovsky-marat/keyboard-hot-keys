#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

;Один раз на Capslock это  как левая кнопка мыши

CapsLock::RButton
CapsLock & Space::LButton

;Нажатие правой кнопки мыши, context menu
;Нажатие средней кнопки мыши
CapsLock & q::MButton

;Move mouse cursor left
CapsLock & a::MouseMove, -15,0,0, R
;Move mouse cursor right
CapsLock & d::MouseMove, 15,0,0, R

;Move mouse cursor top, or wheel up if <alt> pressed
CapsLock & w::
  if GetKeyState("Alt")
    Send {WheelUp 1}
  else
    MouseMove, 0,-15,0, R
return

;Move mouse cursor down
CapsLock & s::
  if GetKeyState("Alt")
    Send {WheelDown 1}
  else
    MouseMove, 0,15,0, R
return