<?php
// header("Content-Type: application/json");
require ("db.php");

$sql = "SELECT * FROM users  Order By No DESC";
$results = mysqli_query($conn, $sql);
$response = array();
$check = mysqli_num_rows($results);
if($check > 0){
    while ($rows = mysqli_fetch_assoc($results)) {
        $response[] = $rows;
     }
echo json_encode($response);

}
else{
    echo json_encode("Results Not Found");
    
}   




?>