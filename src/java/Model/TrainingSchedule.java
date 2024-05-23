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
public class TrainingSchedule {
    private int scheduleID;
    private int playerID;
    private LocalDate trainingDate;
    private String activity;
    private String duration;

    // Constructors
    public TrainingSchedule() {
    }

    public TrainingSchedule(int scheduleID, int playerID, LocalDate trainingDate, String activity, String duration) {
        this.scheduleID = scheduleID;
        this.playerID = playerID;
        this.trainingDate = trainingDate;
        this.activity = activity;
        this.duration = duration;
    }

    // Getters and Setters
    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public LocalDate getTrainingDate() {
        return trainingDate;
    }

    public void setTrainingDate(LocalDate trainingDate) {
        this.trainingDate = trainingDate;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    // toString method
    @Override
    public String toString() {
        return "TrainingSchedule{" +
                "scheduleID=" + scheduleID +
                ", playerID=" + playerID +
                ", trainingDate=" + trainingDate +
                ", activity='" + activity + '\'' +
                ", duration='" + duration + '\'' +
                '}';
    }
}
