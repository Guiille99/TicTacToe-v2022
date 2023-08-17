<%-- 
    Document   : repartePuntos
    Created on : 21 may. 2022, 16:36:23
    Author     : Guillermo Jarana
--%>

<%@page import="Clases.Usuario"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reparte Puntos</title>
    </head>
    <body>
        <%
            String puntosString=request.getParameter("puntuacion");
           
            if(puntosString.isEmpty()){ //Si pulsa el botón sin haber acabado la partida
            response.sendRedirect("Jugar.jsp");
            }
            else{
          //  int puntosGestion = Integer.parseInt(request.getParameter("puntuacion"));
            int puntosGestion=Integer.parseInt(puntosString); //Conviero el número a int
            int partidasJugadas=0;
            int victorias=0;
           // out.println(puntosGestion);

            HttpSession sesion = request.getSession();
            Usuario user = (Usuario) sesion.getAttribute("usuario");
            String nombreUsuario = user.getNombreUsuario(); //Obtengo el nombre de usuario

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tres_en_rayabd", "root", "");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");

            ResultSet listado = s.executeQuery("SELECT nombre_usuario, Partidas_jugadas, victorias FROM usuarios "
                    + "where nombre_usuario='" + nombreUsuario + "';");

            while (listado.next()) {
                //Obtengo el nº de partidas y victorias del usuario
                 partidasJugadas = Integer.parseInt(listado.getString("Partidas_jugadas"));
                 victorias = Integer.parseInt(listado.getString("victorias"));
            }
                //Si tengo 2 puntos para añadir significará que 1 va en las partidas jugadas y otro en las victorias
                if (puntosGestion == 2) {
                    //Añado los puntos correspondientes
                    partidasJugadas = partidasJugadas + 1;
                    victorias = victorias + 1;
                    //Actualizo la BD
                    s.executeUpdate("UPDATE usuarios set Partidas_jugadas=" + partidasJugadas
                            + ", victorias=" + victorias + " where nombre_usuario='" + nombreUsuario + "';");
                } else if (puntosGestion == 1) {  //Si es 1, solo se añadirá 1 en las`partidas jugadas
                    partidasJugadas = partidasJugadas + 1;
                    s.executeUpdate("UPDATE usuarios set Partidas_jugadas=" + partidasJugadas
                            +" where nombre_usuario='" + nombreUsuario + "';");
                }
            conexion.close();
            response.sendRedirect("Jugar.jsp");
            }
        %>
    </body>
</html>
