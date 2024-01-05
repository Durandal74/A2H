SetTitleMatchMode, 2 ; Coincidir de manera parcial el título de la ventana

; Obtener la ruta del emulador
RutaEmulador := A_ScriptDir . "\..\..\program\emu\emy\Yuzu Early Access\yuzu.exe"

; Obtener la ruta del ROM desde los parámetros de línea de comandos
RutaROM := A_Args[1]

; Ejecutar el ROM (juego) con el emulador
Run, %RutaEmulador% -f -g "%RutaROM%" ,,Min

; Hotkey para cerrar el script cuando se presiona Escape
Escape::
    CloseAndExit("yuzu.exe")
    return

; Esta línea es necesaria para que el script no continúe con la parte de F10 sin ser invocado.
return

; Hotkey para activar la ventana del juego, maximizarla y enviar teclas al presionar F10
F10::
    ; Activar la ventana del juego y maximizarla
    WinActivate, ahk_exe yuzu.exe
    WinMaximize

    ; Asegurarse de que la ventana esté activa antes de enviar teclas
    ; WinWaitActive, ahk_exe yuzu.exe, , 2
	
	; Enviar la tecla F4
    ; Send, {F4}

    return
	
CloseAndExit(processName) {
    Process, Close, %processName%
    Run, taskkill /im "%processName%" /F
    ExitApp
}
