package coffeeBeans;
/**
 * Author: Hugo Ramirez
 * File: Movie.java
 * Created: 04/11/2026
 * Description: JavaBean representing a single movie entry. Stores title, year,
 * genre, director, and a short description. 
 */



public class Movie implements java.io.Serializable {

    private String title;
    private int year;
    private String genre;
    private String director;
    private String description;

    public Movie() {}

    public Movie(String title, int year, String genre, String director, String description) {
        this.title       = title;
        this.year        = year;
        this.genre       = genre;
        this.director    = director;
        this.description = description;
    }
    public String getTitle() {
        return title;
    }

    public int getYear() {
        return year;
    }

    public String getGenre() {
        return genre;
    }

    public String getDirector() {
        return director;
    }

    public String getDescription() {
        return description;
    }
    public void setTitle(String title) {
        this.title = title;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
