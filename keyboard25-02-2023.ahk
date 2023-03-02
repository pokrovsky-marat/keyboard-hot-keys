#NoEnv
SendMode Input
SetMouseDelay,-1 ;remove delays from mouse actions
SetDefaultMouseSpeed, 0

;Отключаем Capslock
SetCapsLockState AlwaysOff

;Reload Script, convinient while developing
^#!Space::Reload

; Смена раскладки
LAlt & RAlt::SendInput {Shift}

;Делаем
RAlt::RControl

;Работа с мышкой
#Include %A_ScriptDir%\mouse.ahk
;Работа с клавишей <Ctrl>
#Include %A_ScriptDir%\vs_code_exaptions.ahk
;Подключаем кастомные функции
#Include %A_ScriptDir%\functions.ahk

; Просто пробел это пробел, пробел с другими клавишами меняет значение.
; Если других горячих клавиш с пробелом не будет то работать не будет

; Basic movement without {Blind} Shift doesn't select
CapsLock & j::Left
CapsLock & l::Right
CapsLock & i::
  if GetKeyState("Alt")
    MoveLineUp()
  else
    Send {Blind}{Up}
return
CapsLock & k::
  if GetKeyState("Alt")
    MoveLineDown()
  else
    Send {Blind}{Down}
return

; Emulate PgUp, PgDn, Home, End buttons.
CapsLock & h::Home
CapsLock & SC027::End
CapsLock & u::PgUp
CapsLock & n::PgDn

;delete button <p>
CapsLock & p::Delete

; Copy line and add below
CapsLock & o::
  DoubleLine()
return
CapsLock & Enter::Send,{End}{Enter}
;Select line
CapsLock & SC033::Send,{End}+{Home}^x
CapsLock & SC034::Send,{End}+{Home}
CapsLock & SC035::Send,^{Right}+^{Left}

