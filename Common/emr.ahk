; Common.ahk

SetTitleMatchMode, 2 ; Coincidir de manera parcial el título de la ventana

; Obtener la ruta del emulador
RutaEmulador := A_ScriptDir . "\..\sw\emr\Ryujinx.exe"

; Obtener la ruta del ROM desde los parámetros de línea de comandos
RutaROM := A_Args[1]

; Ejecutar el ROM con el emulador
Run, %RutaEmulador% --fullscreen "%RutaROM%" ,,Min

; Hotkey para cerrar el script cuando se presiona Escape
Escape::
    CloseAndExit("ryujinx.exe")
    return

; Esta línea es necesaria para que el script no continúe con la parte de F12 sin ser invocado.
return

; Hotkey para activar la ventana del juego, maximizarla y enviar teclas al presionar F12
F12::
    ; Activar la ventana del juego y maximizarla
    WinActivate, ahk_exe ryujinx.exe
    WinMaximize

    ; Asegurarse de que la ventana esté activa antes de enviar teclas
    WinWaitActive, ahk_exe ryujinx.exe, , 2

; Buscar y cerrar ventanas de error y control applet

    ; Buscar la ventana con el título "Error Code: 2203-0022"
    ErrorWindow := WinExist("Error Code: 2203-0022")
    if (ErrorWindow)
        WinClose, % "ahk_id " . ErrorWindow

    ; Buscar la ventana con el título "Details: 2203-0022"
    ErrorWindow := WinExist("Details: 2203-0022")
    if (ErrorWindow)
        WinClose, % "ahk_id " . ErrorWindow

    ; Buscar la ventana con el título "Error Code: 2306-0520"
    ErrorWindow := WinExist("Error Code: 2306-0520")
    if (ErrorWindow)
        WinClose, % "ahk_id " . ErrorWindow

    ; Buscar la ventana con el título "Details: 2306-0520"
    ErrorWindow := WinExist("Details: 2306-0520")
    if (ErrorWindow)
        WinClose, % "ahk_id " . ErrorWindow

    ; Buscar la ventana con el título "Controller Applet"
    ControlAppletWin := WinExist("Controller Applet")
    if (ControlAppletWin)
        WinClose, % "ahk_id " . ControlAppletWin

    ; Buscar la ventana con el título "Software Keyboard"
    SoftwareKeyboardWin := WinExist("Software Keyboard")
    if (SoftwareKeyboardWin)
    {
        ; Crear el texto a enviar: "RPCLab"
        textoAleatorio := "RPCLab"

        ; Enviar el texto aleatorio y presionar Enter
        SendInput, % textoAleatorio "{Enter}"

    }
	
    return
	
CloseAndExit(processName) {
    Process, Close, %processName%
    Run, taskkill /im "%processName%" /F
    ExitApp
}
