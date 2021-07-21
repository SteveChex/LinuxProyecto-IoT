n=0
dir=192.168.137.137
peticion1="/readCC"
peticion2="/"
while [ $n -ne 3 ]
do
echo ------------IP------------
echo $dir
echo -----------MENU-----------
echo 1. Obtener valor.
echo 2. Cambiar ip de conexion.
echo 3. Salir
echo 
echo Seleccione una opcion:
read n 
case $n in
	1)
	midvar=$dir$peticion1 #192.168.137.137/readCC
	curl -s $midvar | grep "Counter:" | awk '{print ($3 $4)}'
	;;	
	2)
	echo -----------IMPORTANTE----------
	echo Si la ip ingresada es invalida,
	echo el programa no podrá conectarse
	echo -------------------------------
	echo Ingrese la nueva ip: 
	read dir
	midvar=$dir$peticion2
	curl -s $midvar | grep "TextoParaSilenciarSalida"
	;;
	3)
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
