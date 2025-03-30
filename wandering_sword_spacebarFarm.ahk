#SingleInstance Force
SetBatchLines, -1

; Initialize variables
isToggled := false
pressDelay := 50  ; Delay between presses in milliseconds

; q key toggles the rapid spacebar press
q::
    isToggled := !isToggled
    if (isToggled) {
        SetTimer, PressSpacebar, %pressDelay%
        ToolTip, Spacebar Auto-Press: ON
    } else {
        SetTimer, PressSpacebar, Off
        ToolTip, Spacebar Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; w key turns off the toggle
w::
    if (isToggled) {
        isToggled := false
        SetTimer, PressSpacebar, Off
        ToolTip, Spacebar Auto-Press: OFF
        Sleep, 1000
        ToolTip
    }
return

; Function to press spacebar
PressSpacebar:
    Send, {Space}
return