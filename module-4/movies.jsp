<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="coffeeBeans.Movie, java.util.List, java.util.ArrayList" %>


<!-- 
 Author: Hugo Ramirez 
 Project: assignment_4-2.jsp
 Created: 04/11/2026
 Description: JSP page that uses the Movie JavaBean to display a formatted
    table of personally enjoyed movies. Data is stored in Movie
    beans and rendered via scriptlets. All HTML tags live outside
    the scriptlet blocks per assignment requirements.
 -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">
    <title>My Favorite Movies</title>
</head>

<%!
    private List<Movie> getMovies() {
        List<Movie> list = new ArrayList<>();

        list.add(new Movie(
            "1917",
            2019,
            "War / Action",
            "Sam Mendes",
            "At the height of the First World War, two young British soldiers, Schofield and Blake are given a seemingly impossible mission. In a race against time, they must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers and Blake's own brother is one among them."
        ));
        list.add(new Movie(
            "Redline",
            2009,
            "Action / Animation / Sci-Fi",
            "Takeshi Koike",
            "A daredevil driver is determined to compete in Redline, the most popular race in the galaxy. The race only occurs every five years, but in order to participate he must overcome the mafia, the government and even love."
        ));
        list.add(new Movie(
            "Jurassic Park",
            1993,
            "Adventure / Sci-Fi",
            "Steven Spielberg",
            "In Steven Spielberg's massive blockbuster, paleontologists Alan Grant (Sam Neill) and Ellie Sattler (Laura Dern) and mathematician Ian Malcolm (Jeff Goldblum) are among a select group chosen to tour an island theme park populated by dinosaurs created from prehistoric DNA. While the park's mastermind, billionaire John Hammond (Richard Attenborough), assures everyone that the facility is safe, they find out otherwise when various ferocious predators break free and go on the hunt."
        ));
        list.add(new Movie(
            "Weathering With You",
            2019,
            "Fantasy / Romance",
            "Makoto Shinkai",
            "Set during a period of exceptionally rainy weather, high-school boy Hodaka Morishima runs away from his troubled rural home to Tokyo and befriends an orphan girl who can manipulate the weather."
        ));
        list.add(new Movie(
            "Inglourious Basterds",
            2009,
            "War / Action",
            "Quentin Tarantino",
            "It is the first year of Germany's occupation of France. Allied officer Lt. Aldo Raine assembles a team of Jewish soldiers to commit violent acts of retribution against the Nazis, including the taking of their scalps. He and his men join forces with Bridget von Hammersmark, a German actress and undercover agent, to bring down the leaders of the Third Reich. Their fates converge with theater owner Shosanna Dreyfus, who seeks to avenge the Nazis' execution of her family"
        ));

        return list;
    }
%>

<%
    List<Movie> movies = getMovies();
%>

<body>

    <div>
        <h1>Movie table</h1>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Year</th>
                    <th>Genre</th>
                    <th>Director</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>

                <%-- Scriptlet: loop through Movie beans and write one <tr> per movie --%>
                <%
                    int rowNum = 1;
                    for (Movie m : movies) {
                %>
                    <tr>
                        <td><%= rowNum++ %></td>
                        <td><strong><%= m.getTitle() %></strong></td>
                        <td><%= m.getYear() %></td>
                        <td><%= m.getGenre() %></td>
                        <td><%= m.getDirector() %></td>
                        <td class="desc"><%= m.getDescription() %></td>
                    </tr>
                <%
                    } // end for
                %>

            </tbody>
        </table>
    </div>

</body>
</html>
