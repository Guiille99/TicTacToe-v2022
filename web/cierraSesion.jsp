<%-- 
    Document   : compruebaSesion
    Created on : 15 may. 2022, 16:17:56
    Author     : Guillermo Jarana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            if(session!=null){
             session.invalidate();
            response.sendRedirect("InicioSesion.jsp");
            }

        %>
    </body>
</html>
