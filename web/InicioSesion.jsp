<%-- 
    Document   : InicioSesion
    Created on : 11 may. 2022, 17:32:04
    Author     : Guillermo Jarana
--%>

<%@page import="Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
/*HttpSession sesion=request.getSession();
Usuario user=(Usuario)sesion.getAttribute("user");*/

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/Favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/login.css">
        <title>Login-Tres en Raya</title>
    </head>
    <body>
        <div id="contenedor">
            <div id="contenedor-central">
                <div id="contenedor-inicioSesion">
                    <div id="logo-InicioSesion">
                        <img src="imagenes/logo.png" alt="logo"/>
                    </div>
                    <div id="inicioSesion">
                        <div id="tituloInicioSesion">
                            <h2>INICIO DE SESIÓN</h2>
                        </div>
                        <div id="formularioLogin">
                            <form id="form_log" name="login" action="compruebaUsuario.jsp" method="POST">
                                <input type="text" required name="nombreUsuario" id="nombreUsuario" value="" placeholder="Nombre de usuario"/><br>
                                <input type="password" required name="pass" id="pass" value=""placeholder="Contraseña" minlength="3" maxlength="20"/><br>        
                                <input type="submit" value="Iniciar Sesión" name="BtnInicioSesion" id="BtnInicioSesion" />
                            </form>
                            <%
                            if(request.getAttribute("fail")!=null){ //Si el usuario o contraseña son incorrectos
                            out.println("<script>alert('Usuario o contraseña incorrectos')</script>");
                            }
                            //Si intentamos registrarnos con un nombre de usuario que ya existe
                            else if(request.getAttribute("usuarioNoExiste")!=null){ 
                            out.println("<script>alert('El usuario introducido ya existe. Pruebe de nuevo')</script>");
                            }
                            %>
                        </div>
                    </div>
                    <div id="preguntaRegistro"> 
                        <a href="Registro.jsp">¿No tienes cuenta? Regístrate</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
