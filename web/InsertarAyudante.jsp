<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
    else{
        String nivel = sesion.getAttribute("nivel").toString();
        if(!nivel.equals("1")){
            response.sendRedirect("../index.jsp");
        }
    }

%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/validarAyudante.js" type="text/javascript"></script>
        <title>JSP Page</title>    
    </head>
    <body>       
        <div class="container" >
            <div align="right">
                <br>                
                Bienvenido : <%= sesion.getAttribute("nombre") %>
                <a href="index.jsp?cerrar=true">Cerrar Sesion</a>
            </div>
            <h1>Insertar Ayudante</h1>
            <hr>            
            <form name="frmInsertarAyudante" method="POST" action="SERVAyudante" onsubmit="return validacion()">
                <div class="container">
                    <div class="col-md-6">
                        <div class="form-group"> <!-- DNI -->
                            <label for="dni_id" class="control-label">DNI</label>
                            <input type="text" class="form-control" id="dni_id" name="txtDni" placeholder="73095001" onkeypress="return soloNumeros(event)" onblur="limpiaDni()" >
                        </div>      
                        <div class="form-group"> <!-- Nombre -->
                            <label for="nom_id" class="control-label">NOMBRES</label>
                            <input type="text" class="form-control" id="nom_id" name="txtNombre" placeholder="Luis Alonso" onkeypress="return soloLetras(event)">
                        </div>
                        <div class="form-group"> <!-- Apellidos -->
                            <label for="ape_id" class="control-label">APELLIDOS</label>
                            <input type="text" class="form-control" id="ape_id" name="txtApe" placeholder="Romero Costilla" onkeypress="return soloLetras(event)">
                        </div>                          
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group"> <!-- Email-->
                            <label for="email_id" class="control-label" >EMAIL</label>
                            <input type="text" class="form-control" id="email_id" name="txtEmail" style="text-transform:lowercase;" placeholder="larcroco@gmail.com">
                        </div>                     
                        <div class="form-group"> <!-- Telefono Corporativo-->
                            <label for="tel_id" class="control-label">TELÉFONO CELULAR</label>
                            <input type="text" class="form-control" id="tel_id" name="txtTel" placeholder="3257618" onkeypress="return soloNumeros(event)" onblur="limpiaTC()">
                        </div>                                      
                        <div class="form-group"> <!-- Dirección-->
                            <label for="direc_id" class="control-label">DIRECCIÓN</label>
                            <input type="text" class="form-control" id="direc_id" name="txtDirec" placeholder="Jr. Wacaypata 448, Urb. Tupác Amaru, San Luis, Lima, Perú">
                        </div>                           
                    </div>                  

                    <div class="col-md-12">
                        <div class="form-group"> <!-- Submit Insertar -->
                            <input type="submit" name="btnInsertar" value="Insertar" class="btn btn-success btn-lg">
                            <a href="SERVAyudante?action=refresh" class="btn btn-danger btn-lg">Atrás</a>
                            <input type="reset" name="btnLimpiar"  value="Limpiar" class="btn btn-warning btn-lg">
                        </div>                             
                    </div>     
                </div>
            </form>
        </div>            
    </body>
</html>