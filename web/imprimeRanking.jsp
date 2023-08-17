<%-- 
    Document   : imprimeRanking
    Created on : 16 may. 2022, 16:38:15
    Author     : Guillermo Jarana
--%>

<%@page import="java.util.Collections"%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tic Tac Toe</title>
    </head>
    <body>
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
            Collections.sort(listaUsuarios); //Ordena los usuarios
            try {
                BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\Usuario\\Documents\\NetBeansProjects\\TresEnRaya\\ficheros\\usuarios.txt"));
                int it = 1;
                bw.write("POSICIÓN\tUSUARIO\t\tPARTIDAS JUGADAS\tVICTORIAS");
                bw.newLine();
                for (Usuario i : listaUsuarios) {
                //Para nombres de menos de 6 caracteres doy doble tabulación para que el fichero me quede alineado
                    if (i.getNombreUsuario().length() <= 6) { 
                        bw.write(it + "\t\t" + i.getNombreUsuario() + "\t\t" + i.getPartidasJugadas()
                                + "\t\t\t" + i.getVictorias());
                    }
                    else if(i.getNombreUsuario().length()==7){
                        bw.write(it + "\t\t" + i.getNombreUsuario() + "\t\t" + i.getPartidasJugadas()
                                + "\t\t\t" + i.getVictorias());
                    }
                    else{
                    bw.write(it + "\t\t" + i.getNombreUsuario() + "\t" + i.getPartidasJugadas()
                            + "\t\t\t" + i.getVictorias());
                    }
                    bw.newLine();
                    it++;
                }

                bw.close();
            } catch (IOException e) {
                out.println("No se ha podido escribir el fichero.");
            }
            conexion.close();
            response.sendRedirect("Ranking.jsp");
        %>
    </body>
</html>
