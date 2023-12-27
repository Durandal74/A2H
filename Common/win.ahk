SetTitleMatchMode, 2 ; Coincidir de manera parcial el título de la ventana

; Obtener las variables desde los parámetros de línea de comandos
Directorio := A_Args[1]
Ejecutable := A_Args[2]
Proceso := A_Args[3]
TituloVentana := A_Args[4]

; Cambia al directorio del ejecutable
SetWorkingDir, %Directorio%

; Ejecuta el programa
Run, %Ejecutable%

SetTimer, CheckGameStatus, 3000  ; Ejecuta la función CheckGameStatus

; Hotkey para maximizar la ventana al presionar F12
F12::MaximizarVentana(TituloVentana)

Escape::
    ; Cerrar el juego y el script al presionar Escape
    Process, Close, %Proceso%
    Run, taskkill /im "%Proceso%" /F
    ExitApp
return

MaximizarVentana(titulo) {
    ; Intentar maximizar la ventana con el título proporcionado
    IfWinExist, %titulo%
    {
        WinActivate ; Activar la ventana
        WinMaximize ; Maximizar la ventana
    }

}

CheckGameStatus:
    ; Verificar si el proceso del juego aún está en ejecución
    Process, Exist, %Proceso%
    
    ; Si el proceso ya no está en ejecución, cierra el script
    if ErrorLevel = 0
    {
        ExitApp
    }
