package seller;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemController {

    // Add Item
    public static boolean addItem(ItemModel item) {
        boolean isSuccess = false;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO item (item_name, starting_price, category_id, seller_id, ending_date, posted_date, image_path) "
                       + "VALUES (?, ?, ?, ?, ?, CURRENT_DATE, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, item.getItemName());
            ps.setDouble(2, item.getStartingPrice());
            ps.setInt(3, item.getCategoryId());
            ps.setInt(4, item.getSellerId());
            ps.setDate(5, item.getEndingDate());
            ps.setString(6, item.getImagePath());
            int rows = ps.executeUpdate();
            isSuccess = rows > 0;
            System.out.println("Add item for seller_id " + item.getSellerId() + ": " + (isSuccess ? "Success" : "Failed"));
        } catch (SQLException e) {
            System.err.println("SQL Error in addItem: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("General Error in addItem: " + e.getMessage());
            e.printStackTrace();
        }
        return isSuccess;
    }

    // Get Items by Seller
    public static List<ItemModel> getItemsBySeller(int sellerId) {
        List<ItemModel> items = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT * FROM item WHERE seller_id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, sellerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ItemModel item = new ItemModel();
                item.setItemId(rs.getInt("item_id"));
                item.setItemName(rs.getString("item_name"));
                item.setStartingPrice(rs.getDouble("starting_price"));
                item.setCurrentHighestBid(rs.getDouble("current_highest_bid"));
                item.setCategoryId(rs.getInt("category_id"));
                item.setPostedDate(rs.getDate("posted_date"));
                item.setEndingDate(rs.getDate("ending_date"));
                item.setImagePath(rs.getString("image_path"));
                item.setSellerId(rs.getInt("seller_id"));
                items.add(item);
            }
            System.out.println("Retrieved " + items.size() + " items for seller_id: " + sellerId);
        } catch (SQLException e) {
            System.err.println("SQL Error in getItemsBySeller: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("General Error in getItemsBySeller: " + e.getMessage());
            e.printStackTrace();
        }
        return items;
    }

	public static boolean deleteItem(int itemId) {
		// TODO Auto-generated method stub
		return false;
	}

	public static ItemModel getItemById(int itemId) {
		// TODO Auto-generated method stub
		return null;
	}

	public static boolean updateItem(ItemModel item) {
		// TODO Auto-generated method stub
		return false;
	}
}