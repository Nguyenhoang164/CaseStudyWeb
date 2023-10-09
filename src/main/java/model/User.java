package model;

public class User {
    private int id;
    private String username;
    private String password;
    private String permission;
    private String phone;
    private String local;

    public User(int id, String username, String password, String permission, String phone, String local) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.permission = permission;
        this.phone = phone;
        this.local = local;
    }

    public User() {
    }
    public User(String username, String password, String permission, String phone, String local) {
        this.username = username;
        this.password = password;
        this.permission = permission;
        this.phone = phone;
        this.local = local;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }
}
