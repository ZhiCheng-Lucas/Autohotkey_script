#SingleInstance Force
SetBatchLines, -1
; Initialize variables
isToggled := false
clickDelay := 50  ; Delay between clicks in milliseconds

; q key toggles the rapid left click
q::
    isToggled := !isToggled
    if (isToggled) {
        SetTimer, PerformLeftClick, %clickDelay%
        ToolTip, Left Click Auto-Press: ON
    } else {
        SetTimer, PerformLeftClick, Off
        ToolTip, Left Click Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; w key turns off the toggle
w::
    if (isToggled) {
        isToggled := false
        SetTimer, PerformLeftClick, Off
        ToolTip, Left Click Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; Function to perform left click
PerformLeftClick:
    Click
return