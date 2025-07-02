package buyer;

public class PlaceBid {
    private int buyerId;
    private int itemId;
    private double bidAmount;

    public PlaceBid(int buyerId, int itemId, double bidAmount) {
        this.buyerId = buyerId;
        this.itemId = itemId;
        this.bidAmount = bidAmount;
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
}
