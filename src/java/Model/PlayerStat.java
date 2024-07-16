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
public class PlayerStat {

    private int statId;
    private int playerID;
    private int matchID;

    private int goalsScored;
    private int assists;
    private int yellowCards;
    private int redCards;
  private  MatchSchedule matchSchedule;

    public PlayerStat(int statId, int playerID, int matchID, int goalsScored, int assists, int yellowCards, int redCards) {
        this.statId = statId;
        this.playerID = playerID;
        this.matchID = matchID;
        this.goalsScored = goalsScored;
        this.assists = assists;
        this.yellowCards = yellowCards;
        this.redCards = redCards;
    }

    public PlayerStat(int playerID, int matchID, int goalsScored, int assists, int yellowCards, int redCards) {
        this.playerID = playerID;
        this.matchID = matchID;
        this.goalsScored = goalsScored;
        this.assists = assists;
        this.yellowCards = yellowCards;
        this.redCards = redCards;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public MatchSchedule getMatchSchedule() {
        return matchSchedule;
    }

    public void setMatchSchedule(MatchSchedule matchSchedule) {
        this.matchSchedule = matchSchedule;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

   
    
    public int getStatId() {
        return statId;
    }

    public void setStatId(int statId) {
        this.statId = statId;
    }

   

    public int getGoalsScored() {
        return goalsScored;
    }

    public void setGoalsScored(int goalsScored) {
        this.goalsScored = goalsScored;
    }

    public int getAssists() {
        return assists;
    }

    public void setAssists(int assists) {
        this.assists = assists;
    }

    public int getYellowCards() {
        return yellowCards;
    }

    public void setYellowCards(int yellowCards) {
        this.yellowCards = yellowCards;
    }

    public int getRedCards() {
        return redCards;
    }

    public void setRedCards(int redCards) {
        this.redCards = redCards;
    }

    @Override
    public String toString() {
        return "PlayerStat{" + "statId=" + statId + ", playerID=" + playerID + ", matchID=" + matchID + ", goalsScored=" + goalsScored + ", assists=" + assists + ", yellowCards=" + yellowCards + ", redCards=" + redCards + '}';
    }

   
}
