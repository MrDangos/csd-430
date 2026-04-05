<!--
Author: Hugo Ramirez 
Project: JSP Job Application Form
File: job_results.jsp
Date: 04/05/2026
Description: Job run results page. Displays all submitted form data from job_application.html displayed in a table.
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- Scriptlet: Retrieve all form parameters and handle null/empty values --%>
<%
    /* --- Personal information --- */
    String firstName = request.getParameter("firstName");
    String lastName  = request.getParameter("lastName");
    String phone     = request.getParameter("phone");
    String email     = request.getParameter("email");
    String location  = request.getParameter("location");

    if (firstName == null || firstName.trim().isEmpty()) firstName = "Not provided";
    if (lastName  == null || lastName.trim().isEmpty())  lastName  = "Not provided";
    if (phone     == null || phone.trim().isEmpty())     phone     = "Not provided";
    if (email     == null || email.trim().isEmpty())     email     = "Not provided";
    if (location  == null || location.trim().isEmpty())  location  = "Not provided";

    String fullName = firstName + " " + lastName;

    /* --- Position details --- */
    String position  = request.getParameter("position");
    String empType   = request.getParameter("empType");
    String startDate = request.getParameter("startDate");

    if (position  == null || position.trim().isEmpty())  position  = "Not provided";
    if (empType   == null || empType.trim().isEmpty())   empType   = "Not provided";
    if (startDate == null || startDate.trim().isEmpty()) startDate = "Not provided";

    /* --- Availability checkboxes (multiple values) --- */
    String[] daysArray = request.getParameterValues("days");

    String daysDisplay = "None selected";
    if (daysArray != null && daysArray.length > 0) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < daysArray.length; i++) {
            sb.append(daysArray[i]);
            if (i < daysArray.length - 1) sb.append(", ");
        }
        daysDisplay = sb.toString();
    }

    /* --- Experience and background --- */
    String yearsExp   = request.getParameter("yearsExp");
    String diploma    = request.getParameter("diploma");
    String education  = request.getParameter("education");
    String statement  = request.getParameter("statement");

    if (yearsExp  == null || yearsExp.trim().isEmpty())  yearsExp  = "Not provided";
    if (diploma   == null || diploma.trim().isEmpty())   diploma   = "Not answered";
    if (education == null || education.trim().isEmpty()) education = "Not provided";
    if (statement == null || statement.trim().isEmpty()) statement = "No statement provided.";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Application Received</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
        }
        
table {
            border-collapse: collapse;
            width: 600px;
            margin-bottom: 24px;
        }

        th {
            background-color: #969696;
            padding: 8px;
            text-align: left;
        }

        td {
            padding: 8px;
            border: 1px solid #cccccc;
            background-color: #ffffff;
        }

        a {
            display: inline-block;
            margin-top: 10px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

    <h1>Application Received</h1>
    <p>Thank you, <%= fullName %>! Below is a summary of your submitted application.</p>

    <h2>Personal Information</h2>
    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>
        <tr>
            <td>Full Name</td>
            <td><%= fullName %></td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><%= phone %></td>
        </tr>
        <tr>
            <td>Email Address</td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td>Location</td>
            <td><%= location %></td>
        </tr>
    </table>

    <h2>Position Details</h2>
    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>
        <tr>
            <td>Position Applied For</td>
            <td><%= position %></td>
        </tr>
        <tr>
            <td>Employment Type</td>
            <td><%= empType %></td>
        </tr>
        <tr>
            <td>Available Start Date</td>
            <td><%= startDate %></td>
        </tr>
    </table>

    <h2>Availability</h2>
    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>
        <tr>
            <td>Days Available</td>
            <td><%= daysDisplay %></td>
        </tr>
    </table>

    <h2>Experience and Background</h2>
    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>
        <tr>
            <td>Years of Experience</td>
            <td><%= yearsExp %></td>
        </tr>
        <tr>
            <td>High School Diploma / GED</td>
            <td><%= diploma %></td>
        </tr>
        <tr>
            <td>Highest Education Level</td>
            <td><%= education %></td>
        </tr>
        <tr>
            <td>Personal Statement</td>
            <td><%= statement %></td>
        </tr>
    </table>

    <a href="job_application.html">Go Back to Application</a>

</body>
</html>
