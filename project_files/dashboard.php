                                                                                                                                                                                                                                                         <!DOCTYPE html>
<?php
//include auth_session.php file on all user panel pages
include("auth_session.php");
include("db.php");
session_start();
?>
<?php
      $username =   $_SESSION['username'];
      $sql =  "SELECT (0-SUM(td.amount)) AS TotalDebits, SUM(tc.amount) AS TotalCredits,
              ((SELECT SUM(tc.amount) FROM CreditTransactions group by tc.account_no)
              - (SELECT SUM(td.amount) FROM DebitTransactions group by tc.account_no)) AS NetProfit
              FROM BusinessInfo b
              INNER JOIN AccountInfo ac
              ON ac.business_no = b.bus_reg_no
              INNER JOIN DebitTransactions td
              ON td.account_no = ac.account_no
              INNER JOIN CreditTransactions tc
              ON tc.account_no = ac.account_no
              INNER JOIN UserInfo u
              ON u.user_id = b.owner_id
              WHERE u.username = '$username'
              GROUP BY u.username";

          $result = mysqli_query($con, $sql);

          $row = mysqli_fetch_array($result);
      ?>
<html lang ='en'>
<head>
  <meta charset='utf-8'>
  <title>DashBoard</title>
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel='stylesheet' href='dash.css'>
</head>
<body>

  <div class='sidebar'>
    <div class='sidebar-brand'>
      <h1><span class='lab la-foursquare'></span> Financical</h1>
    </div>

    <div class='sidebar-menu'>
      <ul>
        <li>
          <a href='dashboard.php' class='active'><span class='las la-igloo'></span>
            <span>Dashboard</span></a>
        </li>
        <li>
          <a href='reports.php'><span class='las la-users'></span>
            <span>Reports</span></a>
        </li>
        <li>
          <a href='transactions.php'><span class='las la-clipboard-list'></span>
            <span>Transactions</span></a>
        </li>
        <li>
          <a href='business.php'><span class='las la-landmark'></span>
            <span>Businesses</span></a>
        </li>

      </ul>
    </div>
  </div>

    <div class='main-content'>
      <header>
        <h2><label for=''>
          <span class='las la-bars'></span>
        </label>
        Dashboard
      </h2>

        <div class='search-wrapper'>
          <span class='las la-search'></span>
          <input type='search' placeholder="Search Here" />
        </div>

        <div class='user-wrapper'>
          <img src='pic.jpeg' width=40px height=40px  alt="" >
          <div>
            <h4>Hello <?php echo $username; ?>, <a href='logout.php'>Logout</a></h4>
      </header>

      <main>
            <div class='cards'>
              <div class="card-single">
                <div>
                  <h1><?php
                    echo $row['TotalDebits']."</br>";
                  ?></h1>
                  <span>Total Debits</span>
                </div>
                <div>
                  <span class="las la-balance-scale-left"></span>
                </div>
              </div>

              <div class="card-single">
                <div>
                  <h1><?php
                    echo $row['TotalCredits']."</br>";
                  ?> </h1>
                  <span>Total Credits</span>
                </div>
                <div>
                  <span class="las la-balance-scale-right"></span>
                </div>
              </div>

              <div class="card-single">
                <div>
                  <h1><?php

                    echo $row['NetProfit']."</br>";

                  ?></h1>
                  <span>Net Profits</span>
                </div>
                <div>
                  <span class="las la-wallet"></span>
                </div>
              </div>

            </div>

            <div class='recent-grid'>
              <div class='projects'>
                <div class='card'>
                  <div class='card-header'>
                    <h2>Recent Transactions</h2>

                    <button><p class="link"><a href="transactions.php">See All <span class='las la-arrow-right'></span></a></p></button>
                  </div>

                  <div class='card-body'>
                    <table width="100%">
                      <tr><th>Business</th><th>Amount</th><th>City</th></tr>
                    <?php
                      $query2 = "(SELECT b.name AS Business, (0 - td.amount) AS Amount, b.city AS City
FROM DebitTransactions td
INNER JOIN AccountInfo ac
ON td.account_no = ac.account_no
INNER JOIN BusinessInfo b
ON b.bus_reg_no = ac.business_no
INNER JOIN UserInfo u
ON u.user_id = b.owner_id
WHERE u.username = '$username'
ORDER BY td.date desc)
UNION
(SELECT b.name AS Business, tc.amount AS Amount, b.city AS City
FROM CreditTransactions tc
INNER JOIN AccountInfo ac
ON tc.account_no = ac.account_no
INNER JOIN BusinessInfo b
ON b.bus_reg_no = ac.business_no
INNER JOIN UserInfo u
ON u.user_id = b.owner_id
WHERE u.username = '$username'
ORDER BY tc.date desc)
LIMIT 10";

$res = mysqli_query($con, $query2);


                     while($num =  mysqli_fetch_assoc($res)){ ?>
                       <tr>
                         <td><?php echo $num['Business']; ?>
                        <td><?php echo $num['Amount']; ?></td>
                        <td><?php echo $num['City']; ?></td>
                       </tr>
                    <?php }
                      ?>
                  </div>
                </div>
              </div>
            </div>

      </main>
    </div>
  <?php $mysqli -> close(); ?>
</body>
</html>
