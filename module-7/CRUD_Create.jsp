<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!--
 Author: Hugo Ramirez
 Project: module 7 - assignment 7.2 part 2
 Created: 04/25/2026
 Description: Displays a form for adding a new movie
    record to the hugo_movies_data table. On form submission,
    the record is inserted and all current records are displayed.
-->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD430 - Add New Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>

<jsp:useBean id='myDB' class='database.DbBean' />

<%
if (request.getMethod().equals("GET")) {
%>

<h2>New Movie Entry Form</h2>

<form method="post" action="CRUD_Create.jsp">

    <label for="title">Movie Title:</label><br />
    <input type="text" id="title" name="title" size="40" required /><br /><br />

    <label for="director">Director:</label><br />
    <input type="text" id="director" name="director" size="40" required /><br /><br />

    <label for="release_year">Release Year:</label><br />
    <input type="number" id="release_year" name="release_year"
           min="1888" max="2100" required /><br /><br />

    <label for="genre">Genre:</label><br />
    <input type="text" id="genre" name="genre" size="20" required /><br /><br />

    <label for="imdb_rating">IMDB Rating (0.0 - 10.0):</label><br />
    <input type="number" id="imdb_rating" name="imdb_rating"
           step="0.1" min="0.0" max="10.0" required /><br /><br />

    <input type="submit" value="Add Movie" />
    <input type="reset"  value="Clear Form" />

</form>

<%
}
%>

<%
if (request.getMethod().equals("POST")) {

    String title      = request.getParameter("title");
    String director   = request.getParameter("director");
    int    year       = Integer.parseInt(request.getParameter("release_year"));
    String genre      = request.getParameter("genre");
    double rating     = Double.parseDouble(request.getParameter("imdb_rating"));
%>

<%= myDB.create(title, director, year, genre, rating) %>

<%= myDB.readAll() %>

<br />
<a href="CRUD_Create.jsp">Add Another Movie</a>
&nbsp;|&nbsp;
<a href="index.jsp">Back to Index</a>

<%
}
%>


<p><a href="index.jsp">Back to Index</a></p>

</body>
</html>
