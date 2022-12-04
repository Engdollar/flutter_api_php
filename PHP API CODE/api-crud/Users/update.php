<?php
header("Content-Type: application/json");
require ("db.php");

if(!isset($_POST['FullName']) && !isset($_POST['Email']) && !isset($_POST['Username']) && !isset($_POST['Password']) && !isset($_POST['No'])   ){
    echo json_encode("Inputs Are Required");
}else{
    $No = $_POST['No'];
    $FullName = $_POST['FullName'];
    $Email = $_POST['Email'];
    $Username = $_POST['Username'];
    $Password = $_POST['Password'];

   
    $sql_update ="UPDATE  users set Full_Name = '$FullName', Username = '$Username', Password ='$Password', Email ='$Email' WHERE No='$No' ";
    $results_update = mysqli_query($conn, $sql_update);
    if($results_update){
        echo json_encode("success");
      
    }else{
        echo json_encode("error while updating");

    }

}


?>