#!/bin/bash

echo "Aqui empieza el script"
echo ""

#Ejercicio 2
echo "Nombre del script: $0"
echo "Cantidad de parametros: $#"
echo "Lista completa de parametros: "$@""

#Ejercicio 3
if [ "$#" -lt 2 ]; then
    echo "Uso: $0 <origen> <destino>"
    exit
fi

#Ejercicio 4
ls archivo_inexistente.txt 2> error.log 

#Ejercicio 5
echo "Código de salida del comando anterior: $?"

echo ""
echo "Aqui termina el script jeje"
