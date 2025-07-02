package buyer;

public class Bid {
    private int bidId;
    private int buyerId;
    private int itemId;
    private double bidAmount;

    // Default Constructor (Required for certain frameworks)
    public Bid() {}

    // Constructor with parameters
    public Bid(int bidId, int buyerId, int itemId, double bidAmount) {
        this.bidId = bidId;
        this.buyerId = buyerId;
        this.itemId = itemId;
        this.bidAmount = bidAmount;
    }

    // Getters and Setters
    public int getBidId() {
        return bidId;
    }

    public void setBidId(int bidId) {
        this.bidId = bidId;
    }

    public int getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(int buyerId) {
        this.buyerId = buyerId;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public double getBidAmount() {
        return bidAmount;
    }

    public void setBidAmount(double bidAmount) {
        this.bidAmount = bidAmount;
    }

    // Optional: Override toString() if you need a string representation
    @Override
    public String toString() {
        return "Bid [bidId=" + bidId + ", buyerId=" + buyerId + ", itemId=" + itemId + ", bidAmount=" + bidAmount + "]";
    }
}
