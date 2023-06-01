<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Registration</title>
    <link rel="stylesheet" href="login.css"/>
</head>
<body>
<?php
    require('db.php');
    // When form submitted, insert values into the database.
    if (isset($_REQUEST['username'])) {
        // removes backslashes
        $username = stripslashes($_REQUEST['username']);
        //escapes special characters in a string
        $username = mysqli_real_escape_string($con, $username);
        $name    = stripslashes($_REQUEST['name']);
        $name    = mysqli_real_escape_string($con, $name);
        $surname    = stripslashes($_REQUEST['surname']);
        $surname    = mysqli_real_escape_string($con, $surname);
        $password = stripslashes($_REQUEST['password']);
        $password = mysqli_real_escape_string($con, $password);
        $query    = "INSERT into `UserInfo` (username, name, surname, password)
                     VALUES ('$username', '$name', '$surname', '$password')"; #" . md5($password) . "
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo "<div class='form'>
                  <h3>You are registered successfully.</h3><br/>
                  <p class='link'>Click here to <a href='login.php'>Login</a></p>
                  </div>";
        } else {
            echo "<div class='form'>
                  <h3>Required fields are missing.</h3><br/>
                  <p class='link'>Click here to <a href='registration.php'>registration</a> again.</p>
                  </div>";
        }
    } else {
?>
    <form class="form" action="" method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
        <h1 class="login-title">Registration</h1>
        <input type="text" class="login-input" name="username" placeholder="Username" required />
        <input type="text" class="login-input" name="name" placeholder="Name">
        <input type="text" class="login-input" name="surname" placeholder="Surname">
        <input type="password" class="login-input" name="password" placeholder="Password">
        <input type="submit" name="submit" value="Register" class="login-button">
        <p class="link"><a href="login.php">Click to Login</a></p>
    </form>
<?php
    }
?>
</body>
</html>
