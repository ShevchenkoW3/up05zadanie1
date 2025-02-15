<?php 
include 'template/head.php';
include 'template/nav.php';
include 'template/db.php';
$message = '';
if(!empty($_POST)){
   $fio = $_POST['fio'];
   $email = $_POST['email'];
   $login = $_POST['login'];  
   $password = $_POST['password'];
   $password_repeat = $_POST['password_repeat'];
   if ($password == $password_repeat){
    $sql = "insert into users (fio, email, login, password) values ('$fio', '$email', '$login', '$password')";
    $mysqli->query($sql);
    header("Location: login.php");
   }
   else{
    $message = "Пароли не совпадают";
   }  
}
?>
    <div class="container">
    <div class="row">
        <div class="col-lg-12">
            <form class="form" action="" method="POST">
                <div class="mb-3">
                    <label for="fio" class="form-label">ФИО</label>
                    <input type="text" class="form-control" name="fio" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Эл. почта</label>
                    <input type="email" class="form-control" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="login" class="form-label">Логин</label>
                    <input type="text" class="form-control" name="login" id="login" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Пароль</label>
                    <input type="password" class="form-control" name="password" minlength="6" required>
                </div>
                <div class="mb-3">
                    <label for="password_repeat" class="form-label">Повторите пароль</label>
                    <input type="password" class="form-control" name="password_repeat" required>
                </div>
                <div class="mb-3">
                    <input type="submit" class="btn btn-primary" name="Зарегистрироваться">
                </div>
            </form>
            <p id="result"></p>
        </div>
    </div>
</div>