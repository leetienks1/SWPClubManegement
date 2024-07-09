package Model;

import java.time.LocalDate;

public class PlayerPhysicalCondition {
    private int conditionID;
    private int playerID;
    private String conditionDescription;
    private LocalDate dateRecorded;

    public PlayerPhysicalCondition() {
    }

    public PlayerPhysicalCondition(int conditionID, int playerID, String conditionDescription, LocalDate dateRecorded) {
        this.conditionID = conditionID;
        this.playerID = playerID;
        this.conditionDescription = conditionDescription;
        this.dateRecorded = dateRecorded;
    }

    public int getConditionID() {
        return conditionID;
    }

    public void setConditionID(int conditionID) {
        this.conditionID = conditionID;
    }

    public int getPlayerID() {
        return playerID;
    }

    public void setPlayerID(int playerID) {
        this.playerID = playerID;
    }

    public String getConditionDescription() {
        return conditionDescription;
    }

    public void setConditionDescription(String conditionDescription) {
        this.conditionDescription = conditionDescription;
    }

    public LocalDate getDateRecorded() {
        return dateRecorded;
    }

    public void setDateRecorded(LocalDate dateRecorded) {
        this.dateRecorded = dateRecorded;
    }

    @Override
    public String toString() {
        return "PlayerPhysicalCondition{" +
                "conditionID=" + conditionID +
                ", playerID=" + playerID +
                ", conditionDescription='" + conditionDescription + '\'' +
                ", dateRecorded=" + dateRecorded +
                '}';
    }
}