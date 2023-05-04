<?php
session_start();

// Подключение к базе данных
$db_host = 'localhost'; // Укажите имя хоста базы данных
$db_user = 'root'; // Укажите имя пользователя базы данных
$db_pass = 'root'; // Укажите пароль базы данных
$db_name = 'register-bd'; // Укажите имя базы данных
$conn = mysqli_connect($db_host, $db_user, $db_pass, $db_name);

// Проверяем, авторизован ли пользователь
if (!isset($_COOKIE['user_id'])) {
    echo "Вы не авторизованы.";
    exit();
}

// Получаем имя текущего пользователя из базы данных
$user_id = $_COOKIE['user_id'];
$query = "SELECT name FROM users WHERE id = $user_id";
$result = mysqli_query($conn, $query);
$user = mysqli_fetch_assoc($result);
$user_name = $user['name'];

// Обработка отправки формы
if(isset($_POST['submit'])) {
    // Получение данных из формы
    $name = $_POST['name'];
    $text = $_POST['text'];

    // Вставка данных в базу данных
    $query = "INSERT INTO mytable (name, t_text, id_user) VALUES ('$name', '$text', '$user_id')";
    mysqli_query($conn, $query);
}

// Отображение окна на странице
echo "<div id='container'></div>";
echo "<button onclick='createWindow()'>Создать окно</button>";

// JavaScript-функция для создания окна
echo "<script>
var counter = 0;
function createWindow() {
    var name = prompt('Введите название');
    var text = prompt('Введите текст');

    // Создание нового окна
    var window = document.createElement('div');
    window.className = 'window';
    window.innerHTML = '<h2>' + name + '</h2><p>' + text + '</p><p>Пользователь: " + $user_name + "</p>';

    // Размещение окна в контейнере
    var container = document.getElementById('container');
    if (counter % 3 == 0) {
        var row = document.createElement('div');
        row.className = 'row';
        container.appendChild(row);
    }
    var current_row = document.querySelector('#container .row:last-child');
    current_row.appendChild(window);

    // Отправка данных на сервер
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index.php', true);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    xhr.send('name=' + encodeURIComponent(name) + '&text=' + encodeURIComponent(text) + '&user_id=' + encodeURIComponent($user_id) + '&submit=1');

    counter++;
}
</script>";
?>