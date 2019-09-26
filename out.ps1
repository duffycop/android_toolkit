function StdOut {
    
    if($args[0] -eq $True) {
        Write-Host $varStdOk -ForegroundColor White -BackgroundColor Green
    }else {
        Write-Host $varStdError -ForegroundColor White -BackgroundColor Red
    }
}
function OutSwitch {
    $stdout = $?
    Write-Host ""
    StdOut $stdout
    pause
    ; break
}
