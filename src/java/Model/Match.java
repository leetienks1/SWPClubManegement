package Model;

import java.time.LocalDate;

import java.util.List;
/**
 *
 * @author admin
 */
public class Match {
    private int id;
    private String homeTeam;
    private String awayTeam;
    private LocalDate matchDate;
    private String stadium;
    private List<Ticket> availableTickets;

    public Match(){
    }

    public Match(int id, String homeTeam, String awayTeam, LocalDate matchDate, String stadium, List<Ticket> availableTickets) {
        this.id = id;
        this.homeTeam = homeTeam;
        this.awayTeam = awayTeam;
        this.matchDate = matchDate;
        this.stadium = stadium;
        this.availableTickets = availableTickets;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(String homeTeam) {
        this.homeTeam = homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(String awayTeam) {
        this.awayTeam = awayTeam;
    }

    public LocalDate getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(LocalDate matchDate) {
        this.matchDate = matchDate;
    }

    public String getStadium() {
        return stadium;
    }

    public void setStadium(String stadium) {
        this.stadium = stadium;
    }

    public List<Ticket> getAvailableTickets() {
        return availableTickets;
    }

    public void setAvailableTickets(List<Ticket> availableTickets) {
        this.availableTickets = availableTickets;
    }

    @Override
    public String toString() {
        return "Match{" + "ID=" + id + ", HomeTeam=" + homeTeam + ", AwayTeam=" + awayTeam + ", MatchDate=" + matchDate + ", Stadium=" + stadium + ", AvailableTickets=" + availableTickets + '}';
    }
    
    
    
    
}