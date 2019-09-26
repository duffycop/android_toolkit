do {
    function Salida {
        if($args[0] -eq $True) {
            Write-Host "Tarea ejecutada exitosamente" -ForegroundColor White -BackgroundColor Green
        }else {
            Write-Host "Ha habido un error" -ForegroundColor White -BackgroundColor Red
        }
    }
    # Para agregar color usar -ForegroundColor DarkGreen -BackgroundColor White
    Clear-Host
    Write-Host "[1] - Instalar drivers"
    Write-Host "[2] - Extraer boot"
    Write-Host "[3] - Rootear"
    Write-Host "[4] - Desrootear"
    Write-Host ""
    Write-Host "[0] - Exit"
    $externa = Read-Host "Please put your choice"

    switch($externa){
        1 {
            Write-Host ""
            Write-Host "Instalando drivers, por favor espere.."
            Get-ChildItem .\drivers -Recurse -Filter "*.inf" | ForEach-Object { PNPUtil.exe -i -a $_.FullName}
            $salida = $?
            Write-Host ""
            Salida $salida
            pause
            ; break
        }
        2 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host "[1] - Bootear con TWRP"
                Write-Host "[2] - Extraer boot.img"
                Write-Host "[3] - Subir boot.img"
                Write-Host "[4] - Bajar patched_boot.img"
                Write-Host ""
                Write-Host "[0] - Exit"
                $interna = Read-Host "Please put your choice"

                switch($interna){
                    1 {
                        Read-Host "Presiona cualquier tecla para iniciar en modo fastboot"
                        adb reboot bootloader
                        Clear-Host
                        Write-Host ""
                        Read-Host "Cuando su móvil esté en modo fastboot presione cualquier tecla para continuar.."
                        Clear-Host
                        Write-Host ""
                        Write-Host "Booteando con TWRP, por favor espere.."
                        fastboot boot twrp.img
                        $salida = $?
                        Write-Host ""
                        Salida $salida
                        pause
                        ; break
                        
                    }
                    2 {
                        Write-Host ""
                        Write-Host "Extrayendo imagen boot.img, por favor espere.."
                        adb pull /dev/block/mmcblk0p62 ./boot.img
                        $salida = $?
                        Write-Host ""
                        Salida $salida
                        pause
                        ; break
                    }
                    3 {
                        Write-Host ""
                        Write-Host "Subiendo imagen boot.img, por favor espere.."
                        adb push ./boot.img /storage/emulated/0
                        $salida = $?
                        Write-Host ""
                        Salida $salida
                        pause
                        ; break
                    }
                    4 {
                        Write-Host ""
                        Write-Host "Extrayendo imagen boot.img, por favor espere.."
                        adb pull /storage/emulated/0/ ./patched_boot.img
                        $salida = $?
                        Write-Host ""
                        Salida $salida
                        pause
                        ; break
                    }
                }
            } while($interna -ne 0)
        }
        3 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host "[1] - Rootear"
                Write-Host ""
                Write-Host "[0] - Exit"
                $interna = Read-Host "Please put your choice"

                switch($interna){
                    1 {
                        Write-Host ""
                        Write-Host "Rooteando su dispositivo, por favor espere.."
                        Write-Host "fastboot flash boot_a magisk_patched.img"
                        Write-Host "fastboot flash boot_b magisk_patched.img"
                        Write-Host ""
                        pause
                        ; break
                    }
                    2 {
                        Write-Host ""
                        Write-Host "Extrayendo imagen boot.img, por favor espere.."
                        Write-Host "adb pull /dev/block/mmcblk0p62 ./boot.img"
                        Write-Host ""
                        pause
                        ; break
                    }
                }
            } while($interna -ne 0)
        }
        4 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host "[1] - Bootear con TWRP"
                Write-Host "[2] - Extraer boot.img"
                Write-Host ""
                Write-Host "[0] - Exit"
                $interna = Read-Host "Please put your choice"

                switch($interna){
                    1 {
                        Write-Host ""
                        Write-Host "Booteando con TWRP, por favor espere.."
                        Write-Host "fastboot boot twrp.img"
                        Write-Host ""
                        pause
                        ; break
                        
                    }
                    2 {
                        Write-Host ""
                        Write-Host "Extrayendo imagen boot.img, por favor espere.."
                        Write-Host "adb pull /dev/block/mmcblk0p62 ./boot.img"
                        Write-Host ""
                        pause
                        ; break
                    }
                }
            } while($interna -ne 0)
        }
    }
} while($externa -ne 0)
