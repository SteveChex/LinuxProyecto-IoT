n=0
dir=192.168.137.137
peticion1="/led1on"
peticion2="/led1off"
peticion3="/"
	#midvar=$dir$peticion1
	#echo $midvar
while [ $n -ne 4 ]
do
echo ------------IP------------
echo $dir
echo -----------MENU-----------
echo 1. Obtener valor.
echo 2. Apagar led.
echo 3. Cambiar ip de conexion.
echo 4. Salir
echo 
echo Seleccione una opcion:
read n 
case $n in
	1)
	midvar=$dir$peticion1 #192.168.137.137/led1on
	;;	
	2)
	midvar=$dir$peticion2
	curl -s $midvar | grep "TextoParaSilenciarOutput"
	;;
	3)
	echo -----------IMPORTANTE----------
	echo Si la ip ingresada es invalida,
	echo el programa no podrá conectarse
	echo -------------------------------
	echo Ingrese la nueva ip: 
	read dir
	midvar=$dir$peticion3
	curl -s $midvar | grep "TextoParaSilenciarSalida"
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
