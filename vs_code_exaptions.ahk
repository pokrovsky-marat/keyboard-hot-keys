;Исключения для VSCODE
#IfWinActive ahk_exe Code.exe
;Move top/down. Так как в vscode движение линий навороченней, то для него оставляем родные шоткаты.
  CapsLock & i::isAltPressed("!{Up}","{Blind}{Up}")
  CapsLock & k::isAltPressed("!{Down}","{Blind}{Down}")
  ; Copy line and add below
  CapsLock & o::+!down
  CapsLock & Enter::^Enter
  #If		; end of context-sensitive section