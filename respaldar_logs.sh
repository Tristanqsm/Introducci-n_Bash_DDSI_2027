#!/bin/bash

# Definir el directorio de destino y la fecha actual
DIR_RESPALDO="$HOME/respaldo_logs"
FECHA=$(date +%Y-%m-%d)

# Crear el directorio si no existe
[ ! -d "$DIR_RESPALDO" ] && mkdir -p "$DIR_RESPALDO"


contador=0

# Buscar los archivos con extensión .log
for archivo in *.log; do
    if [ -f "$archivo" ]; then
        cp "$archivo" "$DIR_RESPALDO/${FECHA}_$archivo"
        contador=$((contador + 1))
    fi
done

# Informar la cantidad total de archivos respaldados
echo "Respaldo finalizado."
echo "Se copiaron $contador archivo(s) .log hacia $DIR_RESPALDO"
