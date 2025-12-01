# 1. Usamos una imagen base ligera de Linux con Mono instalado
FROM mono:slim

# 2. Definimos la carpeta de trabajo dentro del contenedor
WORKDIR /app

# 3. Descargamos el cliente (ENLACE CORREGIDO - Versión 2.5.0 Estable)
ADD https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/2.5.0/MinecraftClient.exe ./MinecraftClient.exe

# 4. Copiamos TODOS los archivos (ini, txt, tasks) al contenedor
COPY . .

# 5. Comando para iniciar el bot
CMD ["mono", "MinecraftClient.exe"]