<!DOCTYPE html>
<html>
<head>
    <title>MIREAevents</title>

    <style>
        .block1{
            background-color:#99E1E5;
        }
        .block2{
            background-color:#F3E8CB;
        }
        .block3{
            background-color:#F2C6B4;
        }
    </style>

</head>
<body>

<div class="block1"><center><h1>MIREAevents</h1><hr></center></div>

<div class="block2">
    <h4>Авторизация</h4>
    <form action="/login" method="post">
        Эл. почта: <input type="email" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Вход"/>
    </form>
    <a href="/registration">Зарегистрироваться</a>
</div>

</body>
</html>