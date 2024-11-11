<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>新規登録</title>
    <script type="text/javascript">
        function togglePassword() {
            const passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</head>
<body>
    <h2>新規登録</h2>
    <form action="RegisterServlet" method="post">
        <label for="username">ユーザー名:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        
        <label for="email">メールアドレス:</label>
        <input type="email" id="email" name="email" required><br><br>
        
        <label for="password">パスワード:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="checkbox" id="showPassword" onclick="togglePassword()">
        <label for="showPassword">パスワードを表示</label>
        <br><br>
        
        <label>性別:</label>
        <input type="radio" id="male" name="gender" value="male" required>
        <label for="male">男</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">女</label><br><br>


        <input type="submit" value="登録">
    </form>
</body>
</html>
