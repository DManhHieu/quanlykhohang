package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCConnection {
    public static Connection getJDBCConnection(){
        Connection connection=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_43bcd52ba381685";
            String user="b9f540ae2af354";
            String pass="22e08ac1";

            connection= DriverManager.getConnection(url,user,pass);
            System.out.println(("Connection"));
        }
        catch (ClassNotFoundException| SQLException ex){
            System.out.println(("Connection fail"));
            ex.printStackTrace();

        }
        return connection;
    }
}
