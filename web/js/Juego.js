var fichasCPU = new Array(0, 0, 0, 0, 0, 0, 0, 0); //Array para colocar la cantidad de fichas de la CPU en cada fila, columna y diagonal
//Boolean para comprobar si hay alguna ficha mía en una fila, columna o diagonal
var fichaFila0 = false;
var fichaFila1 = false;
var fichaFila2 = false;
var fichaColumna0 = false;
var fichaColumna1 = false;
var fichaColumna2 = false;
var fichaDiagonal0 = false;
var fichaDiagonal1 = false;
//Contador para comprobar la cantidad de fichas que tengo en la primera fila
var fichasFila0 = 0;
var fichaFila0CPU = false; //Boolean para comprobar si hay una ficha de la cpu en la primera fila

// let botonPulsado;
var posX;
var posY;
var contadorFichas = 0;
let jugadorGana = false;
let cpuGana = false;
var salir = false;
var gameover = false;
var botones = Array.from(document.getElementsByTagName("button")); //Genera un array con los botones del tablero
botones.forEach(i => i.addEventListener("click", ponerFicha));  //Para cada botón le añado un listener para cada vez que haga click vaya a la funcion ponerFicha


function ponerFicha(event) {
    if (!salir) {
        let botonPulsado = event.target;    //Obtenemos el botón pulsado
        if (contadorFichas == 9) {
            gameover = true;
        } else {
            if (botonPulsado.innerHTML != "") {
                alert("Esa casilla ya está ocupada. Pruebe otra distinta");
            }
            if (!gameover && botonPulsado.innerHTML == "") {  //Si la partida no ha acabado y en el botón no hay ninguna ficha
                botonPulsado.innerHTML = "X"; //Coloca la ficha dependiendo del turno que toque
                contadorFichas++;

                if (compruebaJugador()) { //Comprueba si el jugador ha ganado
                    document.getElementById("txt-Victoria").style.visibility = "visible"; //Si ha ganado, muestra el mensaje de victoria
                    gameover = true;
                    salir = true;
                    repartePuntos();

                } else {    //Si no ha ganado, será turno de la cpu
                    cpu();
                }
            }
        }
        if (gameover && !jugadorGana && !cpuGana) { //Si la partida ha terminado y no hay ganador significa que hay empate
            document.getElementById("txt-Empate").style.visibility = "visible";
            salir = true;
            repartePuntos();
        }
    }
}

function cpu() {
    let posFicha = -1;
    if (contadorFichas < 9) {   //Si el tablero no está lleno
        if (compruebaFila0()) { //Si estoy apunto de ganar en la primera fila y no lo evita
            do {
                posFicha = parseInt(Math.random() * 3);    //Tapará el movimiento y evitará que gane
            } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
            botones[posFicha].innerHTML = "O";
            contadorFichas++;
        } else if (botones[4].innerHTML == "") {   //Si la casilla del medio no está seleccionada colocará su ficha ahí ya que tiene más probabilidades de ganar
            botones[4].innerHTML = "O";
            contadorFichas++;
        } else {
            if (comprobarFichasCPU()) { //Si la CPU tiene 2 fichas en una misma columna,fila o diagonal y está apunto de ganar y no hay ninguna ficha mía en dicha zona
                fichaGanadoraCPU();
            } else {
                do {
                    posFicha = parseInt(Math.random() * 9);
                } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
                botones[posFicha].innerHTML = "O";
            }
            contadorFichas++;
            // return pos;       
        }
        if (compruebaCPU()) {     //Si la CPU ha ganado mostrará el mensaje de derrota
            document.getElementById("txt-Derrota").style.visibility = "visible";
            gameover = true;
            salir = true;
            repartePuntos();
        }
    } else {
        gameover = true;
    }
}

function compruebaFila0() {
    fichasFila0 = 0; //Resetamos el contador

    //COMPRUEBO SI TENGO 2 FICHAS EN LA PRIMERA FILA Y ESTOY APUNTO DE GANAR
    for (let i = 0; i <= 2; i++) {
        if (botones[i].innerHTML == "X") {
            fichasFila0++;
        }
        if (botones[i].innerHTML == "O") {
            fichaFila0CPU = true;
        }
    }
    if (fichasFila0 == 2 && !fichaFila0CPU) {
        return true;
    }
}

function comprobarFichasCPU() {
    for (let i = 0; i < fichasCPU.length; i++) {
        fichasCPU[i] = 0; //Reseteamos los contadores para que haya ningún fallo al contar

    }
    //COMPRUEBO SI LA CPU TIENE 2 FICHAS Y ESTÁ APUNTO DE GANAR Y NO HAY NINGUNA FICHA MÍA EN ESA FILA, COLUMA O DIAGONAL
    //Fila superior
    for (let i = 0; i <= 2; i++) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[0]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaFila0 = true;
        }
    }
    //Fila central
    for (let i = 3; i <= 5; i++) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[1]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaFila1 = true;
        }
    }
    //Fila inferior
    for (let i = 6; i <= 8; i++) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[2]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaFila2 = true;
        }
    }
    //Columna izquierda
    for (let i = 0; i <= 6; i = i + 3) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[3]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaColumna0 = true;
        }
    }
    //Columna central
    for (let i = 1; i <= 7; i = i + 3) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[4]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaColumna1 = true;
        }
    }
    //Columna derecha
    for (let i = 2; i <= 8; i = i + 3) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[5]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaColumna2 = true;
        }
    }
    //Diagonal izq-drcha
    for (let i = 0; i <= 8; i = i + 4) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[6]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaDiagonal0 = true;
        }
    }
    //Diagonal drcha-izq
    for (let i = 2; i <= 6; i = i + 2) {
        if (botones[i].innerHTML == "O") {
            fichasCPU[7]++;
        }
        if (botones[i].innerHTML == "X") {
            fichaDiagonal1 = true;
        }
    }

    if (fichasCPU[0] == 2 && !fichaFila0) {
        return true;
    } else if (fichasCPU[1] == 2 && !fichaFila1) {
        return true;
    } else if (fichasCPU[2] == 2 && !fichaFila2) {
        return true;
    } else if (fichasCPU[3] == 2 && !fichaColumna0) {
        return true;
    } else if (fichasCPU[4] == 2 && !fichaColumna1) {
        return true;
    } else if (fichasCPU[5] == 2 && !fichaColumna2) {
        return true;
    } else if (fichasCPU[6] == 2 && !fichaDiagonal0) {
        return true;
    } else if (fichasCPU[7] == 2 && !fichaDiagonal1) {
        return true;
    }

}

function fichaGanadoraCPU() {
    let posFicha = 0;
    //Si tiene 2 fichas en la fila superior y no ha ninguna ficha mía
    if (fichasCPU[0] == 2 && !fichaFila0) {
        do {
            posFicha = parseInt(Math.random() * 3);
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la fila central
    else if (fichasCPU[1] == 2 && !fichaFila1) {
        do {
            posFicha = parseInt(Math.random() * 3 + 3);
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la fila inferior
    else if (fichasCPU[2] == 2 && !fichaFila2) {
        do {
            posFicha = parseInt(Math.random() * 3 + 6);
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la columna izq
    else if (fichasCPU[3] == 2 && !fichaColumna0) {
        var opcionesColumna0 = new Array(0, 3, 6);
        do {
            posFicha = opcionesColumna0[parseInt(Math.random() * 3)];
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la columna central
    else if (fichasCPU[4] == 2 && !fichaColumna1) {
        var opcionesColumna1 = new Array(1, 4, 7);
        do {
            posFicha = opcionesColumna1[parseInt(Math.random() * 3)];
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la columna derecha
    else if (fichasCPU[5] == 2 && !fichaColumna2) {
        var opcionesColumna2 = new Array(2, 5, 8);
        do {
            posFicha = opcionesColumna2[parseInt(Math.random() * 3)];
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la diagonal izq-drcha
    else if (fichasCPU[6] == 2 && !fichaDiagonal0) {
        var opcionesDiagonal0 = new Array(0, 4, 8);
        do {
            posFicha = opcionesDiagonal0[parseInt(Math.random() * 3)];
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
    //Si tiene 2 fichas en la diagonal drcha-izq
    else if (fichasCPU[7] == 2 && !fichaDiagonal1) {
        var opcionesDiagonal1 = new Array(2, 4, 6);
        do {
            posFicha = opcionesDiagonal1[parseInt(Math.random() * 3)];
        } while (botones[posFicha].innerHTML == "X" || botones[posFicha].innerHTML == "O")
        botones[posFicha].innerHTML = "O";
        //return posFicha
    }
}
function compruebaJugador() {
    //  let jugadorGana=false;
    //COMPRUEBA SI EL JUGADOR HA GANADO POR FILAS. Si ha ganado, pinto las casillas de color para diferenciarlas
    if (botones[0].innerHTML == "X" && botones[1].innerHTML == "X" && botones[2].innerHTML == "X") {
        botones[0].style.background = "#46c9b0";
        botones[1].style.background = "#46c9b0";
        botones[2].style.background = "#46c9b0";
        jugadorGana = true;
    }
    if (botones[3].innerHTML == "X" && botones[4].innerHTML == "X" && botones[5].innerHTML == "X") {
        botones[3].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[5].style.background = "#46c9b0";
        jugadorGana = true;
    }
    if (botones[6].innerHTML == "X" && botones[7].innerHTML == "X" && botones[8].innerHTML == "X") {
        botones[6].style.background = "#46c9b0";
        botones[7].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        jugadorGana = true;
    }

    //COMPRUEBA SI EL JUGADOR HA GANADO POR COLUMNAS
    if (botones[0].innerHTML == "X" && botones[3].innerHTML == "X" && botones[6].innerHTML == "X") {
        botones[0].style.background = "#46c9b0";
        botones[3].style.background = "#46c9b0";
        botones[6].style.background = "#46c9b0";
        jugadorGana = true;
    }
    if (botones[1].innerHTML == "X" && botones[4].innerHTML == "X" && botones[7].innerHTML == "X") {
        botones[1].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[7].style.background = "#46c9b0";
        jugadorGana = true;
    }
    if (botones[2].innerHTML == "X" && botones[5].innerHTML == "X" && botones[8].innerHTML == "X") {
        botones[2].style.background = "#46c9b0";
        botones[5].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        jugadorGana = true;
    }
    //COMPRUEBA SI EL JUGADOR HA GANADO POR DIAGONALES
    if (botones[0].innerHTML == "X" && botones[4].innerHTML == "X" && botones[8].innerHTML == "X") {
        botones[0].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        jugadorGana = true;
    }
    if (botones[2].innerHTML == "X" && botones[4].innerHTML == "X" && botones[6].innerHTML == "X") {
        botones[2].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[6].style.background = "#46c9b0";
        jugadorGana = true;
    }
    return jugadorGana;
}




function compruebaCPU() {    //COMPRUEBA SI LA CPU HA GANADO
    //let cpuGana=false;
    //COMPRUEBA SI LA CPU HA GANADO POR FILAS. Si ha ganado, pinto las casillas de color para diferenciarlas
    if (botones[0].innerHTML == "O" && botones[1].innerHTML == "O" && botones[2].innerHTML == "O") {
        botones[0].style.background = "#46c9b0";
        botones[1].style.background = "#46c9b0";
        botones[2].style.background = "#46c9b0";
        cpuGana = true;
    }
    if (botones[3].innerHTML == "O" && botones[4].innerHTML == "O" && botones[5].innerHTML == "O") {
        botones[3].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[5].style.background = "#46c9b0";
        cpuGana = true;
    }
    if (botones[6].innerHTML == "O" && botones[7].innerHTML == "O" && botones[8].innerHTML == "O") {
        botones[6].style.background = "#46c9b0";
        botones[7].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        cpuGana = true;
    }

    //COMPRUEBA SI LA CPU HA GANADO POR COLUMNAS
    if (botones[0].innerHTML == "O" && botones[3].innerHTML == "O" && botones[6].innerHTML == "O") {
        botones[0].style.background = "#46c9b0";
        botones[3].style.background = "#46c9b0";
        botones[6].style.background = "#46c9b0";
        cpuGana = true;
    }
    if (botones[1].innerHTML == "O" && botones[4].innerHTML == "O" && botones[7].innerHTML == "O") {
        botones[1].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[7].style.background = "#46c9b0";
        cpuGana = true;
    }
    if (botones[2].innerHTML == "O" && botones[5].innerHTML == "O" && botones[8].innerHTML == "O") {
        botones[2].style.background = "#46c9b0";
        botones[5].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        cpuGana = true;
    }

    //COMPRUEBA SI LA CPU HA GANADO POR DIAGONALES
    if (botones[0].innerHTML == "O" && botones[4].innerHTML == "O" && botones[8].innerHTML == "O") {
        botones[0].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[8].style.background = "#46c9b0";
        cpuGana = true;
    }
    if (botones[2].innerHTML == "O" && botones[4].innerHTML == "O" && botones[6].innerHTML == "O") {
        botones[2].style.background = "#46c9b0";
        botones[4].style.background = "#46c9b0";
        botones[6].style.background = "#46c9b0";
        cpuGana = true;
    }
    return cpuGana;
}

function reiniciar() {
    location.reload(); //Refresca la página
}

function repartePuntos() {
    var puntos = 0;
    if (document.getElementById("txt-Victoria").style.visibility == "visible" ||
            document.getElementById("txt-Empate").style.visibility == "visible" ||
            document.getElementById("txt-Derrota").style.visibility == "visible") {

        puntos++;
    }
    if (document.getElementById("txt-Victoria").style.visibility == "visible") {
        puntos++;
    }
    // return puntos;
    //Si obtengo 2 puntos significa que ha jugado la partida y la ha ganado
    //Si obtengo 1 punto significa que ha jugado la partida y no ha ganado
    //Envío los puntos obtenidos al HTML
    document.getElementById("puntuacion").innerHTML = puntos;
}

