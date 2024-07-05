/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class DietPlan {
    private int dietPlanID;
    private int playerID;
    private String planDescription;

    public DietPlan() {
    }

    public DietPlan(int dietPlanID, int playerID, String planDescription) {
        this.dietPlanID = dietPlanID;
        this.playerID = playerID;
        this.planDescription = planDescription;
    }

    public int getDietPlanID() {
        return dietPlanID;
    }

    public void setDietPlanID(int dietPlanID) {
        this.dietPlanID = dietPlanID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public String getPlanDescription() {
        return planDescription;
    }

    public void setPlanDescription(String planDescription) {
        this.planDescription = planDescription;
    }
    
}
