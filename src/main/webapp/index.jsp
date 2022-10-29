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
            <li><a href="agregarNoticiasJSON2.jsp">Agregar JSON</a></li>
        </ul>
    </div>
</nav>

<div class="row">
    <%
        NoticiasDAO noticiasDAO = new NoticiasDAO();
        List<Noticias> noticias = noticiasDAO.getAllNoticias();
        for( Noticias noti : noticias ){
    %>


    <div class="col s3">
        <div class="card">
            <div class="card-image">
                <img src="<%= noti.getImbMult()%>">
                <span class="card-title"><%= noti.getTitle() %></span>
            </div>
            <div class="card-content">
                <p><%= noti.getAbstractMdl()%>
                    <cite><%= noti.getByline()%></cite>
                </p>
            </div>
            <div class="card-action">
                <a href="detalleNoticia.jsp?id=<%= noti.getId()%>">Ver Noticia</a>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>