#!/bin/bash

Nombre=$1
Apellidos=$2
MOSTRAR=$3
if [ "$MOSTRAR" = "true" ]; then
	echo "Hola  $Nombre $Apellidos"
else 
	echo "Si quieres ver el nombre, selecciona la casilla de MOSTRAR"
fi	
