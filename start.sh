#!/bin/sh

# Iniciar el servidor de Ollama en segundo plano
ollama serve &

# Esperar a que el servidor arranque
sleep 10

# Descargar modelo ligero para Railway
echo "🔴 Descargando modelo tinydolphin..."
ollama pull tinydolphin

echo "🟢 Ollama listo con tinydolphin!"

# Mantener el contenedor vivo
tail -f /dev/null