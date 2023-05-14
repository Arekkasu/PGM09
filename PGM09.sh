#! /bin/bash





menu() {

    clear

    local warning_msg="\e[33mRecuerda que el limite es\e[0m" #33m es para el color amarillo
    local alert_msg="\e[31m32278!\e[0m." #31m es para el color rojo

    echo -e "|------------Bienvenido `whoami`------------|\n"
    
    
    echo -e "Este programa hallara un numero primo que este anterior al numero que ingresaste.\n"

    echo -e "$warning_msg $alert_msg"

    
    echo -en "\n Ingresa por favor un numero: "

    read number_user #Variable donde el usuario pondra aquel numero

    
}


is_number() {
    number='^[0-9]+$' # ^ Indica el comienzo de la cadena, [0-9]+ Representa los dijitos que puede tener y $: indica el final de la cadena.

    if ! [[ $number_user =~ $number ]] #al comparar con Number se estaria verificando si es un numero, pero usando `!` seria en caso que no sea un numero de True
    then
        echo "El dato ingresado no es un numero, ingresa nuevamente"
    else
        echo "HOLA"
    fi
}




raiz=$(echo "scale=6; sqrt(7)" | bc)



#Comprabar si es un numero



echo "usuario $number_user, otro $n"


es_primo() {
    local number=$1
    local square_number=$(echo "sqrt($number)" | bc)
    for (( i=2; i<=square_number; i++))
    do
        if (( $number%i == 0 ))
        then
            return 1 # Si se cumple la condicion, significa que no es un numero primo
        fi
    done
    return 0 # Es el primo
}


before_number() {
    for (( i=$number_user; i >0; i--))
    do
        echo $i
        if es_primo $number_user
        then
            echo "Es primo"
            break
        fi
    done

}

comprobante=1

while [ $comprobante -eq 1 ]

menu

if is_number