package Model;
import java.util.Date;
import java.util.List;
/**
 *
 * @author admin
 */
public class Ticket {
    
    private int id;
    private int matchId;
    private String seatNumber;
    private double price;
    private boolean purchased;
    private String customerName;
    
    
    public Ticket(){
        
    }
    
    public Ticket(int id, int matchId, String seatNumber, double price, boolean purchased, String customerName) {
        this.id = id;
        this.matchId = matchId;
        this.seatNumber = seatNumber;
        this.price = price;
        this.purchased = purchased;
        this.customerName = customerName;
       
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isPurchased() {
        return purchased;
    }

    public void setPurchased(boolean purchased) {
        this.purchased = purchased;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

   

    @Override
    public String toString() {
        return "Ticket{" + "id=" + id + ", matchId=" + matchId + ", seatNumber=" + seatNumber + ", price=" + price + ", purchased=" + purchased + ", CustomerName=" + customerName+ '}';
    }
    
}