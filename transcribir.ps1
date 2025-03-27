# transcribir.ps1
Add-Type -AssemblyName System.Windows.Forms
$dialog = New-Object System.Windows.Forms.OpenFileDialog

# Filtro de archivos de audio (usa coma como separador alternativo si el punto y coma falla)
$dialog.Filter = "Archivos de audio (*.wav, *.mp3, *.m4a, *.aac, *.flac)|*.wav;*.mp3;*.m4a;*.aac;*.flac"
$dialog.Title = "Seleccioná un archivo de audio para transcribir"
$dialog.Multiselect = $false

if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $audioPath = $dialog.FileName
    $audioDir = Split-Path $audioPath
    $whisperCmd = "whisper `"$audioPath`" --model base --language es --output_format txt --output_dir `"$audioDir`""

    Write-Host "Ejecutando: $whisperCmd"
    Invoke-Expression $whisperCmd

    $fileBase = [System.IO.Path]::GetFileNameWithoutExtension($audioPath)
    $txtPath = Join-Path $audioDir "$fileBase.txt"

    if (Test-Path $txtPath) {
        Write-Host "Transcripción completa. Abriendo archivo de texto..."
        Start-Process notepad.exe $txtPath
    } else {
        Write-Host "No se encontró el archivo de salida: $txtPath"
    }
} else {
    Write-Host "Transcripción cancelada."
}
