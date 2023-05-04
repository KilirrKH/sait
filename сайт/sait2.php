<!doctype html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <title>NichegoNeRobit.com</title>
  </head>
  <body>
  <?php include 'windows.php';?>
    <!--  Шапка  -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid container px-4">
          <a class="navbar-brand pe-3" href="#">[Панель навигации]</a>
        <!--  Кнопка коллапса  -->
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" role="button" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon">
          </span></button>
          <!--  Кнопки  -->
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="col">
              <ul class="navbar-nav mb-2 mb-lg-0" >
                <li class="nav-item"><a class="text-white text-decoration-none">
                Добро пожаловать!</a></li>
                    <!--aria-current="page" style="color: grey; transition: !important color 9999999s; text-decoration: none;"
                    <style>.reg :active{ color: white; transition: color 0s} </style>  me-auto -->
              </ul>
            </div>
          </div>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="col">
              <ul class="navbar-nav ">
                <li class="nav-item"><a href="exit.php" class="btn btn-link shadow-none" type="button">
                    Выйти</a></li>
                    <!--aria-current="page" mb-2 mb-lg-0 style="color: grey; transition: color 9999999s; text-decoration: none;"
                    <style>.reg :active{ color: white; transition: color 0s} </style>-->
              </ul>
            </div>
          </div>
      </div>
      <!--  Кнопка заметок  -->
      <div class="container">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <div class="ms-lg-auto my-2 my-sm-0">
            <button class="btn btn-outline-success my-2 my-sm-0 " data-bs-toggle="modal" data-bs-target="#exampleModal">Составить заметки</button>
          </div>
        </div>
      </div>

    </nav> 


    <!--  Модаль-блок редактора -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <!--  Модаль-хед  -->
          <div class="modal-header" >
              <h5 class="modal-title" id="exampleModalLabel" >Создание заметки</h5>
              <button class="close" type="button"  data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <!--  Модаль-боди  -->
          <div class="modal-body">
            <div>
              <form action="#" method="POST">
                <div class="form-floating mb-3">            
                  <input type="text" class="form-control" placeholder="Leave a name here" id="floatingInput">
                  <label for="floatingInput">Название заметки (обязательно!)</label>
                </div>
                <div class="form-floating ">
                  <textarea class="form-control" id="addTxt"  style="height: 300px; resize: none;" ></textarea>
                  <label>Форма заметки</label>
                </div>
              </form>
            </div>
          </div>
          <!--  Модаль-футер  -->      
          <div class="modal-footer" >
            <button class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
            <button class="btn btn-primary" id="addBtn" >Создать</button>
            <script>
              // Находим кнопку "Создать" и добавляем обработчик события на нажатие
              document.getElementById("addBtn").addEventListener("click", function(event){
                // Отменяем стандартное действие формы, чтобы страница не перезагружалась
                event.preventDefault();
                
                // Получаем данные из формы
                var form = document.getElementById("my-form");
                var formData = new FormData(form);
                
                // Отправляем данные на сервер
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "process_form.php"); // Укажите путь к обработчику на сервере
                xhr.send(formData);
              });
            </script>
          </div>
        </div>
      </div>
    </div>



    <!-- Модаль-блок аккаунта --> 
    <div class="modal fade" id="regModal" tabindex="-1" role="dialog"
    aria-labelledby="regModal" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <!--  Модаль-хед  -->
          <div class="modal-header" >
            <h4 class="modal-title" id="regModalLabel" >Аккаунт</h4>
            <button class="close" type="button"  data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          </div>
                    <!--  Модаль-боди Регистрация  -->
          <div class="modal-body row d-flex justify-content-center align-items-center h-100">
            <h5 class="modal-title" id="regModalLabel" >Регистрация</h5>
            <form action="check.php" method="post" class="row g-3 needs-validation" novalidate>
              <div class="form-outline flex-fill mb-0">
                <input type="text" name="name" class="form-control" id="name"  placeholder="Имя" required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
              <div class="form-outline flex-fill mb-0"><!--col-md-4-->
                <input type="text" name="login" class="form-control" id="login" placeholder="Логин"  required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
              <div class="form-outline flex-fill mb-0">
                <input type="password" name="pass" class="form-control" id="pass" placeholder="Пароль"  required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
              <div class="col-12">
                <button class="btn btn-primary" type="submit">Принять</button>
              </div>
              <hr>
            </form>
            <!--  Модаль-боди авторизация  -->
            <form action="auto.php" method="post" class="row g-3 needs-validation" novalidate>
              <h5 class="modal-title" id="regModalLabel" >Авторизация</h5>
              <div class="form-outline flex-fill mb-0">
                <input type="text" name="login" class="form-control" id="login" placeholder="Логин"  required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
                <div class="form-outline flex-fill mb-0">
                  <input type="password" name="pass" class="form-control" id="pass" placeholder="Пароль"  required>
                  <div class="valid-feedback">
                    Looks good!
                  </div>
                </div>
                <div class="col-12">
                  <button class="btn btn-primary" type="submit">Принять</button>
                </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- Контейнер заметок  -->
    <div id="notes" class="row container-fluid">
      
    </div>



    <script src="js/bootstrap.bundle.min.js" ></script>
    <script src="sait.js"></script>
  </body>
</html>