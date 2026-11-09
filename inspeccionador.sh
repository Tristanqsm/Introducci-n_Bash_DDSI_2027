#!/bin/bash

# Validar que se haya pasado la ruta como primer argumento
if [ $# -eq 0 ]; then
    echo "Error: Debe indicar la ruta de un archivo o directorio."
    echo "Uso: $0 <ruta>"
    exit 1
fi

ruta="$1"

# Verificar si la ruta existe
if [ ! -e "$ruta" ]; then
    echo "Error: La ruta '$ruta' no existe."
    exit 1
fi

echo "--- Resultados de inspección para: $ruta ---"

# Determinar si es un archivo regular
if [ -f "$ruta" ]; then
    echo "Tipo: Archivo regular"
elif [ -d "$ruta" ]; then
    echo "Tipo: Directorio"
else
    echo "Tipo: Especial (enlace simbólico, socket, etc.)"
fi

# Verificar permiso de lectura
if [ -r "$ruta" ]; then
    echo "Lectura (r): Sí"
else
    echo "Lectura (r): No"
fi

# Verificar permiso de escritura
if [ -w "$ruta" ]; then
    echo "Escritura (w): Sí"
else
    echo "Escritura (w): No"
fi
