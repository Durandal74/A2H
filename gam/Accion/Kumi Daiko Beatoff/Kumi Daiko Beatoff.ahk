; Yuzu

; Obtener la ruta completa del ROM
RutaROM := A_ScriptDir . "\..\sw\roms\Kumi Daiko Beatoff.xci"

; Llamar al script Commony.ahk y pasar la ruta del ROM como parámetro
Run, %A_ScriptDir%\Commony.exe "%RutaROM%"

return
