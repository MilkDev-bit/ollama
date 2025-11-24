#!/bin/bash

# Iniciar el servidor en segundo plano
ollama serve &

# Guardar el PID del proceso
pid=$!

# Esperar a que el servidor esté listo (reintentos)
echo "⏳ Esperando a que Ollama inicie..."
while ! curl -s http://localhost:11434 > /dev/null; do
    sleep 1
done

echo "🟢 Ollama iniciado. Verificando modelo llama3..."

# Intentar descargar el modelo
ollama pull llama3

echo "✅ Modelo listo. Servidor operativo."

# Esperar al proceso de ollama
wait $pid