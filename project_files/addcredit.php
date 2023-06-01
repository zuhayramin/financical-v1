<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Add Credit Transaction</title>
    <link rel="stylesheet" href="login.css"/>
</head>
<body>
<?php
    require('db.php');
    session_start();

    // When form submitted, check and create user session.
    if (isset($_POST['submit'])) {
        $date = $_POST['date'];

        $amount = $_POST['amount'];

        $account_no = $_POST['account_no'];

        $category = $_POST['category'];

        $branch = $_POST['branch_credit'];

        $online = $_POST['online_credit'];

        $query = "INSERT INTO CreditTransactions(`date`,amount, account_no, category, branch_credit, online_credit)
         VALUES ('$date','$amount', '$account_no', '$category', '$branch', '$online')";
        // Check user is exist in the database
        if(mysqli_query($con, $query)){
          echo '<h1> Record has been successfully added </h1>';
            // Redirect to user transactions page
            header("Location: transactions.php");
        } else {
            echo "<div class='form'>
                  <h3>Incorrect data entered.</h3><br/>
                  <p class='link'>Click <a href='addcredit.php'>here</a> to add another transaction.</p>
                  <p class='link'>Click <a href='transactions.php'>here</a> to return to you Transaction page.</p>
                  </div>";
        }
    } else {
?>
    <form class="form" method="post">
        <h1 class="login-title">Add Credit Transaction Information</h1>
        <input type="date" class="login-input" name="date" placeholder="Date">
        <input type="number" class="login-input" step="0.01" name="amount" placeholder="Amount" Required>
        <input type="number" class="login-input" step="1" name="account_no" placeholder="Account Number" Required>
        <input type="text" class="login-input" name="category" placeholder="Category" Required>
        <input type="text" class="login-input" name="branch_credit" placeholder="Branch Number">
        <input type="text" class="login-input" name="online_credit" placeholder="Online Channel">
        <input type="submit" value="Add Transaction" name="submit" class="login-button"/>
        <p class="link"><a href="transactions.php">Cancel Transaction</a></p>
  </form>
<?php
    }
?>
</body>
</html>
