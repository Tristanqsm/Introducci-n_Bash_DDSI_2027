#!/bin/bash

# Validar que se haya pasado la ruta como primer argumento
if [ $# -eq 0 ]; then
    echo "Error: Debe indicar la ruta de un archivo o directorio."
    echo "Uso: $0 <ruta>"
    exit 1
fi

ruta="$1"

# 1. Verificar si la ruta existe (-e)
if [ ! -e "$ruta" ]; then
    echo "Error: La ruta '$ruta' no existe."
    exit 1
fi

echo "--- Resultados de inspección para: $ruta ---"

# 2. Determinar si es un archivo regular (-f) o directorio (-d)
if [ -f "$ruta" ]; then
    echo "Tipo: Archivo regular"
elif [ -d "$ruta" ]; then
    echo "Tipo: Directorio"
else
    echo "Tipo: Especial (enlace simbólico, socket, etc.)"
fi

# 3. Verificar permiso de lectura (-r)
if [ -r "$ruta" ]; then
    echo "Lectura (r): Sí"
else
    echo "Lectura (r): No"
fi

# 4. Verificar permiso de escritura (-w)
if [ -w "$ruta" ]; then
    echo "Escritura (w): Sí"
else
    echo "Escritura (w): No"
fi
