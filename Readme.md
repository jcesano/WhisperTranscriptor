# WhisperTranscriptor

Pequeño script en PowerShell que permite seleccionar un archivo de audio (`.wav`, `.mp3`, etc.), transcribirlo utilizando [OpenAI Whisper](https://github.com/openai/whisper) y guardar la transcripción en un archivo `.txt` en la misma carpeta del audio.

## 📦 Requisitos

- Tener instalado Python 3.9 o superior
- Tener instalado `openai-whisper`:
  ```bash
  pip install openai-whisper
