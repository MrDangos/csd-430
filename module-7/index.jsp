<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!--
 Author: Hugo Ramirez
 Project: module 7 - assignment 7.2 part 2
 Created: 04/25/2026
 Description: Uses a JavaBean to connect to the
    CSD430 database and display movie data from hugo_movies_data.
    Updated Part 2: added link to CRUD_Create.jsp.
-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD430 - Hugo's Movies Database</title>
</head>
<body>

<h1>Movie Database</h1>

<p>
    <a href="index.jsp">Search Movie</a>
    &nbsp;|&nbsp;
    <a href="CRUD_Create.jsp">Add New Movie</a>
</p>

<hr />

<jsp:useBean id='myDB' class='database.DbBean' />

<%
if (request.getMethod().equals("GET")) {
    out.print(myDB.formGetPK("index.jsp"));
}
%>

<%
if (request.getMethod().equals("POST")) {
    String movieIdParam = request.getParameter("movie_id");
%>

<%= myDB.formGetPK("index.jsp") %>

<hr />

<p><strong>You selected movie ID:</strong> <%= movieIdParam %></p>
<%= myDB.read(Integer.parseInt(movieIdParam)) %>

<br />

<%= myDB.readAll() %>

<%
}
%>

<hr />
<p><a href="index.jsp">Reset</a></p>

</body>
</html>
