; Basic functionalities for keyboards without dedicated media keys
^!Left::Send   {Media_Prev} 		; Ctrl+Alt+Left
^!Right::Send  {Media_Next} 		; Ctrl+Alt+Right
!Space::Send   {Media_Play_Pause} 	; Alt+Space
!Up::Send {Volume_Up} 				; Alt+Up
!Down::Send  {Volume_Down}			; Alt+Down
!m::Send  {Volume_Mute}				; Alt+M

; Added functionality for media control using the mouse
Mbutton & LButton::Send   {Media_Prev}	; Prev/Next with middle button
Mbutton & Rbutton::Send  {Media_Next}	; + left/right button click
Mbutton::Send   {Media_Play_Pause}		; Pause/Play on middle button click

; Volume Up/Down when scrolling from tray
#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::Send {Volume_Up}
WheelDown::Send {Volume_Down}

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}