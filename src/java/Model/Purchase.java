package Model;
import java.util.Date;
import java.util.List;
/**
 *
 * @author admin
 */
public class Purchase {
    private int id;
    private int userId;
    private int ticketId;
    private Date purchaseDate;
    private double totalAmount;
    private String paymentMethod;
    
    public Purchase(){
        
    } 
    
    public Purchase(int id, int userId, int ticketId, Date purchaseDate, double totalAmount, String paymentMethod) {
        this.id = id;
        this.userId = userId;
        this.ticketId = ticketId;
        this.purchaseDate = purchaseDate;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "Purchase{" + "ID=" + id + ", UserID=" + userId + ", TicketID=" + ticketId + ", PurchaseDate=" + purchaseDate + ", TotalAmount=" + totalAmount + ", PaymentMethod=" + paymentMethod + '}';
    }
    
}
