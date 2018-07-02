; Basic functionalities for keyboards without dedicated media keys
^!Left::Send   {Media_Prev} 		; Ctrl+Alt+Left
^!Right::Send  {Media_Next} 		; Ctrl+Alt+Right
!Space::Send   {Media_Play_Pause} 	; Alt+Space
!Up::Send {Volume_Up} 				; Alt+Up
!Down::Send  {Volume_Down}			; Alt+Down
!m::Send  {Volume_Mute}				; Alt+M

; Added functionality for media control using the mouse
~Lbutton & XButton1::Send	{Media_Prev}
~Lbutton & Xbutton2::Send	{Media_Next}

; Switch virtual desktops
~Rbutton & XButton1::Send ^#{Left}
~Rbutton & XButton2::Send ^#{Right}

; CapsLock arrow key modifiers
CapsLock::Send {} ; Disable CapsLock first
CapsLock & Left::Send {Home}
CapsLock & Right::Send {End}
CapsLock & Up::Send {Volume_Up}
CapsLock & Down::Send {Volume_Down}

; Add Ctrl+Shift+W support on Windows
^+W::Send !{f4}
; PostMessage, 0x112, 0xF060,,, WinTitle, WinText
; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE

; Always on Top Script
^+A:: Winset, Alwaysontop, toggle, A

; Volume Up/Down when scrolling from tray
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}
~Xbutton1 & Xbutton2::Send	{Media_Play_Pause}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}