<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>食材登録</title>
</head>
<body>
	<ul>
        <li><a href="mainmenu.jsp">HOME</a></li>
        <li class="current"><a href="registration.jsp">食材登録</a></li>
        <li><a href="recipe.jsp">レシピ選択</a></li>
        <li><a href="list.jsp">一覧</a></li>
    </ul>
	<ul>
	<label for="md2">牛肉</label>
<select>
  <option value="">選択してください</option>
  <option value="beef">牛肉</option>
</select>

<label for="md2">豚肉</label>
<select>
  <option value="">選択してください</option>
  <option value="pork">豚肉</option>
</select>

<label for="md2">鶏肉</label>
<select>
  <option value="">選択してください</option>
  <option value="chicken">鶏肉</option>
</select>

<label for="md2">その他の肉</label>
<select>
  <option value="">選択してください</option>
  <option value="other_meat">その他の肉</option>
</select>

<br><br><br>
<label for="md2">野菜</label>
<select>
  <option value="">選択してください</option>
  <option value="vegetable">野菜</option>
</select>

<label for="md2">魚介</label>
<select>
  <option value="">選択してください</option>
  <option value="seafood">まぐろ</option>
</select>

<label for="md2">卵・乳製品</label>
<select>
  <option value="">選択してください</option>
  <option value="eggs_dairy">卵・乳製品</option>
</select>

<label for="md2">豆・芋</label>
<select>
  <option value="">選択してください</option>
  <option value="beans_tubers">豆・芋</option>
</select>

<br><br><br>
<label for="md2">きのこ</label>
<select>
  <option value="">選択してください</option>
  <option value="mushroom">きのこ</option>
</select>

<label for="md2">米・麺・パン</label>
<select>
  <option value="">選択してください</option>
  <option value="grains">米・麺・パン</option>
</select>

<label for="md2">果物</label>
<select>
  <option value="">選択してください</option>
  <option value="fruits">果物</option>
</select>

<label for="md2">その他</label>
<select>
  <option value="">選択してください</option>
  <option value="others">その他</option>
</select>
	</ul>
</body>
</html>