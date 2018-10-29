<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="css/lightbox.min.css">

<style> 
a{

  font-size: 16px;
}

body{
  background-color: #A0522D;
 /* background-image:url("shoes.jpg") grey ;*/
  background-repeat: no-repeat;
    background-size: cover;
}
form{
  font-size: 16px;
}
td,th{
  text-align: center;
}

#sear{
  margin-left: 550px;
}
</style>


<div class="row">
    <div class="col-md-12">
<div id="top">
  <nav class="navbar navbar-dark bg-dark">

  <ul class= "nav">
      <li class="nav-item active">
        <a class="nav-link" href="home.html">Albedo<span class="sr-only">(current)</span></a>
      </li>  
      <li>
      <a class="nav-link" href="repair.php">Repair<span class="sr-only">(current)</span></a>
      </li>
      <li>
        <a class="nav-link" href="tracking.php">Tracking<span class="sr-only">(current)</span></a>
      </li>
      <li>
        <a class="nav-link" href="product.php">Product<span class="sr-only">(current)</span></a>
      </li>
      <li>
        <a class="nav-link" href="warranty.php">Warranty<span class="sr-only">(current)</span></a>
      </li>
      <li>
        <a class="nav-link" href="customer.php">Customer<span class="sr-only">(current)</span></a>
      </li>
      <li>
        <a class="nav-link" href="report.php">Report<span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="font-size: 12px;">
    <button class="btn btn-dark" type="submit" style="font-size: 12px">Search</button>
  </form>
  <!-- Navbar content -->
</nav>
  </div>
</div>
</div>

<div>
   <form action="tracking_search.php" method = "post" class="form-inline">
    <input id ="sear" name="tracking_id" class="form-control mr-sm-2" type="search" placeholder="Enter repair id" aria-label="Search" style="font-size: 12px;">
    <button class="btn btn-dark" type="submit" style="font-size: 12px">Search</button>
  </form>
</div>

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

//variables to be inserted-get data from input
$Tracking_ID = $_POST['tracking_id'];


$sql = "select * from Albedo.tracking where Tracking_ID='$Tracking_ID'";
$result = $conn->query($sql);

if($result -> num_rows>0){
?>
<div>
<table class="table table-bordered">
    <thead >
      <tr>
        <th>Tracking ID</th>
        <th>Date Recieve from Customer</th>
        <th>Date Arrived at Company</th>
        <th>Date Send to Factory</th>
        <th>Date Receive Back from Factory</th>
        <th>Date Return from Department</th>
        <th>Send Method</th>
        <th>Person Sent</th>
        <!-- <th colspan="2">Action</th> -->
      </tr>
      </thead>
</div>
<?php
      while($row = $result -> fetch_assoc()){
        echo '<tr>';
        echo '<td>'.$row['Tracking_ID'].'</td>';
        echo '<td>'.$row['Date_cust_Receive'].'</td>';
        echo '<td>'.$row['Date_Arrive_Comp'].'</td>';
        echo '<td>'.$row['Send_To_Factory'].'</td>';
        echo '<td>'.$row['Receive_Back_Factory'].'</td>';
        echo '<td>'.$row['Date_Return_Dept'].'</td>';
        echo '<td>'.$row['Send_Method'].'</td>';
        echo '<td>'.$row['Person_Sent'].'</td>';
        // echo "<td><a href='edit_item.php?itemCode=".$row['Tracking_ID']."'><i class='fas fa-pen'></i>Update</a></td>";
        // echo "<td><a href='delete_item.php?itemCode=".$row['Tracking_ID']."'><i class='fas fa-trash-alt'></i>Delete</a></td>";
        echo '</tr>';
    }
    }
else{
  echo "0 result found";
}
?>



