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
<div class="block1"></center><h1>MIREAevents</h1><hr></center></div>

<div class="block2">
    <h4>Регистрация</h4>
    <form action="/registration" method="post">
        Имя пользователя: <input type="text" name="name"><br><br>
        Эл. почта: <input type="email" name="email"><br><br>
        Номер телефона: <input type="text" name="phoneNumber"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Зарегистрироваться"/>
    </form>
    <#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</div>

</body>
</html>