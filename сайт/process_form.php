<?php
// Подключение к базе данных
$db_host = 'localhost'; // Укажите имя хоста базы данных
$db_user = 'root'; // Укажите имя пользователя базы данных
$db_pass = 'root'; // Укажите пароль базы данных
$db_name = 'register-bd'; // Укажите имя базы данных
$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

// Получение данных из формы
$field1 = $_POST['field1'];
$field2 = $_POST['field2'];

// Сохранение данных в базу данных
$query = "INSERT INTO mytable (field1, field2) VALUES ('$field1', '$field2')";
mysqli_query($conn, $query);
?>