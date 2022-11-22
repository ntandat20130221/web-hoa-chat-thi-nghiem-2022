package model;

public class Admin {

    private String username;
    private String passAD;
    private int id_role_admin;
    private int id_status_acc;
    private String fullname;

    public Admin(String username, String passAD, int id_role_admin, int id_status_acc, String fullname) {
        this.username = username;
        this.passAD = passAD;
        this.id_role_admin = id_role_admin;
        this.id_status_acc = id_status_acc;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public String getPassAD() {
        return passAD;
    }

    public int getId_role_admin() {
        return id_role_admin;
    }

    public int getId_status_acc() {
        return id_status_acc;
    }

    public String getFullname() {
        return fullname;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "username='" + username + '\'' +
                ", passAD='" + passAD + '\'' +
                ", id_role_admin=" + id_role_admin +
                ", id_status_acc=" + id_status_acc +
                ", fullname='" + fullname + '\'' +
                '}';
    }
}
