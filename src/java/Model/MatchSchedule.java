/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

/**
 *
 * @author quangminh
 */
public class MatchSchedule {
    private int matchID;
    private LocalDate matchDate;
    private String opponent;
    private String location;
    private int homeTeamID;
    private int awayTeamID;

    public MatchSchedule(int matchID, LocalDate matchDate, String opponent, String location, int homeTeamID, int awayTeamID) {
        this.matchID = matchID;
        this.matchDate = matchDate;
        this.opponent = opponent;
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
    }

    public String getOpponent() {
        return opponent;
    }

    public void setOpponent(String opponent) {
        this.opponent = opponent;
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

    @Override
    public String toString() {
        return "MatchSchedule{" +
                "matchID=" + matchID +
                ", matchDate=" + matchDate +
                ", opponent='" + opponent + '\'' +
                ", location='" + location + '\'' +
                ", homeTeamID=" + homeTeamID +
                ", awayTeamID=" + awayTeamID +
                '}';
    }
}
