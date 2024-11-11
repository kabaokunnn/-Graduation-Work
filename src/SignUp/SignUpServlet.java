package SignUp;

import java.io.IOException;
import java.io.PrintWriter;
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
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/UserDB";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "password";
	private static final String BCrypt = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // フォームデータを取得
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String ageStr = request.getParameter("age");

        int age = 0;
        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            response.getWriter().println("<html><body><h2>エラーが発生しました: 年齢が不正です。</h2></body></html>");
            return;
        }


        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "INSERT INTO Users (username, email, password, gender, age) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, password);
                stmt.setString(4, gender);
                stmt.setInt(5, age);

                int rowsInserted = stmt.executeUpdate();
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();

                if (rowsInserted > 0) {
                    out.println("<html><body><h2>登録が完了しました！</h2>");
                    out.println("<a href='mainmenu.jsp'>メインメニューへ</a></body></html>");
                } else {
                    out.println("<html><body><h2>登録に失敗しました。再試行してください。</h2></body></html>");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<html><body><h2>エラーが発生しました: " + e.getMessage() + "</h2></body></html>");
        }
    }
}
