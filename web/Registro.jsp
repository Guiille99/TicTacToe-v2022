<%-- 
    Document   : Registro
    Created on : 11 may. 2022, 12:28:16
    Author     : Guillermo Jarana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="imagenes/Favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/registro_Estilo.css">

        <title>Registro-Tres en Raya</title>
    </head>
    <body>
        <div id="contenedor">
            <div id="contenedor-central">
                <div id="contenedor-registro">
                    <div id="logo-registro">
                        <img src="imagenes/logo.png" alt="logo"/>
                    </div>
                    <div id="registro">
                        <div id="tituloRegistro">
                            <h2>REGISTRO</h2>
                        </div>
                        <div id="formularioRegistro">
                            <form id="form_reg" name="registro" action="grabaUsuario.jsp" method="POST">
                                <!-- <label for="nombre">Usuario:</label><br> -->  
                                <input id="nombre" required type="text" name="nombre" value="" placeholder="Nombre"/><br>
                                <input id="apellidos" required type="text" name="apellidos" value="" placeholder="Apellidos"/><br>
                                <input id="nombreUsuario" required type="text" name="nombreUsuario" value="" minlength="3" maxlength="15" placeholder="Nombre de usuario"/><br>
                                <input id="pass" required type="password" name="pass" value=""placeholder="Contraseña" minlength="3" maxlength="20"/><br>        
                                <input type="submit" value="Resgistrarse" name="resgistrar" id="BtnRegistro" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
