# 1. Usamos una imagen base ligera de Linux con Mono instalado
FROM mono:slim

# 2. Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Descargamos el ejecutable de Minecraft Console Client (MCC)
# Nota: Esta es una versión estable.
ADD https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/20230608-283/MinecraftClient.exe ./MinecraftClient.exe

# 4. Copiamos tu archivo de configuración al contenedor
COPY MinecraftClient.ini ./MinecraftClient.ini

# 5. Comando para iniciar el bot cuando Coolify arranque el contenedor
CMD ["mono", "MinecraftClient.exe"]