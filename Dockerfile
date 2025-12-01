# 1. Usamos Debian Slim
FROM debian:stable-slim

# 2. Instalamos certificados (para HTTPS) Y LA LIBRERÍA FALTANTE (libicu-dev)
# Esto soluciona el error "Couldn't find a valid ICU package"
RUN apt-get update && apt-get install -y \
    ca-certificates \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Carpeta de trabajo
WORKDIR /app

# 4. Descargamos TU versión específica de ARM64 y la renombramos a "MinecraftClient"
ADD https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/20250522-285/MinecraftClient-20250522-285-linux-arm64 ./MinecraftClient

# 5. Copiamos tus archivos de configuración (.ini, txt, tasks)
COPY . .

# 6. Damos permisos de ejecución al archivo descargado
RUN chmod +x MinecraftClient

# 7. Ejecutamos el bot
CMD ["./MinecraftClient"]