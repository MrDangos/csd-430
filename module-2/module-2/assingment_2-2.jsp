<%@ page import="java.util.*" %>
<!-- 
 Author: Hugo Ramirez 
 Project: assignment_2-2.jsp
 Created: 03/27/2026
 Description: simple JSP file to with table created with JSP with simple css styling sheet.
 The Data in the table are movies that I enjoyed watching.
 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Movie Table</title>
</head>
<%!
    String[][] movies = {
        {"1917", "2019", "War/Action"},
        {"Redline", "2009", "Action/Animation/Sci-Fi"},
        {"Jurassic Park", "1993", "Adventure/Sci-Fi"},
        {"Weathering With You", "2019", "Fantasy/Romance"},
        {"Inglourious Basterds", "2009", "War/Action"}
    };
%>
<html>
<body>
  <h1>My Movies</h1>
  <p class="subtitle">A personal watchlist</p>
  <div class="table-wrapper">
    <table>
      <thead>
        <tr>
          <th>Title</th>
          <th>Year</th>
          <th>Genre</th>
        </tr>
      </thead>
      <tbody>
        <% for (String[] movie : movies) { %>
          <tr>
            <td><%= movie[0] %></td>
            <td><%= movie[1] %></td>
            <td><%= movie[2] %></td>
          </tr>
        <% } %>
      </tbody>
    </table>
  </div>
</body>
</html>