<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.umg.utils.VariablesGlobales" %>
<%@ page import="org.json.JSONArray" %><%--
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



    try {
      String url = "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=8bMSgiHgVFc4LXJka9H7KXC3roYNtqvN";
      URL obj = new URL(url);
      HttpURLConnection con = (HttpURLConnection) obj.openConnection();
      BufferedReader in =new BufferedReader(
              new InputStreamReader(con.getInputStream()));
      String inputLine;
      StringBuffer strBuffer = new StringBuffer();
      while ((inputLine = in.readLine()) != null) {
        strBuffer.append(inputLine);
      } in .close();

      //OBTENER DATOS JSON
      JSONObject myresponse = new JSONObject(strBuffer.toString());
      JSONArray ja_results = myresponse.getJSONArray("results");

      //VALIDAR QUE EL JSON NO SEA MAYOR A 3O CAMPOS
      int lenResults = 0;
      if(ja_results.length() > 30){
        lenResults = 30;
      } else {
        lenResults = ja_results.length();
      }
      Statement statement = VariablesGlobales.conn.createStatement();
      for(int i=0; i<lenResults; i++) {
        JSONObject jsonResultos = ja_results.getJSONObject(i);
        String jsonTitle = jsonResultos.getString("title");
        String jsonAbstract = jsonResultos.getString("abstract");
        String jsonByLine = jsonResultos.getString("byline");

        //MULTIMEDIA IMG
        JSONArray ja_imgMult = myresponse.getJSONArray("multimedia");
        JSONObject jsonImgMult = ja_imgMult.getJSONObject(0);
        String jsonImg = jsonImgMult.getString("url");

        String sql = "insert into noticias (Title, Abstract, Byline, imbMult) values ('"+ jsonTitle + "','"+ jsonAbstract + "','"+ jsonByLine + "','"+ jsonImg + "')";
        statement.execute(sql);

      }

      statement.close();

      response.sendRedirect("index.jsp");

    } catch(Exception e) {
      System.out.println(e);
    }
  %>


</body>
</html>
