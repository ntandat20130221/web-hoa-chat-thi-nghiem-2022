package db;

import java.sql.*;

public class DbConnection {
    static final String url = "jdbc:mysql://localhost:3306/hoa_chat_thi_nghiem";
    static final String user = "root";
    static final String pass = "";
    static DbConnection install;
    Connection connect;

    private DbConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static DbConnection getInstall() {
        if (install == null) install = new DbConnection();
        return install;
    }

    public void unInstall() {
        try {
            connect.close();
            install = null;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // thường dùng để thực thi các câu lệnh sql không có tham số
    public Statement getStatement() {
        if (connect == null) return null;
        try {
            return connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            return null;
        }
    }

    public Statement getUpdatableStatement() {
        if (connect == null) return null;
        try {
             return connect.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (SQLException e) {
            return null;
        }
    }

    // thường dùng để thực thi các câu lệnh sql có tham số truyền vào
    public PreparedStatement getPreparedStatement(String sql) {
        if (connect == null) return null;
        try {
            return connect.prepareStatement(sql);
        } catch (SQLException e) {
            // throw new RuntimeException(e);
            return null;
        }
    }
}
