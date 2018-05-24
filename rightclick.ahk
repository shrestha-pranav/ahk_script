; Extension for Windows Virtual Desktop switching
; Switches left/right when right button is held and
; mouse is moved left/right by 200+ pixels in 0.3s
; else normal right mouse button functionality is preserved
; @author : Pranav Shrestha

RButton::
    MouseGetPos, m_x1, m_y1
    keywait, rbutton, t0.3
    if errorlevel = 0
    {
        mouseclick, right
        return
    }
    MouseGetPos, m_x2, m_y2
    if ( m_x2 > m_x1 + 200 )
        Send ^#{Right}
    else if ( m_x2 < m_x1 - 200 )
        Send ^#{Left}
return