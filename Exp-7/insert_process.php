<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "company";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$ssn = $_POST['ssn'];
$name = $_POST['name'];
$address = $_POST['address'];
$sex = $_POST['sex'];
$salary = $_POST['salary'];
$dno = $_POST['dno'];

$sql = "INSERT INTO EMPLOYEE (SSN, Name, Address, Sex, Salary, DNo) VALUES ('$ssn', '$name', '$address', '$sex', '$salary', '$dno')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>
