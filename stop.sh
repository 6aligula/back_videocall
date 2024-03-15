#!/bin/bash

# Parar el contenedor de nginx
echo "Deteniendo el contenedor de nginx..."
docker stop back_videocall-nginx-1

# Verificar si el contenedor de nginx se detuvo correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de nginx detenido con éxito."
else
    echo "Hubo un problema deteniendo el contenedor de nginx."
fi

# Parar el contenedor de la aplicación web
echo "Deteniendo el contenedor de la aplicación web..."
docker stop back_videocall-web-1

# Verificar si el contenedor de la aplicación web se detuvo correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de la aplicación web detenido con éxito."
else
    echo "Hubo un problema deteniendo el contenedor de la aplicación web."
fi
