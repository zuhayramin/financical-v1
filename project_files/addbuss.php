<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Add a new Business</title>
    <link rel="stylesheet" href="login.css"/>
</head>
<body>
<?php
    include("auth_session.php");
    require('db.php');
    $id = $_SESSION['user_id'];
    // When form submitted, insert values into the database.
    if (isset($_REQUEST['submit'])) {
        // removes backslashes
        $bus_reg_no = mysqli_real_escape_string($con, $_POST['bus_reg_no']);
        //escapes special characters in a string
        $name = mysqli_real_escape_string($con, $_POST['name']);

        $tax_no = mysqli_real_escape_string($con, $_POST['tax_number']);

        $city = mysqli_real_escape_string($con, $_POST['city']);

        $zipcode = mysqli_real_escape_string($con, $_POST['zipcode']);

        $street = mysqli_real_escape_string($con, $_POST['street']);

        $query    = "INSERT into BusinessInfo (bus_reg_no, name, tax_number, owner_id, city, zip_code, street)
                     VALUES ('89712', 'BobPaintShop', '781262', ,'1','Dubai','00971','12')"; #" . md5($password) . "
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo "<div class='form'>
                  <h3>Business added successfully.</h3><br/>
                  <p class='link'>Click here to  view all <a href='business.php'>Businesses</a></p>
                  </div>";
        } else {
            echo "<div class='form'>
                  <h3>Incorrect Data entered!</h3><br/>
                  <p class='link'>Click <a href='addbuss.php'>here</a> to add a different Business.</p>
                  <p class='link'>Click <a href='addbuss.php'>here</a>  to return to Business Reports.</p>
                  </div>";
        }
    } else {
?>
    <form class="form" action="" method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <h1 class="login-title">Add A Business</h1>
        <input type="text" class="login-input" name="bus_reg_no" placeholder="Business Registration Number" required />
        <input type="text" class="login-input" name="name" placeholder="Name">
        <input type="text" class="login-input" name="tax_number" placeholder="Tax Number">
        <input type="text" class="login-input" name="city" placeholder="City">
        <input type="text" class="login-input" name="zipcode" placeholder="Zip-Code">
        <input type="text" class="login-input" name="street" placeholder="Street">
        <input type="submit" name="submit" value="Register" class="login-button">
        <p class="link"><a href="business.php">Return to Business Reports</a></p>
    </form>
<?php
    }
?>
</body>
</html>
