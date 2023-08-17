<%-- 
    Document   : grabaUsuario
    Created on : 13 may. 2022, 9:57:08
    Author     : Guillermo Jarana
--%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String usuarioIntroducido=request.getParameter("nombreUsuario");
            boolean esta=false;
                    Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tres_en_rayabd", "root", "");
         Statement s = conexion.createStatement();
         request.setCharacterEncoding("UTF-8");
         
            
            ResultSet listado = s.executeQuery ("SELECT nombre_usuario FROM usuarios");
           // LinkedHashMap<String, String> usuariosHM = new LinkedHashMap<>();
            while (listado.next()) { //Comprueba si el nombre de usuario ya existe en la BD
                if(usuarioIntroducido.equalsIgnoreCase(listado.getString("nombre_usuario"))){
                esta=true;
                }
    }
            if(esta){  //Si existe, retornará a la página de login
               // response.sendRedirect("InicioSesion.jsp");
               //Acutalizamos el atributo de request a usuarioNoExiste para luego mostrar el mensaje de error en el login
                request.setAttribute("usuarioNoExiste", "No hay acceso"); 
                //Enviamos el valor de request y response actual a InicioSesion, donde se nos redirigirá
                request.getRequestDispatcher("InicioSesion.jsp").forward(request, response);
            }
            else{ //Si no, insertará el nuevo usuario en la BD
            String insercion = "INSERT INTO usuarios(Nombre,Apellidos,nombre_usuario,contraseña) VALUES ('"
                    + request.getParameter("nombre")
                    + "', '" + request.getParameter("apellidos")
                    + "', '" + request.getParameter("nombreUsuario")
                    + "', '"  + request.getParameter("pass")+ "')";
                    s.execute(insercion);
                    conexion.close();
                    response.sendRedirect("index.jsp");       
            }
             
            
        %>

    </body>
</html>
