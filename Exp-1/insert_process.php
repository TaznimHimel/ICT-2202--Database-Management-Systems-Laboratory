<?php
// Assuming you have a database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "college";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch data from the form
$usn = $_POST['usn'];
$sname = $_POST['sname'];
$address = $_POST['address'];
$phone = $_POST['phone'];
$gender = $_POST['gender'];

// Insert data into the STUDENT table
$sql = "INSERT INTO STUDENT (USN, SName, Address, Phone, Gender) VALUES ('$usn', '$sname', '$address', '$phone', '$gender')";

if ($conn->query($sql) === TRUE) {
    echo "Record inserted successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
