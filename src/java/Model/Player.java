/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author quangminh
 */
public class Player {

    private int playerID;
    private int userID;
    private String position;
    private String name;
    private int age;
    private String weight;
    private int height;

    // Constructor
    public Player(int playerID, int userID, String position, String name, int age, String weight, int height) {
        this.playerID = playerID;
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
    }

    // Default Constructor
    public Player() {}

    // Getters and Setters
    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    @Override
    public String toString() {
        return "Player{" +
                "playerID=" + playerID +
                ", userID=" + userID +
                ", position='" + position + '\'' +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", weight='" + weight + '\'' +
                ", height=" + height +
                '}';
    }
}
