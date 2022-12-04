<?php
// header("Content-Type: application/json");
require ("db.php");


if(!isset($_POST['FullName']) && !isset($_POST['Email']) && !isset($_POST['Username']) && !isset($_POST['Password'])   ){
    echo json_encode("Inputs Are Required");
}else{
    $FullName = $_POST['FullName'];
    $Email = $_POST['Email'];
    $Username = $_POST['Username'];
    $Password = $_POST['Password'];
    $sql = "SELECT * FROM users where Email='$Email' or Username='$Username'";
    $results = mysqli_query($conn, $sql);
    $check = mysqli_num_rows($results);
    if($check > 0){
        echo json_encode("User Is Existing");
    }else{
        $sql_insert ="INSERT INTO users( Full_Name, Username, Password, Email) VALUES ('$FullName', '$Username', '$Password', '$Email')";
        $results_insert = mysqli_query($conn, $sql_insert);
        if($results_insert){
            echo json_encode("success");

        }else{
            echo json_encode("error while saving");

        }


    }
}


?>