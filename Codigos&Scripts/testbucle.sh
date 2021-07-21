n=0
dir=192.168.137.137
peticion1="GET /led1on HTTP/1.0"
peticion2="GET /led1off HTTP/1.0"
peticion3="GET / HTTP/1.0"
while [ $n -ne 4 ]
do
echo ------------IP------------
echo $dir
echo -----------MENU-----------
echo 1. Prender led.
echo 2. Apagar led.
echo 3. Cambiar ip de conexion.
echo 4. Salir
echo 
echo Seleccione una opcion:
read n 
case $n in
	1)
	echo PRENDIENDO LED...
	ncat --send-only $dir 80 << EOF 
$peticion1 

EOF
	;;	
	2)
	echo APAGANDO LED...
	ncat --send-only $dir 80 << EOF 
$peticion2 

EOF
	;;
	3)
	echo -----------IMPORTANTE----------
	echo Si la ip ingresada es invalida,
	echo el programa no podrá conectarse
	echo o mostrara errores.
	echo -------------------------------
	echo Ingrese la nueva ip: 
	read dir
	echo COMPROBANDO CONEXION...
	ncat --send-only $dir 80 << EOF 
$peticion3 

EOF
	;;
	4)
	echo Cerrando programa...
	sleep 1s
	;;
	*)
	n=6
	echo Opcion fuera del menu
	echo ...
	sleep 1.5s
	echo
esac
done
