/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Desktop
 */
public class ExpectedLineups {

    private int lineupID;
    private int matchID;
    private int playerID;
    private String lineupName;
    private Position position;
    private double xLocation;
    private double yLocation;

    public ExpectedLineups() {
    }

    public ExpectedLineups(int lineupID, int matchID, int playerID, String lineupName, Position position, double xLocation, double yLocation) {
        this.lineupID = lineupID;
        this.matchID = matchID;
        this.playerID = playerID;
        this.lineupName = lineupName;
        this.position = position;
        this.xLocation = xLocation;
        this.yLocation = yLocation;
    }

    public ExpectedLineups(int matchID, int playerID, String lineupName, Position position, double xLocation, double yLocation) {

        this.matchID = matchID;
        this.playerID = playerID;
        this.lineupName = lineupName;
        this.position = position;
        this.xLocation = xLocation;
        this.yLocation = yLocation;
    }

    public int getLineupID() {
        return lineupID;
    }

    public void setLineupID(int lineupID) {
        this.lineupID = lineupID;
    }

    public int getMatchID() {
        return matchID;
    }

    public void setMatchID(int matchID) {
        this.matchID = matchID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public String getLineupName() {
        return lineupName;
    }

    public void setLineupName(String lineupName) {
        this.lineupName = lineupName;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public double getxLocation() {
        return xLocation;
    }

    public void setxLocation(double xLocation) {
        this.xLocation = xLocation;
    }

    public double getyLocation() {
        return yLocation;
    }

    public void setyLocation(double yLocation) {
        this.yLocation = yLocation;
    }

}
