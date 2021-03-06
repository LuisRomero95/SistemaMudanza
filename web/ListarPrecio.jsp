<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page session="true"%>

<%
HttpSession sesion = request.getSession();
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="navbar.jsp"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
                <h1>Lista de Precios</h1>
                <hr>
                <a class="btn btn-success btn-lg" href="SERVPrecio?action=insert">Nuevo Precio</a>
                <a class="btn btn-info btn-lg" href="SERVPrecio?action=refresh">Actualizar Precio</a>
                <a class="btn btn-primary btn-lg" href="SERVEncomienda?action=refresh">Regresar a Encomiendas</a>
                <br>
                <br>
            <form method="POST">
                <table class="table table-bordered" id="tableUser" class="display">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>                
                            <th class="text-center">CLIENTE</th>
                            <th class="text-center">TIPO</th>
                            <th class="text-center">CANTIDAD</th>
                            <th class="text-center">PESO</th>
                            <th class="text-center">RESULTADO</th>                            
                            <th class="text-center">ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${precio}" var="precio">
                            <tr>
                                <td>
                                    <c:out value="${precio.id}"/>
                                </td>
                                <td>
                                    <c:out value="${precio.cliente}"/>
                                </td>                        
                                <td>
                                    <c:out value="${precio.tipo}"/>
                                </td>                                     
                                <td>
                                    <c:out value="${precio.cantidad}"/>
                                </td>                    
                                <td>
                                    <c:out value="${precio.peso}"/>
                                </td>                    
                                <td>
                                    <c:out value="${precio.resultado}"/>
                                </td>                                                                                           
                                <td class="text-center">
                                    <a href="SERVPrecio?action=edit&id=<c:out value="${precio.id}" />" class="btn btn-warning btn-sm">Editar</a>                         
                                    <a href="SERVPrecio?action=delete&id=<c:out value="${precio.id}"/>" onclick="return confirm('¿Está seguro que desea eliminar el registro?')"  class="btn btn-danger btn-sm">Eliminar</a>                            
                                </td>
                            </tr>
                        </c:forEach>                      
                    </tbody>                                             
                </table>                 
            </form> 
        </div>        
    </body>
</html>
