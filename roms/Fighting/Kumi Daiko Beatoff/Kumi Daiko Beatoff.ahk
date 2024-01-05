; Yuzu

; Obtener la ruta completa del ROM
RutaROM := A_ScriptDir . "\..\..\..\roms\Fighting\Kumi Daiko Beatoff\Kumi Daiko Beatoff.xci"

; Llamar al script de la carpeta common y pasar la ruta del ROM como parámetro
Run, %A_ScriptDir%\..\..\..\program\common\emy.ahk "%RutaROM%"

return
