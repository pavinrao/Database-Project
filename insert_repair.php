<?php

$servername = "127.0.0.1";
$username = "root";
$password = "";

$conn = new mysqli($servername, $username, $password);


if ($conn->connect_error) {
	die("Connection failed: " .$conn->connect_error);
}
else{
	// echo "Connected sucessfully" ."<br>";
}

$sql = "select * from Albedo.repair";
$result = $conn->query($sql);

if (mysqli_query($conn, $sql)) {
 // echo "Selected Successfully";
} else {
 echo "Error: " . $sql . "<br>" . $conn->error;
}

// $page = $_SERVER['PHP_SELF'];
// $sec = "10";
// header("Refresh: $sec; url=$page");

///Variables to be inserted

if(isset($_POST['save'])){
$Repair_No = $_POST['Repair_num'];
$Repair_Form = $_POST['Repair_form'];
$Product_Code = $_POST['Product_Code'];
$Warranty_ID = $_POST['Warranty_ID'];
$Pro_No = $_POST['Pro_Num'];
$Repair_Loc = $_POST['Repair_Location_ID'];
$Customer_ID = $_POST['Cust_ID'];
$Tracking_ID = $_POST['Tracking_ID'];
$Department = $_POST['Department'];
$Repair_Detail = $_POST['Rep_Detail'];

$sql = "INSERT INTO ALbedo.repair(Repair_Num,Repair_Form,Product_Code,Warranty_ID,Pro_Num,Repair_Location_ID,Customer_ID,Tracking_Id,Department_Store,Repair_Detail) VALUES('$Repair_No','$Repair_Form','$Product_Code','$Warranty_ID','$Pro_No','$Repair_Loc','$Customer_ID','$Tracking_ID','$Department','$Repair_Detail')";

// header("Refresh: $sec; url=$page");
}
if (mysqli_query($conn, $sql)) {
	$last_id = mysqli_insert_id($conn);
 echo "Data added to database";
} else {
 echo "Error: " . $sql . "<br>" . $conn->error;
}

?>
