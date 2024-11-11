package SignUp;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームデータを取得
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String age = request.getParameter("age");
        String gender = request.getParameter("gender");

        // DBに接続し、データを保存
        try {
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/your_database", "your_username", "your_password");
            String sql = "INSERT INTO users (username, email, password, age, gender) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, email);
            statement.setString(3, password);  // セキュリティのためパスワードはハッシュ化して保存すべきです
            statement.setInt(4, Integer.parseInt(age));
            statement.setString(5, gender);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("main/mainmenu.jsp"); // 登録成功ページへリダイレクト
            } else {
                response.sendRedirect("error.jsp"); // エラーページ
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // エラーページ
        }
    }
}
