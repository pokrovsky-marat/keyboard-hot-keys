;Отключаем Capslock
SetCapsLockState AlwaysOff

;move line up function
; Double {home} to select spaces and tabs
MoveLineUp()
{
  temp_clipboard:= clipboard
  clipboard:=""
  SendInput, {End}+{Home}+{Home}^x{Delete}{Up}^v{Enter}{Up}
  Sleep, 80
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

space & k::Send {Blind}{Down}

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