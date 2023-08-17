<%-- 
    Document   : Ranking
    Created on : 15 may. 2022, 12:34:26
    Author     : Guillermo Jarana
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    Usuario user = new Usuario();
    if (sesion.getAttribute("usuario") == null) { //Si la sesión no existe me redirige al login
        response.sendRedirect("InicioSesion.jsp");
    } else {
        user = (Usuario) sesion.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/Favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/ranking_Estilo.css">

        <title>Ranking-Tres en Raya</title>
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
                                    <p>Bienvenido, <%= user.getNombreUsuario()%></p>
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
            <div id="contendor-central">
                <div id="Ranking">

                    <div id="tituloRanking">
                        <h1>TOP 10 Jugadores con más victorias</h1>
                        <!-- <iframe src="" frameborder="0"></iframe> -->  
                        <!-- <input onclick="prueba()" type="button" style="width: 50px"/>-->

                    </div>       

                    <div id="listadoRanking">
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tres_en_rayabd", "root", "");
                            Statement s = conexion.createStatement();

                            ResultSet listado = s.executeQuery("SELECT nombre_usuario, Partidas_jugadas, victorias FROM usuarios");
                            ArrayList<Usuario> listaUsuarios = new ArrayList();
                            while (listado.next()) {
                                String usuario = listado.getString("nombre_usuario");
                                int partidasJugadas = Integer.parseInt(listado.getString("Partidas_jugadas"));
                                int victorias = Integer.parseInt(listado.getString("victorias"));
                                Usuario usu = new Usuario(usuario, partidasJugadas, victorias);

                                listaUsuarios.add(usu); //Añadimos cada usuario a la lista

                            }

//                      for (Usuario i : listaUsuarios) {
//                              out.println(i.toString2());
//                          }

                        %>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Posición</th>
                                    <th>Usuario</th>
                                    <th>Partidas jugadas</th>
                                    <th>Victorias</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Collections.sort(listaUsuarios); //Ordena los usuarios
                                    int it = 1;
                                    for (Usuario i : listaUsuarios) {
                                        if (it % 2 == 0) {
                                            out.println("<tr class='par'>");
                                        } else {
                                            out.println("<tr class='impar'>");
                                        }
                                        out.println("<th>" + it + "</th>");
                                        out.println("<th>" + i.getNombreUsuario() + "</th>");
                                        out.println("<th>" + i.getPartidasJugadas() + "</th>");
                                        out.println("<th>" + i.getVictorias() + "</th>");
                                        out.println("</tr>");
                                        it++;
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
              <!--Al hacer click se envía la lista de usuarios a otra página la cual se encargará de imprimirla-->
                    <form action="imprimeRanking.jsp" method="POST">
                        <input id="BtnImprimir" type="submit" onclick="alert('Fichero cargado')" value="Imprimir ranking">
                    </form> 
                </div>

            </div>

        </div>
    </body>
</html>
