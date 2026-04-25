package database;

/**
 * Author: Hugo Ramirez
 * Project: module 7 - assignment 7.2 part 2
 * Description: JavaBean that connects to the CSD430 MySQL database
 *  and provides methods to create and retrieve movie data.
 */
public class DbBean implements java.io.Serializable {

    java.sql.Connection connection;
    java.sql.Statement statement;

    // opens a connection to the CSD430 database
    private void connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430?";
            connection = java.sql.DriverManager.getConnection(
                url + "user=student1&password=pass"
            );
            statement = connection.createStatement();
        }
        catch (ClassNotFoundException cnfe) {
            System.out.print("Driver not found: " + cnfe);
        }
        catch (java.sql.SQLException e) {
            System.out.print("Not able to connect to SQL db: " + e);
        }
    }

    // formGetPK: builds a dropdown form with movies using movie_id (PK)
    public String formGetPK(String requestURL) {

        connect();

        java.sql.ResultSet resultSet = null;

        try {
            resultSet = statement.executeQuery(
                "SELECT movie_id FROM hugo_movies_data ORDER BY movie_id"
            );
        }
        catch (java.sql.SQLException e) {
            System.out.print("Query error: " + e);
        }

        StringBuilder sb = new StringBuilder();

        sb.append("<form method='post' action='" + requestURL + "'>\n");
        sb.append("<label for='movieSelect'>Select a Movie ID:</label><br /><br />\n");
        sb.append("<select name='movie_id' id='movieSelect'>\n");

        try {
            while (resultSet.next()) {
                String id = resultSet.getString("movie_id");

                sb.append("<option value=\"" + id + "\">");
                sb.append(id);
                sb.append("</option>\n");
            }
        }
        catch (Exception e) {
            System.out.print("ResultSet error: " + e);
        }

        sb.append("</select><br /><br />\n");
        sb.append("<input type='submit' value='Select Movie' />\n");
        sb.append("</form>\n");

        return sb.toString();
    }

    // create: inserts a new movie record into hugo_movies_data
    public String create(String title, String director, int releaseYear,
                         String genre, double imdbRating) {

        connect();

        try {
            title    = title.replace("'", "\\'");
            director = director.replace("'", "\\'");
            genre    = genre.replace("'", "\\'");
        }
        catch (NullPointerException e) {
            return "<p>Error: one or more form fields were empty.</p>";
        }

        String sql = "INSERT INTO hugo_movies_data (title, director, release_year, genre, imdb_rating) "
                   + "VALUES ('" + title + "', '" + director + "', " + releaseYear
                   + ", '" + genre + "', " + imdbRating + ")";

        try {
            statement.executeUpdate(sql);
            return "<p><strong>Record added successfully.</strong> "
                 + "'" + title + "' has been inserted into the database.</p>";
        }
        catch (java.sql.SQLException e) {
            return "<p>Error inserting record: " + e.getMessage() + "</p>";
        }
    }

    // read: returns a single movie record as an HTML table
    public String read(int movieId) {

        connect();

        java.sql.ResultSet resultSet = null;

        try {
            resultSet = statement.executeQuery(
                "SELECT * FROM hugo_movies_data WHERE movie_id=" + movieId
            );
        }
        catch (java.sql.SQLException e) {
            return "<p>Query error: " + e.getMessage() + "</p>";
        }

        StringBuilder sb = new StringBuilder();

        sb.append("<h3>Selected Movie Record</h3>\n");
        sb.append("<table border='1' cellpadding='8' cellspacing='0'>\n");
        sb.append("  <thead>\n");
        sb.append("    <tr>\n");
        sb.append("      <th>ID</th>\n");
        sb.append("      <th>Title</th>\n");
        sb.append("      <th>Director</th>\n");
        sb.append("      <th>Release Year</th>\n");
        sb.append("      <th>Genre</th>\n");
        sb.append("      <th>IMDB Rating</th>\n");
        sb.append("    </tr>\n");
        sb.append("  </thead>\n");
        sb.append("  <tbody>\n");

        try {
            if (resultSet.next()) {
                sb.append("    <tr>\n");
                sb.append("      <td>" + resultSet.getString("movie_id")     + "</td>\n");
                sb.append("      <td>" + resultSet.getString("title")        + "</td>\n");
                sb.append("      <td>" + resultSet.getString("director")     + "</td>\n");
                sb.append("      <td>" + resultSet.getString("release_year") + "</td>\n");
                sb.append("      <td>" + resultSet.getString("genre")        + "</td>\n");
                sb.append("      <td>" + resultSet.getString("imdb_rating")  + "</td>\n");
                sb.append("    </tr>\n");
            } else {
                sb.append("    <tr><td colspan='6'>No record found.</td></tr>\n");
            }
        }
        catch (java.sql.SQLException e) {
            sb.append("    <tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>\n");
        }

        sb.append("  </tbody>\n");
        sb.append("</table>\n");

        return sb.toString();
    }

    // readAll: returns all movie records as an HTML table
    public String readAll() {

        connect();

        java.sql.ResultSet resultSet = null;

        try {
            resultSet = statement.executeQuery(
                "SELECT * FROM hugo_movies_data ORDER BY movie_id"
            );
        }
        catch (java.sql.SQLException e) {
            return "<p>Query error: " + e.getMessage() + "</p>";
        }

        StringBuilder sb = new StringBuilder();

        sb.append("<h3>All Movies in Database</h3>\n");
        sb.append("<p>The table below lists all movies currently stored in the hugo_movies_data table.</p>\n");
        sb.append("<table border='1' cellpadding='8' cellspacing='0'>\n");
        sb.append("  <thead>\n");
        sb.append("    <tr>\n");
        sb.append("      <th>ID</th>\n");
        sb.append("      <th>Title</th>\n");
        sb.append("      <th>Director</th>\n");
        sb.append("      <th>Release Year</th>\n");
        sb.append("      <th>Genre</th>\n");
        sb.append("      <th>IMDB Rating</th>\n");
        sb.append("    </tr>\n");
        sb.append("  </thead>\n");
        sb.append("  <tbody>\n");

        try {
            while (resultSet.next()) {
                sb.append("    <tr>\n");
                sb.append("      <td>" + resultSet.getString("movie_id")     + "</td>\n");
                sb.append("      <td>" + resultSet.getString("title")        + "</td>\n");
                sb.append("      <td>" + resultSet.getString("director")     + "</td>\n");
                sb.append("      <td>" + resultSet.getString("release_year") + "</td>\n");
                sb.append("      <td>" + resultSet.getString("genre")        + "</td>\n");
                sb.append("      <td>" + resultSet.getString("imdb_rating")  + "</td>\n");
                sb.append("    </tr>\n");
            }
        }
        catch (java.sql.SQLException e) {
            sb.append("    <tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>\n");
        }

        sb.append("  </tbody>\n");
        sb.append("</table>\n");

        return sb.toString();
    }
}
