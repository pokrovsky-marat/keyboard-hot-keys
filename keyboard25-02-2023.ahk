;Отключаем Capslock
SetCapsLockState AlwaysOff

; Просто пробел это пробел, пробел с другими клавишами меняет значение.
space::
  Send {Space}
return 

; Basic movement
space & j::Send {Left}
space & l::Send {Right}
space & i::Send {Up}
space & k::Send {Down}

; Emulate PgUp, PgDn, Home, End buttons.
space & h::Send {Home}
space & SC027::Send {End}
space & u::Send {PgUp}
space & n::Send {PgDn}

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
space & s::Send ^{Right}^+{Left}

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
