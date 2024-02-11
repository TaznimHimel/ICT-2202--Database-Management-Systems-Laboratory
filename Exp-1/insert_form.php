<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Data Form</title>
</head>
<body>

<h2>Insert Data into College Database</h2>

<form action="insert_process.php" method="post">
    <label for="usn">USN:</label>
    <input type="text" name="usn" required><br>

    <label for="sname">Student Name:</label>
    <input type="text" name="sname" required><br>

    <label for="address">Address:</label>
    <input type="text" name="address" required><br>

    <label for="phone">Phone:</label>
    <input type="text" name="phone" required><br>

    <label for="gender">Gender:</label>
    <input type="text" name="gender" required><br>

    <input type="submit" value="Submit">
</form>

</body>
</html>
