package Model;

import java.time.LocalDate;
import java.time.LocalTime;

public class TreatmentSchedule {
    private int treatmentID;
    private int playerID;
    private LocalDate treatmentDate;
    private LocalTime treatmentTime;
    private String treatmentDescription;

    public TreatmentSchedule() {
    }

    public TreatmentSchedule(int treatmentID, int playerID, LocalDate treatmentDate, LocalTime treatmentTime, String treatmentDescription) {
        this.treatmentID = treatmentID;
        this.playerID = playerID;
        this.treatmentDate = treatmentDate;
        this.treatmentTime = treatmentTime;
        this.treatmentDescription = treatmentDescription;
    }

    public int getTreatmentID() {
        return treatmentID;
    }

    public void setTreatmentID(int treatmentID) {
        this.treatmentID = treatmentID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public LocalDate getTreatmentDate() {
        return treatmentDate;
    }

    public void setTreatmentDate(LocalDate treatmentDate) {
        this.treatmentDate = treatmentDate;
    }

    public LocalTime getTreatmentTime() {
        return treatmentTime;
    }

    public void setTreatmentTime(LocalTime treatmentTime) {
        this.treatmentTime = treatmentTime;
    }

    public String getTreatmentDescription() {
        return treatmentDescription;
    }

    public void setTreatmentDescription(String treatmentDescription) {
        this.treatmentDescription = treatmentDescription;
    }

    @Override
    public String toString() {
        return "TreatmentSchedule{" +
                "treatmentID=" + treatmentID +
                ", playerID=" + playerID +
                ", treatmentDate=" + treatmentDate +
                ", treatmentTime=" + treatmentTime +
                ", treatmentDescription='" + treatmentDescription + '\'' +
                '}';
    }
}
