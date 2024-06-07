/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import com.google.gson.annotations.SerializedName;
import java.io.Serializable;
import java.time.LocalDate;

/**
 *
 * @author quangminh
 */
public class MatchSchedule implements Serializable{
    private static final long serialVersionUID = 1L;
    
    
    private int matchID;
    private transient LocalDate matchDate;
    
    private String location;
    private int homeTeamID;
    private int awayTeamID;
    private Tournament tournament;
    
    
    @SerializedName("matchDate")
    private String matchDateString;
    public MatchSchedule() {
    }

    public MatchSchedule(LocalDate matchDate, String location, int homeTeamID, int awayTeamID, Tournament tournament) {
        this.matchDate = matchDate;
        this.tournament = tournament;
        this.location = location;
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
    }
    
    
    public MatchSchedule(int matchID, LocalDate matchDate,  String location, int homeTeamID, int awayTeamID) {
        this.matchID = matchID;
        this.matchDate = matchDate;
        
        this.location = location;
        this.homeTeamID = homeTeamID;
        this.awayTeamID = awayTeamID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
        
    }

    public LocalDate getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(LocalDate matchDate) {
        this.matchDate = matchDate;
        this.matchDateString= matchDate.toString();
    }

   

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getHomeTeamID() {
        return homeTeamID;
    }

    public void setHomeTeamID(int homeTeamID) {
        this.homeTeamID = homeTeamID;
    }

    public int getAwayTeamID() {
        return awayTeamID;
    }

    public void setAwayTeamID(int awayTeamID) {
        this.awayTeamID = awayTeamID;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    @Override
    public String toString() {
        return "MatchSchedule{" + "matchID=" + matchID + ", matchDate=" + matchDate + ", location=" + location + ", homeTeamID=" + homeTeamID + ", awayTeamID=" + awayTeamID + ", tournament=" + tournament + ", matchDateString=" + matchDateString + '}';
    }
    

    
}
