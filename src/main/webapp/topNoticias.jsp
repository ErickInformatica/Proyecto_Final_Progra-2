<%--
  Created by IntelliJ IDEA.
  User: elmop
  Date: 29/10/2022
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="edu.umg.dao.NoticiasDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.umg.model.Noticias" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Noticias</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

<nav>
    <div class="nav-wrapper blue">
        <a href="index.jsp" class="brand-logo">Noticias</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="topNoticias.jsp">Noticias Top</a></li>
        </ul>
    </div>
</nav>

<%
    NoticiasDAO noticiasDAO = new NoticiasDAO();
%>

<div class="collection">
    <a href="#!" class="collection-item active blue">Cantidad de Noticias publicadas:  <%= noticiasDAO.conteoNoticias() %></a>
</div>

<div class="row">
    <%
//        NoticiasDAO noticiasDAO = new NoticiasDAO();
        List<Noticias> noticias = noticiasDAO.noticiasTop();
        int i = 1;
        for( Noticias noti : noticias){
    %>
    <div class="col s4 m4">
        <div class="card">
            <div class="card-image">
                <img src="<%= noti.getImbMult() %>">
                <span class="card-title">#<%=i%> - <%= noti.getTitle() %></span>
            </div>
            <div class="card-content">
                <p> <i class="material-icons circle">chat_bubble_outline</i> Comentarios realizados en la noticia: <%= noti.getConteo() %></p>
            </div>
            <div class="card-action">
                <a href="detalleNoticia.jsp?id=<%= noti.getId()%>">Ver Noticia</a>
            </div>
        </div>
    </div>
<%--    <tr>--%>
<%--        <td><%= noti.getTitle() %></td>--%>
<%--        <td><%= noti.getConteo() %></td>--%>
<%--    </tr>--%>
    <%
            i++;
        }

    %>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>
