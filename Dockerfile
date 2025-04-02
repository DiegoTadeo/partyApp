# Usa una imagen de Node.js con soporte para Expo
FROM node:20

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del proyecto
COPY package.json package-lock.json ./
COPY . .

# Instala las dependencias
RUN npm install -g expo-cli && npm install

# Instala @expo/ngrok globalmente para evitar la pregunta interactiva
RUN npm install -g @expo/ngrok

# Expone los puertos en los que corre Expo
EXPOSE 8081 19000 19001 19002

# Comando para iniciar el servidor de Expo sin túnel
CMD ["npx", "expo", "start", "--localhost"]

