SetTitleMatchMode, 2 ; Coincidir de manera parcial el título de la ventana

; Obtener la ruta del emulador desde los parámetros
EmulatorPath := A_Args[1]
; Obtener la ruta del juego desde los parámetros
GamePath := A_Args[2]
; Obtener la parte del título de la ventana desde los parámetros
PartialTitle := A_Args[3]

; Ejecutar el juego con el emulador
Run, %EmulatorPath% --no-gui "%GamePath%" ,,Min

; Obtener el título completo de la ventana desde los parámetros
TituloVentana := A_Args[3]

; Hotkey para cambiar de ventana al presionar F10
F10::
    ; Activar directamente la ventana del juego
    WinActivate, %TituloVentana%
    ; Maximizar la ventana
    WinMaximize
return

; Hotkey para cerrar el script cuando se presiona Escape
Escape::
    CloseAndExit("rpcs3.exe")
    return

CloseAndExit(processName) {
    Process, Close, %processName%
    Run, taskkill /im "%processName%" /F
    ExitApp    
}