package adminC;

public class Category {
	private int id;
	private String name;
	private String code;
	private String description;
	private String status;
	private String date;
	private String admin_id;
	
	
	
	public Category(int id, String name, String code, String description, String status, String date, String admin_id) {
		super();
		this.id = id;
		this.name = name;
		this.code = code;
		this.description = description;
		this.status = status;
		this.date = date;
		this.admin_id = admin_id;
	}



	public int getId() {
		return id;
	}



	public String getName() {
		return name;
	}



	public String getCode() {
		return code;
	}



	public String getDescription() {
		return description;
	}



	public String getStatus() {
		return status;
	}



	public String getDate() {
		return date;
	}



	public String getAdmin_id() {
		return admin_id;
	}



	

}