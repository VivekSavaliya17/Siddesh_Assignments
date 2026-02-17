import java.sql.*;

public class TestDB {
    public static void main(String[] args) {
        try {

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/feedback_db_final",
                    "root",
                    "admin"
            );

            System.out.println("Connected Successfully!");
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
