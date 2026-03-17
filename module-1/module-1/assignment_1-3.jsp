<%@ page import="java.util.*" %>
<!-- 
 Author: Hugo Ramirez 
 Project: assignment_1-3.jsp
 Created: 03/17/2026
 Description: simple JSP file to show that I installed an configured Tomcat and Eclipse correctly. 
 It also shows some basic JSP syntax and functionality.
 -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bio</title>
</head>

<html>
<body>
    <%!
        String getGreeting(String name) {
        return "Welcome to my page, " + name + "!";
    }

        String name = "Hugo Ramirez";
        String major = "Software Development";
        String[] hobbies = {"Model Kits", "Gaming", "Reading"};
    %>
    <h1><%= getGreeting(name) %></h1>

    <p>Major: <%= major %></p>

    <h2>My Hobbies</h2>
    <ul>
        <% for (String hobby : hobbies) { %>
            <li><%= hobby %></li>
        <% } %>
    </ul>
</body>
</html>