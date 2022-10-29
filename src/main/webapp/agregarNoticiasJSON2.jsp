<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.umg.utils.VariablesGlobales" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.nio.charset.Charset" %><%--
  Created by IntelliJ IDEA.
  User: elmop
  Date: 29/10/2022
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
  <%
      String url = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=8bMSgiHgVFc4LXJka9H7KXC3roYNtqvN";
      URL obj = new URL(url);
      String jsonRes = IOUtils.toString(obj, Charset.forName("UTF-8"));

      //OBTENER DATOS JSON
      JSONObject myresponse = new JSONObject(jsonRes);
      JSONArray ja_results = myresponse.getJSONArray("results");

      //VALIDAR QUE EL JSON NO SEA MAYOR A 3O CAMPOS
      int lenResults = 0;
      if(ja_results.length() > 30){
        lenResults = 30;
      } else {
        lenResults = ja_results.length();
      }

      for(int i=0; i<lenResults; i++) {
        JSONObject jsonResultos = ja_results.getJSONObject(i);
        String jsonTitle = jsonResultos.getString("title");
        String jsonAbstract = jsonResultos.getString("abstract");
        String jsonByLine = jsonResultos.getString("byline");

        //MULTIMEDIA IMG
        JSONArray ja_imgMult = jsonResultos.getJSONArray("multimedia");
        JSONObject jsonImgMult = ja_imgMult.getJSONObject(0);
        String jsonImg = jsonImgMult.getString("url");

        Statement statement = VariablesGlobales.conn.createStatement();
        String sql = "insert into noticias (Title, Abstract, Byline, imbMult) values ('"+ jsonTitle + "','"+ jsonAbstract + "','"+ jsonByLine + "','"+ jsonImg + "')";
        statement.execute(sql);
        statement.close();
      }


      response.sendRedirect("index.jsp");


  %>

  <p><%= myresponse %></p>
</body>
</html>
