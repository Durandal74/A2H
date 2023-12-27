#Persistent ; Mantiene el script en ejecución

; Ruta del ejecutable de a2h
CoinOPSPath := A_ScriptDir . "\a2h.exe"

; Ruta del ejecutable de antimicro
AntimicroPath := A_ScriptDir . "\antimicro\antimicro.exe"

; Ruta del archivo de configuración
ConfigFilePath := A_ScriptDir . "\antimicro\1.gamecontroller.amgp"

; Ejecuta CoinOPS y antimicro con el archivo de configuración
Run, %CoinOPSPath%
Run, %AntimicroPath% "%ConfigFilePath%" ,,Min

; Espera a que antimicro se inicie
WinWait, ahk_exe antimicro.exe

; Hotkey para maximizar la ventana al presionar F10
F10::
    ; Activar la ventana de a2h y maximizarla
    WinActivate, ahk_exe a2h.exe
    WinMaximize
return

F8::Shutdown, 2 ; Reiniciar el sistema
F9::Shutdown, 1 ; Apagar el sistema

q:: ; Presionar la tecla Q para cerrar todos los programas abiertos
    ; Cerrar la instancia de a2h.exe
    Process, Close, a2h.exe
    
    ; Cerrar la instancia de antimicro.exe
    Process, Close, antimicro.exe
    
    ; Cerrar cualquier script de AutoHotKey
    Process, Close, *.ahk
     
    ; Salir del script
    ExitApp
