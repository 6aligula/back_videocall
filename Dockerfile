# Usa una imagen base oficial de Python
FROM python:3.8-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de requisitos primero para aprovechar la caché de capas de Docker
COPY requirements.txt .

# Instala las dependencias del proyecto
RUN pip install -r requirements.txt

# Copia el resto de tu aplicación Flask al directorio de trabajo
COPY . .

# Expone el puerto en el que se ejecutará tu aplicación
EXPOSE 5000

# Define el comando para ejecutar tu aplicación
CMD ["flask", "run", "--host=0.0.0.0"]
