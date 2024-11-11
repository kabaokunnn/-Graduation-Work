<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>ログイン</title>
</head>
<body>
    <h2>ログイン</h2>
    <form action="LoginServlet" method="post">
        <label for="username">ユーザー名:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">パスワード:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="ログイン">
    </form>
    
    <br>
    <p><a href="SignUp.jsp">新規登録</a>はこちら。</p>
</body>
</html>
