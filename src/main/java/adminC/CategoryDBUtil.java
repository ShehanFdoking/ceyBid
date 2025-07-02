package adminC;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import seller.DBConnection;




public class CategoryDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	
	
	public static List<Category> getCategory() {
		
		ArrayList<Category> cus = new ArrayList<>();
		
		try {
			
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from category ";
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String code = rs.getString(3);
				String description = rs.getString(4);
				String status = rs.getString(5);
				String date = rs.getString(6);
				String admin_id = rs.getString(7);
				
				Category c = new Category(id,name,code,description,status,date,admin_id);
				cus.add(c);
			}
			
		} catch (Exception e) {
			
		}
		
		return cus;	
	}
			 

	
    public static boolean insertcategory(String name,String code, String description, String status, String date) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = DBConnection.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into category values (0,'"+name+"','"+code+"','"+description+"','"+status+"','"+date+"',1)";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
	  public static boolean updatecategory(String id, String name,String code, String description, String status, String date, String admin_id) {
	    	
	    	try {
	    		
	    		con = DBConnection.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "update category set name='"+name+"',code='"+code+"',description='"+description+"',status='"+status+"',date='"+date+"',admin_id='"+admin_id+"'" 
	    				+ "where id='"+id+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	 
	  public static List<Category> getCategoryDetails(String Id) {
			
			int convertedID = Integer.parseInt(Id);
			
			ArrayList<Category> cus = new ArrayList<>();
			
			try {
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				String sql = "select * from category ";
				rs = stmt.executeQuery(sql);
				
	    		while(rs.next()) {
	    			int id = rs.getInt(1);
	    			String name = rs.getString(2);
	    			String code = rs.getString(3);
	    			String description = rs.getString(4);
	    			String status = rs.getString(5);
	    			String date = rs.getString(6);
	    			String admin_id = rs.getString(7);
	
	    			
	    			Category c = new Category(id,name,code,description,status,date,admin_id);
	    			cus.add(c);
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}	
	    	return cus;	
	    }
	    
	    public static boolean deleteCategory(String id) {
	    	
	    	int convId = Integer.parseInt(id);
	    	
	    	try {
	    		
	    		con = DBConnection.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from category where id='"+convId+"'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if (r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
}

