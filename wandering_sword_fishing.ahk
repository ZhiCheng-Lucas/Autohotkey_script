#SingleInstance Force
SetBatchLines, -1
; Initialize variables
isToggled := false
clickInterval := 2000  ; Time between clicks in milliseconds
pauseInterval := 500  ; Pause time after clicks in milliseconds

; q key toggles the rapid left click
q::
    isToggled := !isToggled
    if (isToggled) {
        SetTimer, ClickCycle, 10  ; Start the click cycle
        ToolTip, Left Click Auto-Press: ON
    } else {
        SetTimer, ClickCycle, Off
        ToolTip, Left Click Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; w key turns off the toggle
w::
    if (isToggled) {
        isToggled := false
        SetTimer, ClickCycle, Off
        ToolTip, Left Click Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; Function to handle the click cycle
ClickCycle:
    Click  ; First click
    Sleep, %clickInterval%  ; Wait for clickInterval
    Click  ; Second click
    Sleep, %pauseInterval%  ; Wait for pauseInterval before repeating
return