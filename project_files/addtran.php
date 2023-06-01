<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Add Debit Transaction</title>
    <link rel="stylesheet" href="login.css"/>
</head>
<body>
<?php
    require('db.php');
    session_start();

    // When form submitted, check and create user session.
    if (isset($_POST['submit'])) {
      $date = $_POST['date'];    // removes backslashes

      $amount = $_POST['amount'];

      $account_no = $_POST['account_no'];    // removes backslashes

      $category = $_POST['category'];

      $branch = $_POST['branch_debit'];

      $online = $_POST['online_debit'];

        $query = "(INSERT INTO `DebitTransactions`(date, amount, account_no, category, branch_debit, online_debit)
        VALUES ('$date', '$amount', '$account_no', '$category', '$branch', '$online'))";
        // Check user is exist in the database
        if(mysqli_query($con, $query)){
          echo '<h1> Record has been successfully added </h1>';
            // Redirect to user transactions page
            header("Location: transactions.php");
        } else {
            echo "<div class='form'>
                  <h3>Incorrect data entered.</h3><br/>
                  <p class='link'>Click <a href='addtran.php'>here</a> to add a different transaction.</p>
                  <p class='link'>Click <a href='transactions.php'>here</a> to return to you Transaction page.</p>
                  </div>";
        }
    } else {
?>
    <form class="form" method="post" name="addtran">
        <h1 class="login-title">Add Debit Transaction Information</h1>
        <input type="date" class="login-input" name="date" placeholder="Date" Required>
        <input type="number" class="login-input" name="amount" step='0.01' placeholder="Amount" Required>
        <input type="number" class="login-input" name="account_no" placeholder="Account Number" Required>
        <input type="text" class="login-input" name="category" placeholder="Category" Required>
        <input type="text" class="login-input" name="branch_debit" placeholder="Branch Number">
        <input type="text" class="login-input" name="online_debit" placeholder="Online Channel">
        <input type="submit" value="Add Transaction" name="submit" class="login-button"/>
        <p class="link"><a href="transactions.php">Cancel Transaction</a></p>
  </form>
<?php
    }
?>
</body>
</html>
