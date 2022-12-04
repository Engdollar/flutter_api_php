<?php
header("Content-Type: application/json");
require ("db.php");

if(!isset($_POST['No'])   ){
    echo json_encode("Inputs Are Required");
}else{
    $No = $_POST['No'];
  
    $sql_delete ="DELETE FROM  users WHERE No='$No' ";
    $results_delete = mysqli_query($conn, $sql_delete);
    if($results_delete){
        echo json_encode("success");

    }else{
        echo json_encode("error while updating");


    }

}


?>