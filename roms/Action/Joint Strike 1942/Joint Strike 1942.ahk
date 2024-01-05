; Rpcs3

#NoEnv
SetWorkingDir %A_ScriptDir%

; Rutas y nombres de archivos
EmulatorPath := A_ScriptDir . "\..\..\..\program\emu\rpc\rpcs3.exe"
GamePath := A_ScriptDir . "\NPEB00026\USRDIR\EBOOT.BIN"
TituloVentana := "NPEB00026"

; Llamar al script Commonp.ahk y pasar las rutas y el título de la ventana como parámetros
Run, %A_ScriptDir%\..\..\..\program\common\rpc.ahk "%EmulatorPath%" "%GamePath%" "%TituloVentana%"

return


