<%--
  Created by IntelliJ IDEA.
  User: elmop
  Date: 28/10/2022
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="edu.umg.dao.NoticiasDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="edu.umg.model.Noticias" %>
<%@ page import="edu.umg.dao.ComentariosDAO" %>
<%@ page import="edu.umg.model.Comentarios" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<%--<h1><%= Integer.parseInt(request.getParameter("id")) %></h1>--%>

<%--DETALLE NOTICIA--%>
<div class="row">
    <div class="col s3"></div>
    <%
        NoticiasDAO noticiasDAO = new NoticiasDAO();
        List<Noticias> noticias = noticiasDAO.getNoticiaByID(Integer.parseInt(request.getParameter("id")));
        for( Noticias noti : noticias ){
    %>

    <div class="col s6 m6">
        <h1><%= noti.getTitle() %></h1>
        <div class="card medium">
            <div class="card-image">
                <img src="<%= noti.getImbMult()%>">
<%--                <span class="card-title"><%= noti.getTitle() %></span>--%>
            </div>
            <div class="card-content">
                <p><%= noti.getAbstractMdl()%><br>
                    &mdash; <cite><%= noti.getByline()%></cite>
                </p>
            </div>
        </div>
    </div>
<%--    <tr>--%>
<%--        <td><%= noti.getId() %></td>--%>
<%--        <td><a href="detalleNoticia.jsp?id=<%= noti.getId()%>"></a></td>--%>
<%--        <td><%= noti.getAbstractMdl()%></td>--%>
<%--        <td><%= noti.getByline()%></td>--%>
<%--        <td></td>--%>
<%--    </tr>--%>
    <%
        }
    %>
    <div class="col s3"></div>
</div>

<%--COMENTARIOS--%>
<h5>Comentarios</h5>
<ul class="collection">
    <%
        ComentariosDAO comentariosDAO = new ComentariosDAO();
        List<Comentarios> comentarios = comentariosDAO.getComentarioByID(Integer.parseInt(request.getParameter("id")));
        for( Comentarios comen : comentarios ){
    %>
    <li class="collection-item avatar">
        <i class="material-icons circle">chat_bubble_outline</i>
        <span class="title"><%= comen.getNombre()%></span>
        <p><%= comen.getComentario()%></p>
    </li>
<%--    <tr>--%>
<%--        <td><%= comen.getId() %></td>--%>
<%--        <td><%= comen.getNombre()%></td>--%>
<%--        <td><%= comen.getComentario()%></td>--%>
<%--    </tr>--%>
    <%
        }
    %>
</ul>

<div class="row">
    <div class="col s3"></div>
    <form class="col s6" method="post" action="agregarComentario.jsp?id=<%= Integer.parseInt(request.getParameter("id")) %>">
        <div class="row">
            <h5>Agregar Comentario</h5>
            <div class="input-field col s12">
                <input id="nombre" name="nombre" type="text" class="validate">
                <label for="nombre">Nombre</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
<%--                <input id="comentario" name="comentario" type="text" class="validate">--%>
                <textarea id="comentario" name="comentario" class="materialize-textarea"></textarea>
                <label for="comentario">Comentario</label>
            </div>
        </div>
        <button class="btn waves-effect waves-light" type="submit" name="action">Agregar Comentario
            <i class="material-icons right">send</i>
        </button>
    </form>
    <div class="col s3"></div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>