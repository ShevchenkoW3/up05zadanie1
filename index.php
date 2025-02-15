<?php
include 'template/db.php';
include 'template/head.php';
session_start();
if(!empty($_SESSION)){
    if($_SESSION['role'] != 2){
        include 'template/nav_customer.php';
    }
    else{
        include 'template/nav_administrator.php';
    }
}
else{
    include 'template/nav.php';
}
?>
<div class="container">
    <div class="row">
        <div class="col-lg-12" style="margin-top: 20px">
            <h2 class="text-center">Добро пожаловать!</h2>
        </div>
    </div><br>
    <div class="col-lg-1"></div>
    <div class="col-lg-10">
        <h3 class="text-center">Решенные проблемы</h3><br>
        <div class="row row-cols-1 row-cols-md-4 g-2">
        <?php 
        $sql = "select * from zayavki, categories where zayavki.id_category = categories.id_category and status = 2 order by rand() limit 4";
        $result = $mysqli->query($sql);
        if(!empty($result)){
            foreach($result as $row){
                echo '
                <div class="col">
    <div class="card">
      <img src="'.$row['img_solved'].'" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">'.$row['date_zayavka'].'</h5>
        <p class="card-text">'.$row['name_zayavka'].'<br>'.$row['name_category'].'</p> 
      </div>
    </div>
  </div>
</div>
                ';
            }
        }
        else{
            echo '<h2 class = "text-center">Решенных проблем нет</h2>';
        }
        ?> 
    </div>
    <div class="col-lg-1"></div>
</div>
<?php include 'template/footer.php'; ?>