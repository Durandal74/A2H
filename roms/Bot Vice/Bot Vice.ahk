; Yuzu

; Obtener la ruta completa del ROM
RutaROM := A_ScriptDir . "\..\..\roms\Bot Vice\Bot Vice.xci"

; Llamar al script de la carpeta common y pasar la ruta del ROM como parámetro
Run, %A_ScriptDir%\..\..\Main\common\emy.ahk "%RutaROM%"

return
