do {
    . ".\out.ps1"
    . ".\spanish.ps1"
    # Para agregar color usar -ForegroundColor DarkGreen -BackgroundColor White
    Clear-Host
    Write-Host $var1
    Write-Host $var2
    Write-Host $var3
    Write-Host $var4
    Write-Host ""
    Write-Host $var0
    $ext = Read-Host $varChoice

    switch($ext){
        1 {
            Write-Host ""
            Write-Host $varInstalling
            Get-ChildItem .\drivers -Recurse -Filter "*.inf" | ForEach-Object { PNPUtil.exe -i -a $_.FullName}
            OutSwitch
        }
        2 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host $var21
                Write-Host $var22
                Write-Host $var23
                Write-Host $var24
                Write-Host ""
                Write-Host $var0
                $int = Read-Host $varChoice

                switch($int){
                    1 {
                        Read-Host $var211
                        adb reboot bootloader
                        Clear-Host
                        Write-Host ""
                        Read-Host $var212
                        Clear-Host
                        Write-Host ""
                        Write-Host $var213
                        fastboot boot twrp.img
                        SalidaSwitch
                    }
                    2 {
                        Write-Host ""
                        Write-Host $var221
                        adb pull /dev/block/mmcblk0p62 ./boot.img
                        SalidaSwitch
                    }
                    3 {
                        Write-Host ""
                        Write-Host $var231
                        adb push ./boot.img /storage/emulated/0
                        SalidaSwitch
                    }
                    4 {
                        Write-Host ""
                        Write-Host $var241
                        adb pull /storage/emulated/0/ ./patched_boot.img
                        SalidaSwitch
                    }
                }
            } while($int -ne 0)
        }
        3 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host $var31
                Write-Host ""
                Write-Host $var0
                $int = Read-Host $varChoice

                switch($int){
                    1 {
                        Write-Host ""
                        Write-Host $var311
                        Write-Host "fastboot flash boot_a magisk_patched.img"
                        Write-Host "fastboot flash boot_b magisk_patched.img"
                        SalidaSwitch
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
            } while($int -ne 0)
        }
        4 {
            do {
                Clear-Host
                Write-Host ""
                Write-Host "[1] - Bootear con TWRP"
                Write-Host "[2] - Extraer boot.img"
                Write-Host ""
                Write-Host "[0] - Exit"
                $int = Read-Host "Please put your choice"

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
} while($ext -ne 0)
