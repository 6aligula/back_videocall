#!/bin/bash

# Arrancar el contenedor de nginx usando su nombre
echo "Arrancando el contenedor de nginx..."
docker start back_videocall-nginx-1

# Verificar si el contenedor de nginx arrancó correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de nginx arrancado con éxito."
else
    echo "Hubo un problema arrancando el contenedor de nginx."
fi

# Arrancar el contenedor de la aplicación web usando su nombre
echo "Arrancando el contenedor de la aplicación web..."
docker start back_videocall-web-1

# Verificar si el contenedor de la aplicación web arrancó correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de la aplicación web arrancado con éxito."
else
    echo "Hubo un problema arrancando el contenedor de la aplicación web."
fi
