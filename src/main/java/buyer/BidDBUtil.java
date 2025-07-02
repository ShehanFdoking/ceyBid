package buyer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import seller.DBConnection;

import java.sql.*;

public class BidDBUtil {

    private static boolean isSuccess;
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    private static PreparedStatement pst;

    // Insert a bid
    public static boolean insertBid(int buyerId, int itemId, double bidAmount) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement insertStmt = null;
        PreparedStatement selectStmt = null;
        PreparedStatement updateItemStmt = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();

            // Step 1: Check current highest bid for the item
            String selectSql = "SELECT current_highest_bid FROM item WHERE item_id = ?";
            selectStmt = con.prepareStatement(selectSql);
            selectStmt.setInt(1, itemId);
            rs = selectStmt.executeQuery();

            double currentHighestBid = 0;
            if (rs.next()) {
                currentHighestBid = rs.getDouble("current_highest_bid");
            }

            // Step 2: Insert bid
            String insertSql = "INSERT INTO place_bid (buyers_id, item_id, bid_amount) VALUES (?, ?, ?)";
            insertStmt = con.prepareStatement(insertSql);
            insertStmt.setInt(1, buyerId);
            insertStmt.setInt(2, itemId);
            insertStmt.setDouble(3, bidAmount);

            int rows = insertStmt.executeUpdate();

            // Step 3: If new bid is higher, update item table
            if (bidAmount > currentHighestBid) {
                String updateSql = "UPDATE item SET current_highest_bid = ? WHERE item_id = ?";
                updateItemStmt = con.prepareStatement(updateSql);
                updateItemStmt.setDouble(1, bidAmount);
                updateItemStmt.setInt(2, itemId);
                updateItemStmt.executeUpdate();
            }

            isSuccess = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (selectStmt != null) selectStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (updateItemStmt != null) updateItemStmt.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return isSuccess;
    }



    public static List<PlaceBid> getAllBids(int itemId) {
        ArrayList<PlaceBid> bids = new ArrayList<>();

        try {
            con = DBConnection.getConnection();  // Ensure DBConnect is properly configured
            String sql = "SELECT bid_id, item_id, bid_amount FROM place_bid WHERE item_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, itemId);
            rs = pst.executeQuery();

            while (rs.next()) {
                int bidId = rs.getInt("bid_id");
                double bidAmount = rs.getDouble("bid_amount");

                PlaceBid bid = new PlaceBid(bidId, itemId, bidAmount);
                
                System.out.println(bidId);
                bids.add(bid);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bids;
    }
    
    public static List<Bid> getBidsByItemId(int itemId) {
        List<Bid> bids = new ArrayList<>();
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = DBConnection.getConnection();  // Ensure DBConnect is configured
            String sql = "SELECT bid_id, buyers_id, item_id, bid_amount FROM place_bid WHERE item_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, itemId);
            rs = pst.executeQuery();

            while (rs.next()) {
                int bidId = rs.getInt("bid_id");
                int buyerId = rs.getInt("buyers_id");
                double bidAmount = rs.getDouble("bid_amount");

                Bid bid = new Bid(bidId, buyerId, itemId, bidAmount);
                bids.add(bid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (pst != null) pst.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return bids;
    }

    
    public static List<Item> getAllItems() {
        ArrayList<Item> items = new ArrayList<>();

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM item";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int itemId = rs.getInt("item_id");
                String itemName = rs.getString("item_name");
                double startingPrice = rs.getDouble("starting_price");
                double currentHighestPrice = rs.getDouble("current_highest_bid");
                String imagePath = rs.getString("image_path");

                Item item = new Item(itemId, itemName, startingPrice, currentHighestPrice, imagePath);
                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
    
    public static Item getCurrentHighestBid(int itemId) {
        Item item = null;

        try {
            con = DBConnection.getConnection();
            String sql = "SELECT MAX(current_highest_bid) AS current_highest_bid, item_name, starting_price, image_path FROM ceybid.item WHERE item_id = ?;";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, itemId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String itemName = rs.getString("item_name");
                double startingPrice = rs.getDouble("starting_price");
                double currentHighestPrice = rs.getDouble("current_highest_bid");
                String imagePath = rs.getString("image_path");

                item = new Item(itemId, itemName, startingPrice, currentHighestPrice, imagePath);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return item;
    }

    public static Item getItemById(int itemId) {
        Item item = null;
        try {
            con = DBConnection.getConnection();
            String sql = "SELECT * FROM item WHERE item_id = ?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, itemId);
            rs = pst.executeQuery();

            if (rs.next()) {
                item = new Item(
                    rs.getInt("item_id"),
                    rs.getString("item_name"),
                    rs.getDouble("starting_price"),
                    rs.getDouble("current_highest_bid"),
                    rs.getString("image_path")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return item;
    }

    // Update bid
    public static boolean updateBid(int buyerId, int itemId, double newAmount) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "UPDATE place_bid SET bid_amount='" + newAmount + "' WHERE buyers_id='" + buyerId + "' AND item_id='" + itemId + "'";
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
    
 // Get bid by bidId
    public static Bid getBidById(int bidId) {
    	Bid bid = null;

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM bids WHERE bid_id = " + bidId);

            if (rs.next()) {
                int buyerId = rs.getInt("buyer_id");
                int itemId = rs.getInt("item_id");
                double amount = rs.getDouble("amount");

                bid = new Bid(bidId, buyerId, itemId, amount);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bid;
    }

    // Update bid amount by bidId
    public static boolean updateBidAmountById(int bidId, double newAmount) {
        boolean isSuccess = false;

        try {
            Connection con = DBConnection.getConnection();
            Statement stmt = con.createStatement();
            int rows = stmt.executeUpdate("UPDATE place_bid SET bid_amount = " + newAmount + " WHERE bid_id = " + bidId);

            isSuccess = (rows > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }


    // Delete bid
    public static boolean deleteBid(int bidId) {
        boolean isSuccess = false;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "DELETE FROM place_bid WHERE bid_id = ?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, bidId); // use the actual bidId
            pstmt.executeUpdate();
            int rs = stmt.executeUpdate(sql);

            if (rs > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }

    // Get bid details by buyerId and itemId
    public static PlaceBid getBid(int buyerId, int itemId) {
        PlaceBid bid = null;

        try {
            con = DBConnection.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM place_bid WHERE buyers_id='" + buyerId + "' AND item_id='" + itemId + "'";
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                double bidAmount = rs.getDouble("bid_amount");
                bid = new PlaceBid(buyerId, itemId, bidAmount);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bid;
    }
}

