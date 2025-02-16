; ::MsgBox "Hello World!"
^!r:: Reload
Alt & LButton::MButton
!v:: Send "#v"
!e:: Run "explorer"
!n:: Run "notepad.exe"
#n:: Run "notepad++.exe"
^q:: Send "!{F4}"

LAlt & 1:: Send "{F5}"
LAlt & 2:: Send "{F2}"

; 윈도우키 + 화살표
LAlt & x:: SendEvent "{LWin Down}{Up Down}{Up Down}{LWin Up}"
LAlt & z:: SendEvent "{LWin Down}{Down Down}{Down Down}{LWin Up}"
LAlt & q:: Send "^{Home}"
LAlt & e:: Send "^{End}"
LAlt & Space:: Send "{PgDn}"
#HotIf GetKeyState("LShift", "P")
{
    LALt & Space:: Send "{PgUp}"
}

; 한자키매핑
F1:: Send "{SC1F1}"

; !+::Send "RAlt"
; 한영키 전환
; LALt & LShift::Send "{vk15sc138}"

^+1:: Send "#+s" ; Open Snipping Tool
^+2:: Send "{Alt Down}{PrintScreen Down}{Alt Up}{PrintScreen Up}" ; Capture current window
^+3:: Send "#+c" ; MS PowerToys Color Picker
^+4::
{
    run "SnippingTool.exe"
    Sleep(300)
    Send "^n"
}

; /*** Google Chrome ***/
#HotIf WinActive("ahk_exe Chrome.exe")
^d:: return

; ; /*** Source Tree ***/
#HotIf WinActive("ahk_exe SourceTree.exe") && GetKeyState("Shift", "P")
{
    ; プル
    Ctrl & d:: Send "^+l"
    ; 選択のログを表示
    Ctrl & q:: Send "+!l"
}

; VSCode 폴더 열기
#HotIf WinActive("ahk_exe Code.exe")
{
    !e::
    {
        Send "^k"
        ; Sleep 10
        Send "r"
    }
}

; mouse pointer control
SetCursor(mx, my) {
    CoordMode "Mouse", "Screen"
    MouseGetPos &X, &Y
    X += mx
    Y += my
    DllCall("SetCursorPos", "int", X, "int", Y)
}
#HotIf GetKeyState("F13", "P")
{
    Left:: SetCursor(-10, 0)
    Right:: SetCursor(10, 0)
    Up:: SetCursor(0, -10)
    Down:: SetCursor(0, 10)

    Ctrl & Left:: SetCursor(-100, 0)
    Ctrl & Right:: SetCursor(100, 0)
    Ctrl & Up:: SetCursor(0, -100)
    Ctrl & Down:: SetCursor(0, 100)

    LShift::LButton
    d::MButton
    s::RButton
    f:: Send "{Click 2}"
}
; =======================================================================================
; "Insert" to "F13" *.reg
; Ctrl + r :: Regedit.exe
; https://learn.microsoft.com/ko-kr/windows/win32/inputdev/about-keyboard-input

; Windows Registry Editor Version 5.00

; [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
; "Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,64,00,52,E0,00,00,00,00
; =======================================================================================
