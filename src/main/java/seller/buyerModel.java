package seller;

public class buyerModel {
    private String name;
    private String username;
    private String password;
    private String email;
    private String nic;

    public buyerModel(String name, String username, String password, String email, String nic) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.nic = nic;
    }

    // Getters
    public String getName() { return name; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getEmail() { return email; }
    public String getNic() { return nic; }
}

