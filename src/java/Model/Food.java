package Model;

public class Food {
    private int foodID;
    private String foodName;
    private String description;
    private double calo;
    private double proteins;
    private double carbohydrates;
    private double fats;

    // Constructor without ID (for creating new records where ID is auto-generated)
    public Food(String foodName, String description, double calo, double proteins, double carbohydrates, double fats) {
        this.foodName = foodName;
        this.description = description;
        this.calo = calo;
        this.proteins = proteins;
        this.carbohydrates = carbohydrates;
        this.fats = fats;
    }

    // Constructor with ID (for retrieving records from the database)
    public Food(int foodID, String foodName, String description, double calo, double proteins, double carbohydrates, double fats) {
        this.foodID = foodID;
        this.foodName = foodName;
        this.description = description;
        this.calo = calo;
        this.proteins = proteins;
        this.carbohydrates = carbohydrates;
        this.fats = fats;
    }

    // Getters and setters
    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getCalo() {
        return calo;
    }

    public void setCalo(double calo) {
        this.calo = calo;
    }

    public double getProteins() {
        return proteins;
    }

    public void setProteins(double proteins) {
        this.proteins = proteins;
    }

    public double getCarbohydrates() {
        return carbohydrates;
    }

    public void setCarbohydrates(double carbohydrates) {
        this.carbohydrates = carbohydrates;
    }

    public double getFats() {
        return fats;
    }

    public void setFats(double fats) {
        this.fats = fats;
    }

    @Override
    public String toString() {
        return "Food{" +
                "foodID=" + foodID +
                ", foodName='" + foodName + '\'' +
                ", description='" + description + '\'' +
                ", calo=" + calo +
                ", proteins=" + proteins +
                ", carbohydrates=" + carbohydrates +
                ", fats=" + fats +
                '}';
    }
}
