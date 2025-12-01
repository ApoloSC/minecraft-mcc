# 1. Usamos Debian Slim
FROM debian:stable-slim

# 2. Instalamos librerías necesarias
RUN apt-get update && apt-get install -y ca-certificates libicu-dev && rm -rf /var/lib/apt/lists/*

# 3. Carpeta de trabajo
WORKDIR /app

# 4. Descargamos el bot (Versión ARM64)
ADD https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/20250522-285/MinecraftClient-20250522-285-linux-arm64 ./MinecraftClient

# 5. Copiamos los archivos de configuración (para el Anti-AFK)
COPY . .

# 6. Permisos de ejecución
RUN chmod +x MinecraftClient

# 7. EJECUTAMOS EL BOT CON LOS DATOS DIRECTOS
# Sintaxis: ./MinecraftClient <USUARIO> <CONTRASEÑA> <IP>
# Como es No Premium, pon un guión "-" en la contraseña.
CMD ["./MinecraftClient", "AFK-Bot", "-", "server.dispearson.com"]