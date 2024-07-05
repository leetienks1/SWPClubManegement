/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class DietPlanFood {
    private int dietPlanID;
    private int foodID;
    private double portionSize;

    public DietPlanFood() {
    }

    public DietPlanFood(int dietPlanID, int foodID, double portionSize) {
        this.dietPlanID = dietPlanID;
        this.foodID = foodID;
        this.portionSize = portionSize;
    }

    public int getDietPlanID() {
        return dietPlanID;
    }

    public void setDietPlanID(int dietPlanID) {
        this.dietPlanID = dietPlanID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public double getPortionSize() {
        return portionSize;
    }

    public void setPortionSize(double portionSize) {
        this.portionSize = portionSize;
    }

    @Override
    public String toString() {
        return "DietPlanFood{" + "dietPlanID=" + dietPlanID + ", foodID=" + foodID + ", portionSize=" + portionSize + '}';
    }
    
    
}
