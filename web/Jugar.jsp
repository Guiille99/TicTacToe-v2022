<%-- 
    Document   : Jugar
    Created on : 11 may. 2022, 17:50:11
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
        else{ //Si existe, obtengo la sesión con el atributo que le asigné al hacer login el usuario
        user=(Usuario)sesion.getAttribute("usuario");
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/Favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/jugar_Estilo.css">
        <!-- <script type="text/javascript" src="js/Juego.js"></script>-->
        <title>Jugar-Tres en Raya</title>
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
                            <li><a href="index.jsp#title-rules">REGLAS DEL JUEGO</a></li>
                            <li><a href="Jugar.jsp">JUGAR</a></li>     
                            <li><a href="Ranking.jsp">RANKING</a></li>  
                            <div id="sesion">
                                <div id="datosUser">
                                    <img src="imagenes/userLogin.png" alt="userLogin"/>
                                    <p>Bienvenido, <%= user.getNombreUsuario() %></p>
                                </div>
                                <div id="cierraSesion">
                                    <form action="cierraSesion.jsp" method="post">
                                        <input type="submit" value="Cerrar sesión" id="BtnCerrarSesion"/> 
                                    </form>
                                </div>
                            </div>

                        </ul>
                    </nav>
                </div>
            </header>

            <div id="text-Resultado">
                <div id="txt-Victoria">
                    <p>¡Enhorabuena, has ganado!</p>
                </div>
                <div id="txt-Derrota">
                    <p>Vaya, has perdido....</p>
                </div>
                <div id="txt-Empate">
                    <p>La partida ha terminado en empate. ¡Vaya partida tan igualada!</p>
                </div>
            </div>
            <div id="contenedor-centralJuego">
                <div id="tablero">
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button>
                    <button></button> 
                </div>

                <div id="botones">
                    <div id="BtnReset" onclick="reiniciar()">
                        <input type="reset" value="Reiniciar" />
                    </div> 
                    <!--Recibo los puntos obtenidos de la función, si obtengo 2 significará que debo sumar
                    1 punto tanto en partidas jugadas como en victorias, si recibo 1, solo se añadirá en 
                    partidas jugadas. Una vez recibido lo envío a otro JSP para que actualice la BD-->
                    <form action="repartePuntos.jsp" method="POST">
                        <textarea id="puntuacion" name="puntuacion" style="visibility: hidden"></textarea>
                        <input type="submit" id="BtnActualizarPuntos" value="Actualizar puntos"/>
                    </form>
                </div>
            </div>
            <%
//             if(request.getAttribute("puntosVacio")!=null){
//             out.println("<script>alert('Debe terminar la partida para actualizar los puntos')</script>");
           // }
            %>

        </div>
        <script src="js/Juego.js"></script>
    </body>
</html>
