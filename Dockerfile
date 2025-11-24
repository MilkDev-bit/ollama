FROM ollama/ollama:latest

# Exponer puerto
EXPOSE 11434

# Configurar variables de entorno
ENV OLLAMA_HOST=0.0.0.0

# Copiar y configurar script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Usar shell form para evitar problemas
CMD ["/bin/sh", "/start.sh"]