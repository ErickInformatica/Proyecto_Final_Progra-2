<%@ page import="java.sql.Statement" %>
<%@ page import="edu.umg.utils.VariablesGlobales" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: elmop
  Date: 28/10/2022
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 1. obtener los valores del username y password
    String vNombre = request.getParameter("nombre");
    String vComentario = request.getParameter("comentario");
    try {
        Statement statement = VariablesGlobales.conn.createStatement();
        String sql = "insert into comentarios (nombre, comentario, idnoticia) values ('"+ vNombre + "','"+ vComentario + "','"+ Integer.parseInt(request.getParameter("id")) + "')";

        statement.execute(sql);
        statement.close();
        response.sendRedirect("detalleNoticia.jsp?id="+Integer.parseInt(request.getParameter("id")));
    } catch (SQLException throwables) {
        System.out.println( "insert: " + throwables.getMessage() );
        throwables.printStackTrace();
    }


%>

</body>
</html>
