<%-- 
    Document   : compruebaUsuario
    Created on : 13 may. 2022, 12:40:22
    Author     : Guillermo Jarana
--%>
<%@page import="Clases.Usuario"%>
<%@page import="java.util.HashMap"%>
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
            //Guardar datos en variables
            boolean esta=false;
            String usuarioIntroducido=request.getParameter("nombreUsuario");
            String contraseñaIntroducida=request.getParameter("pass");
                    Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tres_en_rayabd", "root", "");
         Statement s = conexion.createStatement();
         request.setCharacterEncoding("UTF-8");
       
         
         ResultSet listado = s.executeQuery ("SELECT * FROM usuarios"); //Ejecuto la consulta con los valores que necesite
          
         while(listado.next()){ //Si el usuario y contraseña exsisten en la BD
         if(usuarioIntroducido.equals(listado.getString("nombre_usuario")) 
            && contraseñaIntroducida.equals(listado.getString("contraseña"))){
             //Almaceno los datos del usuario y creo un objeto
             int cod_usuario=Integer.parseInt(listado.getString("cod_usuario"));
             String nombre=listado.getString("Nombre");
             String apellidos=listado.getString("Apellidos");
             String usuario=listado.getString("nombre_usuario");
             String password=listado.getString("contraseña");
             int partidasJugadas=Integer.parseInt(listado.getString("Partidas_jugadas"));
             int victorias=Integer.parseInt(listado.getString("victorias"));
             
             
              Usuario user=new Usuario(cod_usuario, nombre, apellidos, usuario, password, partidasJugadas, victorias);
              //Creo una variable tipo sesion para almacenar los datos del usuario que ha entrado en la web
              HttpSession sesion=request.getSession(); 
              sesion.setAttribute("usuario", user); //Le doy un atributo a la sesión para identificarla
             esta=true;
         }
         }
         if(esta){
         response.sendRedirect("index.jsp");
         conexion.close();
         }
         else{  //Acutalizamos el atributo de request a fail para luego mostrar el mensaje de error en el login
         request.setAttribute("fail", "No hay acceso"); 
         conexion.close();
         //Enviamos el valor de request y response actual a InicioSesion, donde se nos redirigirá
         request.getRequestDispatcher("InicioSesion.jsp").forward(request, response); 
         //response.sendRedirect("InicioSesion.jsp");
       
         }
                    
         
//        request.setAttribute("fail","No hay acceso");
//        request.getRequestDispatcher("InicioSesion.jsp").forward(request,response);
       
       
        %>
    </body>
</html>
