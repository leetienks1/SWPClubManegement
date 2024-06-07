/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalDate;

import java.util.Date;


/**
 *
 * @author quangminh
 */
public class Player {

    private int playerID;
    private int userID;
    private Position position;
    private String name;
    private LocalDate dateOfBirth;
    private LocalDate age;
    private double weight;
    private int height;
    private String image;
    
    public Player(Position position, String name, LocalDate age, double weight, int height) {
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
    }

     public Player( int userID, Position position, String name, LocalDate age, double weight, int height) {
        
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
    }
        public Player( int userID, Position position, String name, LocalDate age, double weight, int height,String image) {
        
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.age = age;
        this.weight = weight;
        this.height = height;
        this.image=image;
    }

 
    public Player(int playerID, int userID, Position position, String name, LocalDate DOB , double weight, int height,String image) {
        this.playerID = playerID;
        this.userID = userID;
        this.position = position;
        this.name = name;
        this.dateOfBirth = DOB;
        this.weight = weight;
        this.height = height;
        this.image=image;
    }

    // Default Constructor
    public Player() {}

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

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

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public LocalDate getAge() {
        return age;
    }

    public void setAge(LocalDate age) {
        this.age = age;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        if(weight<0)
            this.weight=65;
        else
            this.weight = weight;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        if(height<0)
            this.height=165;
        else
            this.height = height;
    }

    @Override
    public String toString() {
        return "Player{" +
                "playerID=" + playerID +
                ", userID=" + userID +
                ", position='" + position + '\'' +
                ", name='" + name + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", weight='" + weight + '\'' +
                ", height=" + height +
                '}';
    }
}
