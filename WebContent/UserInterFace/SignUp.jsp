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

        function validateForm() {
            let isValid = true;

            // ユーザー名のチェック
            const username = document.getElementById("username");
            const usernameError = document.getElementById("usernameError");
            if (username.value.trim() === "") {
                usernameError.style.display = "block";
                isValid = false;
            } else {
                usernameError.style.display = "none";
            }

            // メールアドレスのチェック
            const email = document.getElementById("email");
            const emailError = document.getElementById("emailError");
            if (email.value.trim() === "") {
                emailError.style.display = "block";
                isValid = false;
            } else {
                emailError.style.display = "none";
            }

            // パスワードのチェック
            const password = document.getElementById("password");
            const passwordError = document.getElementById("passwordError");
            if (password.value.trim() === "") {
                passwordError.style.display = "block";
                isValid = false;
            } else {
                passwordError.style.display = "none";
            }

            // 年齢のチェック
            const age = document.getElementById("age");
            const ageError = document.getElementById("ageError");
            if (age.value === "") {
                ageError.style.display = "block";
                isValid = false;
            } else {
                ageError.style.display = "none";
            }

            // 性別のチェック
            const male = document.getElementById("male");
            const female = document.getElementById("female");
            const genderError = document.getElementById("genderError");
            if (!male.checked && !female.checked) {
                genderError.style.display = "block";
                isValid = false;
            } else {
                genderError.style.display = "none";
            }

            return isValid;
        }
    </script>
    <style>
        .error {
            display: none;
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h2>新規登録</h2>
    <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
        <label for="username">ユーザー名:</label>
        <input type="text" id="username" name="username">
        <span id="usernameError" class="error">※ユーザー名を入力してください。</span><br><br>

        <label for="email">メールアドレス:</label>
        <input type="email" id="email" name="email">
        <span id="emailError" class="error">※メールアドレスを入力してください。</span><br><br>

        <label for="password">パスワード:</label>
        <input type="password" id="password" name="password">
        <span id="passwordError" class="error">※パスワードを入力してください。</span><br><br>

        <input type="checkbox" id="showPassword" onclick="togglePassword()">
        <label for="showPassword">パスワードを表示</label>
        <br><br>

        <!-- 年齢選択ドロップダウン -->
        <label for="age">年齢:</label>
        <select id="age" name="age">
            <option value="">選択してください</option>
            <% for (int i = 16; i <= 100; i++) { %>
                <option value="<%= i %>"><%= i %>歳</option>
            <% } %>
        </select>
        <span id="ageError" class="error">※年齢を選択してください。</span><br><br>

        <label>性別:</label>
        <input type="radio" id="male" name="gender" value="male">
        <label for="male">男</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">女</label>
        <span id="genderError" class="error">※性別を選択してください。</span><br><br>

        <input type="submit" value="登録">
    </form>
</body>
</html>
