FROM ollama/ollama:latest

# Exponer puerto
EXPOSE 11434

# Configurar variables de entorno
ENV OLLAMA_HOST=0.0.0.0

# Instalar dependencias necesarias y crear script
USER root

# Instalar curl y otros utilitarios necesarios
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Crear script de inicio
RUN echo '#!/bin/bash' > /start.sh && \
    echo 'echo "🚀 Starting Ollama server..."' >> /start.sh && \
    echo 'ollama serve &' >> /start.sh && \
    echo 'sleep 10' >> /start.sh && \
    echo 'echo "📥 Downloading tinydolphin model..."' >> /start.sh && \
    echo 'ollama pull tinydolphin' >> /start.sh && \
    echo 'echo "✅ Ollama ready with tinydolphin!"' >> /start.sh && \
    echo 'echo "🌐 Server running on 0.0.0.0:11434"' >> /start.sh && \
    echo 'wait' >> /start.sh

RUN chmod +x /start.sh

# Volver al usuario ollama
USER ollama

CMD ["/bin/bash", "/start.sh"]