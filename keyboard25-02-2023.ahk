SetMouseDelay,-1 ;remove delays from mouse actions
SetDefaultMouseSpeed, 0
;Отключаем Capslock
SetCapsLockState AlwaysOff
;Reload Script, convinient while developing
^#!Space::Reload

;move line down
MoveLineDown()
{
  temp_clipboard:= clipboard
  clipboard:=""
  SendInput, {End}+{Home}^c+{Home}{Delete}{Delete}{End}{Enter}^v
  Sleep, 100
  ;Строка ниже может сработать быстрее чем команда сверху поэтому ставим таймер
  clipboard:=temp_clipboard
  return
}
;move line up function
; Double {home} to select spaces and tabs
MoveLineUp()
{
  temp_clipboard:= clipboard
  clipboard:=""
  SendInput, {End}+{Home}^c+{Home}{Delete}{Delete}{Up}^v{Enter}{Up}
  Sleep, 100
  ;Строка ниже может сработать быстрее чем команда сверху поэтому ставим таймер
  clipboard:=temp_clipboard
  return
}
; Просто пробел это пробел, пробел с другими клавишами меняет значение.
space::
  Send {Space}
return

; Basic movement without {Blind} Shift doesn't select
space & j::Send {Blind}{Left}
space & l::Send {Blind}{Right}
space & i::
  if GetKeyState("Alt")
    MoveLineUp()
  else
    Send {Blind}{Up}
return

space & k::
  if GetKeyState("Alt")
    MoveLineDown()
  else
    Send {Blind}{Down}
return

; Emulate PgUp, PgDn, Home, End buttons.
space & h::Send {Blind}{Home}
space & SC027::Send {Blind}{End}
space & u::Send {Blind}{PgUp}
space & n::Send {Blind}{PgDn}

; Call context menu
space & p::Send {AppsKey}

;For convenience. Change CTRL to spacebar
space & z::Send ^z
space & v::Send ^v
space & g::Send ^g

;Copy selection, or line if nothing is selected
space & c::
  clipboard := ""
  Send, ^c
  If(clipboard)
  {
    Send, ^c
  }
  else
  {
    Send {End}+{Home}^c{End}
  }
return

;Copy and remove selection, or line if nothing is selected
space & x::
  clipboard := ""
  Send, ^c
  If(clipboard)
  {
    Send, ^x
  }
  else
  {
    Send {End}+{Home}^x
  }
return

; Select word around cursor
space & d::Send ^{Right}^+{Left}

; Select line around cursor
space & f::
  Send {Home}
  Send +{End}
return

; Copy line and add below
space & a::
  temp_clipboard:= clipboard
  Send {End}+{Home}^c{End}{Enter}^v
  Sleep, 50
  clipboard:=temp_clipboard
return

;spacebar+ENTER=go to line below
space & enter::
  Send {End}
  Send {Enter}
return

; Fast delete
space & Backspace::Send ^{Backspace}
space & q::Send {Delete}

;Правый Альт стал контролом
RAlt::Ctrl
#IfWinActive
return

;Нажатие левой кнопки мыши
CapsLock & Space::LButton

;Нажатие левой кнопки мыши
CapsLock & f::RButton

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
