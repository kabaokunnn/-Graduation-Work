package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/UserDB"; // データベース名に合わせる
    private static final String JDBC_USER = "root";  // DBユーザー名
    private static final String JDBC_PASSWORD = "password";  // DBパスワード

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // データベース接続と認証処理
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD)) {
            String sql = "SELECT * FROM Users WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password); // 暗号化している場合は暗号化処理を追加

            ResultSet rs = stmt.executeQuery();

            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();

            if (rs.next()) {
                // 認証成功
                out.println("<html><body><h2>ログイン成功！</h2>");
                out.println("<p>ようこそ、" + username + " さん！</p>");
                out.println("<a href='mainmenu.jsp'>メインメニュー</a></body></html>");
            } else {
                // 認証失敗
                out.println("<html><body><h2>ログイン失敗</h2>");
                out.println("<p>ユーザー名またはパスワードが間違っています。</p>");
                out.println("<a href='login.jsp'>ログイン画面に戻る</a></body></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<html><body><h2>エラーが発生しました: " + e.getMessage() + "</h2></body></html>");
        }
    }
}
