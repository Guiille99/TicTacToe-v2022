<%-- 
    Document   : index
    Created on : 10 may. 2022, 11:59:06
    Author     : Guillermo Jarana
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
    HttpSession sesion=request.getSession();
    Usuario user=new Usuario();
        if(sesion.getAttribute("usuario")==null){ //Si la sesión no existe me redirige al login
            response.sendRedirect("InicioSesion.jsp");
        }
        else{ //Si existe, obtengo la sesion cuyo atributo es el que le doy cuando se inicia sesión
        user=(Usuario)sesion.getAttribute("usuario");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/Favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/index_Estilo.css">
        <title>Inicio-Tres en Raya</title>
    </head>
    <body>
        <div id="contenedor">
            <!--CABECERA--> 
            <header>
                <div id="cabecera-contenedor"> 
                    <div id="container-logo">
                        <a href="index.jsp"><img src="imagenes/logo.png" alt="Logo" id="logo"></a>
                    </div>       
                    <nav id="menuNavegacion">
                        <ul>
                            <li><a href="index.jsp">INICIO</a></li>
                            <li><a href="#title-rules">REGLAS DEL JUEGO</a></li>
                            <li><a href="Jugar.jsp">JUGAR</a></li>     
                            <li><a href="Ranking.jsp">RANKING</a></li>   
                            <div id="sesion">
                                <div id="datosUser">
                                    <img src="imagenes/userLogin.png" alt="userLogin"/>
                                    <p>Bienvenido, <%= user.getNombreUsuario()%></p>
                                </div>
                                <div id="cierraSesion">
                                    <form action="cierraSesion.jsp" method="post">
                                        <input type="submit" value="Cerrar sesión" id="BtnCerrarSesion"/> 
                                    </form>
                                    <!-- <a href="InicioSesion.jsp">Cerrar sesión</a> -->
                                </div>
                            </div>

                        </ul>
                    </nav>
                </div>
            </header>
            <div id="contenedor-central">
                <div id="paginaInicio">
                    <div id="tituloPagina">
                        <h2>TIC TAC TOE</h2>

                    </div>
                    <img src="imagenes/imagenInicial.png" alt="">
                    <div id="contenedor-BtnJugar">
                        <!--<input type="button" name="play" value="JUGAR" id="BtnJugar">-->
                        <button type="button" name="play" id="BtnJugar"><a href="Jugar.jsp">JUGAR</a></button>
                    </div>                 
                </div>
                <a name="title-rules"></a>
                <div id="reglasJuego-container">
                    <div id="titulo-Reglas">
                        <h2>REGLAS DEL JUEGO</h2> 
                    </div>    
                    <div id="reglas-juego">
                        <p>Es un juego de 2 jugadores en el que cada uno deberá escoger un símbolo con el que va a jugar
                            durante la partida. Estos símbolos normalmente son 'X' o 'O'. Cada jugador solo debe colocar su símbolo una vez por turno y no debe ser sobre una 
                            casilla ya jugada. En caso de que el jugador haga trampa el ganador será el otro. 
                            Se debe conseguir realizar una línea recta o diagonal por símbolo. El juego finalizará
                            cuando uno de los dos jugadores consiga rellenar una fila, columna o diagonal de su mismo
                            símbolo, o cuando todas las casillas estén ocupadas y no haya conseguido ganar
                            nadie, en ese caso la partida quedará en empate.</p>
                    </div>
                    <div id="titulo-comoJugar">
                        <h2>¿CÓMO JUGAR TIC TAC TOE?</h2> 
                    </div> 
                    <p>Usa el ratón para colocar las piezas en el tablero dando click izquierdo en la casilla donde
                        deseas colocar tu ficha. Recuerda que en dicha casilla no debe haber ninguna ficha ya colocada.</p>
                </div>
            </div>
            <footer>
                <div id="info">
                    <div id="RRSS">
                        <div class="titulos-footer">
                            <h5>SÍGANOS</h5>
                        </div>

                        <ul>
                            <li><a href="https://twitter.com/" target="_blank">
                                    <img src="imagenes/logoTwitter.png" alt="Twitter Logo"/>
                                    Twitter</a>
                            </li>
                            <li><a href="https://es-es.facebook.com/" target="_blank">
                                    <img src="imagenes/logoFacebook.png" alt="Facebook Logo"/>
                                    Facebook</a>
                            </li>
                            <li><a href="https://www.instagram.com/" target="_blank">
                                    <img src="imagenes/logoInstagram.png" alt="Instagram Logo"/>
                                    Instagram</a>
                            </li>
                            <li><a href="https://discord.com/" target="_blank">
                                    <img src="imagenes/logoDiscord.png" alt="Discord Logo"/>
                                    Discord</a>
                            </li>
                        </ul>
                    </div>
                    <div id="contacto-container">
                        <div class="titulos-footer">
                            <h5>CONTACTO</h5>
                        </div>
                        <ul>
                            <li>  
                                <img src="imagenes/icono-mail.png" alt="icono-mail">
                                <a href="mailto:info@tic-tac-toeSevilla@gmail.com">info@tic-tac-toeSevilla@gmail.com</a>
                            </li>
                            <li>
                                <img src="imagenes/icono-tlfn.png" alt="icono-tlfn"/>
                                654828194 / 943247098
                            </li>
                            <li>
                                <img src="imagenes/icono-ubicacion.png" alt="icono-ubicacion"/>
                                Los Palacios y Villafranca (Sevilla), 41720-España
                            </li>
                        </ul>
                    </div>

                </div>


                <div id="contenedor-copyright">
                    <img src="imagenes/icono-copyright.png" alt="icono-copyright"/>
                    <p>2022 Guillermo Jarana Barragán</p>
                </div>
            </footer>
        </div>
    </body>
</html>
