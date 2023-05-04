<?php 
$login = filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING);
$pass = filter_var(trim($_POST['pass']), FILTER_SANITIZE_STRING);

$mysql = new mysqli('localhost', 'root', 'root', 'register-bd');
$result = $mysql->query("SELECT * FROM `users` WHERE `login` = '$login'");
$user = $result->fetch_assoc(); // Получаем данные пользователя из базы

//if(count($user) == 0){
//	echo "Такой пользователь не найден.";
//	exit();
//}
if (!$user) { // Если пользователь не найден, выводим ошибку
	echo "Такой пользователь не найден.";
	exit();
}

//else if(count($user) == 1){
//	echo "Логин или пароль введены неверно";
//	exit();
//}

if ($user['pass'] !== md5($pass."thisisforhabr")) { // Если пароль введен неверно, выводим ошибку
	echo "Логин или пароль введены неверно";
	exit();
}

setcookie('user', $user['name'], time() + 3600, "/");

$mysql->close();

header('Location: sait2.php'); //поменять

?>