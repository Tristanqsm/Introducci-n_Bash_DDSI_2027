#!/bin/bash

# 1. Definir el directorio de destino y la fecha actual (sustitución de comandos)
DIR_RESPALDO="$HOME/respaldo_logs"
FECHA=$(date +%Y-%m-%d)

# 2. Crear el directorio si no existe usando el operador lógico &&
[ ! -d "$DIR_RESPALDO" ] && mkdir -p "$DIR_RESPALDO"

# 3. Inicializar el contador de archivos procesados
contador=0

# 4. Buscar los archivos con extensión .log en el directorio actual y copiarlos
for archivo in *.log; do
    # Verificar que realmente existan archivos .log (evita error si no hay ninguno)
    if [ -f "$archivo" ]; then
        # Copiar agregando la fecha como prefijo al nombre original
        cp "$archivo" "$DIR_RESPALDO/${FECHA}_$archivo"
        
        # Incrementar el contador
        contador=$((contador + 1))
    fi
done

# 5. Informar la cantidad total de archivos respaldados
echo "Respaldo finalizado."
echo "Se copiaron $contador archivo(s) .log hacia $DIR_RESPALDO"
