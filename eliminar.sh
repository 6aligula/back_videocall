#!/bin/bash

# Eliminar el contenedor de nginx
echo "Eliminando el contenedor de nginx..."
docker rm back_videocall-nginx-1

# Verificar si el contenedor de nginx se eliminó correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de nginx eliminado con éxito."
else
    echo "Hubo un problema eliminando el contenedor de nginx."
fi

# Eliminar el contenedor de la aplicación web
echo "Eliminando el contenedor de la aplicación web..."
docker rm back_videocall-web-1

# Verificar si el contenedor de la aplicación web se eliminó correctamente
if [ $? -eq 0 ]; then
    echo "Contenedor de la aplicación web eliminado con éxito."
else
    echo "Hubo un problema eliminando el contenedor de la aplicación web."
fi
