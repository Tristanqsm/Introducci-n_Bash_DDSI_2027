#!/bin/bash

ARCHIVO="/etc/passwd"

if [[ ! -f "$ARCHIVO" ]]; then
    echo "Error: El archivo $ARCHIVO no existe."
    exit 1
fi

echo ""
echo "                       AUDITORÍA DE USUARIOS EN EL SISTEMA                "

# Lectura línea por línea usando IFS
while IFS=':' read -r usuario password uid gid info home shell; do
    [[ -z "$usuario" || "$usuario" =~ ^# ]] && continue

    # Clasificación según el identificador UID
    if (( uid < 1000 )); then
        categoria="Usuario de Sistema"
    else
        categoria="Usuario Regular"
    fi

    # Comprobación del estado de la shell de inicio de sesión
    if [[ "$shell" == "/bin/false" || "$shell" == "/usr/sbin/nologin" ]]; then
        estado_shell="ALERTA: Shell deshabilitada ($shell)"
    else
        estado_shell="Shell activa ($shell)"
    fi

    # Impresion de resultados
    printf "Usuario: %-18s | UID: %-5s | Categoría: %-18s | %s\n" \
        "$usuario" "$uid" "$categoria" "$estado_shell"

done < "$ARCHIVO"
