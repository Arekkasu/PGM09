#! /bin/bash





menu() {

    clear

    local warning_msg="\e[33mRecuerda que el limite es \e[0m" #33m es para el color amarillo
    local alert_msg="\e[31m32278!\e[0m." #31m es para el color rojo

    echo -e "|------------Bienvenido `whoami`------------|\n"
    
    
    echo -e "Este programa hallara un numero primo que este anterior al numero que ingresaste.\n"

    echo -e "$warning_msg $alert_msg"

    echo -e "Si deseas salir del programa ingrese 'exit'.\n"

    
    echo -en "Ingresa por favor un numero: "

    read number_user #Variable donde el usuario pondra aquel numero

    
}


is_number() {
    number='^[0-9]+$' # ^ Indica el comienzo de la cadena, [0-9]+ Representa los dijitos que puede tener y $: indica el final de la cadena.

    if ! [[ $1 =~ $number ]] #al comparar con Number se estaria verificando si es un numero, pero usando `!` seria en caso que no sea un numero de True
    then
        return 1
    else
        return 0
    fi

}


#Comprabar si es un numero primo

es_primo() {
    local number=$1
    local square_number=$(echo "sqrt($number)" | bc)

    for (( j=2; j<=square_number; j++))
    do
        if (( $number%j == 0 ))
        then
            return 1 # Si se cumple la condicion, significa que no es un numero primo
        fi
    done
    return 0 # Es el primo
}

#Saber el numero anterior

before_number() {
    local numero=$number_user
    for (( i=$numero-1; i > 1; i--))
    do
    if es_primo $i
    then
        echo -e "\n\e[32m$i\e[0m Es el numero primo\n"
        break
    fi
    done

}

comprobante=1

while [ $comprobante -eq 1 ]

do

menu

if is_number $number_user
then

    if (( $number_user > 32278 ))
    then

        read -p "El numero ingresado es mayor al limite"

    elif (( $number_user == 2 ))
    then
        echo -e "\nEl 2 es un numero primo\n"
        read -p "Presiona enter para continuar..."
    elif (( $number_user >= 2 ))
    then

        before_number
        read -p "Presiona enter para continuar..."

    else
        echo -e "\nEl numero debe ser mayor de 2\n"
        read -p "Presiona enter para continuar"
    fi

else

    if [[ "$number_user" = "EXIT" || "$number_user" = "exit" ]]
    then
        break
    else
        echo -e "\nEl digito ingresado no es un numero"
        read -p "Presiona enter para continuar..."
    fi

fi
done



