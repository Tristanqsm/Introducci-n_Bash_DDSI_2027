#!/bin/bash

# Validar los dos argumentos
if [ $# -ne 2 ]; then
    echo "Error: Debe ingresar exactamente dos números"
    echo "Uso: $0 <número1> <número2>"
    exit 1
fi

# Asignar los parámetros de posición a variables
num1=$1
num2=$2

# Realizar la evaluación
suma=$((num1 + num2))
diferencia=$((num1 - num2))
mult=$((num1 * num2))

# Imprimir los resultados
echo "Suma: $suma"
echo "Diferencia: $diferencia"
echo "Producto: $mult"
