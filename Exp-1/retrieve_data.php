<!-- retrieve_students.php -->
<?php
// Establish database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "college";
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// SQL query to retrieve data from STUDENT table
$sql = "SELECT * FROM STUDENT";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // Output data of each row
    while($row = $result->fetch_assoc()) {
        echo "USN: " . $row["USN"]. " - Name: " . $row["SName"]. " - Address: " . $row["Address"]. " - Phone: " . $row["Phone"]. " - Gender: " . $row["Gender"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>
