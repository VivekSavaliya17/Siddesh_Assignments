import java.sql.*;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {

        try {
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/feedback_db_final",
                    "root",
                    "admin"
            );

            Scanner sc = new Scanner(System.in);

            System.out.print("Enter Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Feedback: ");
            String msg = sc.nextLine();

            String sql = "INSERT INTO feedback(name,comment) VALUES (?,?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, msg);

            ps.executeUpdate();
            System.out.println("Saved!");

            sc.close();
            con.close();

        } catch(Exception e) {
            System.out.println(e);
        }
    }
}
