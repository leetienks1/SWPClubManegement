/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Desktop
 */
public class Team implements Serializable{
     private int teamID;
    private String teamName;
    private String flag;
    private String stadium;
    public Team() {
    }

    public Team(int teamID, String teamName,String stadium) {
        this.teamID = teamID;
        this.teamName = teamName;
        this.stadium = stadium;
    }

    public Team(int teamID, String teamName, String flag,String stadium) {
        this.teamID = teamID;
        this.teamName = teamName;
        this.flag = flag;
        this.stadium = stadium;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getStadium() {
        return stadium;
    }

    public void setStadium(String stadium) {
        this.stadium = stadium;
    }
    
    

    public Team(String teamName) {
        this.teamName = teamName;
    }

    public int getTeamID() {
        return teamID;
    }

    public void setTeamID(int teamID) {
        this.teamID = teamID;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    @Override
    public String toString() {
        return "Team{" + "teamID=" + teamID + ", teamName=" + teamName + '}';
    }
    
    
}
