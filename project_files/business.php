<!DOCTYPE html>
<?php
//include auth_session.php file on all user panel pages
include("auth_session.php");
include("db.php");
session_start();
$username =   $_SESSION['username'];
?>
<html lang ='en'>
<head>
  <meta charset='utf-8'>
  <title>Businesses</title>
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel='stylesheet' href='mp.css'>
</head>
<body>

  <div class='sidebar'>
    <div class='sidebar-brand'>
      <h1><span class='lab la-foursquare'></span> Financical</h1>
    </div>

    <div class='sidebar-menu'>
      <ul>
        <li>
          <a href='dashboard.php' ><span class='las la-igloo'></span>
            <span>Dashboard</span></a>
        </li>
        <li>
          <a href='reports.php' ><span class='las la-users'></span>
            <span>Reports</span></a>
        </li>
        <li>
          <a href='transactions.php'><span class='las la-clipboard-list'></span>
            <span>Transactions</span></a>
        </li>
        <li>
          <a href='business.php' class='active'><span class='las la-landmark'></span>
            <span>Businesses</span></a>
        </li>
        <!-- <li>
          <a href=''><span class='las la-chart-bar'></span>
            <span>Overview</span></a>
        </li> -->
      </ul>
    </div>
  </div>

    <div class='main-content'>
      <header>
        <h2><label for=''>
          <span class='las la-bars'></span>
        </label>
        Businesses
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
        <h4>Add a new business <a href='addbuss.php'>here!</a></h4>
        <?php
        $query2 = "SELECT b.name as Business, (0-SUM(td.amount)) AS TotalDebits, SUM(tc.amount) AS TotalCredits,
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
                GROUP BY b.name";

$res = mysqli_query($con, $query2);
?>
              <div class='recent-grid'>
                <div class='projects'>
                  <div class='card'>
                    <div class='card-header'>
                      <h2>Business Reports</h2>


                    </div>

                    <div class='card-body'>
                      <table width="100%">
                        <tr><th>Business</th><th>Total Debits</th><th>Total Credits</th><th>Net Profit</th></tr>

<?php
                     while($num =  mysqli_fetch_assoc($res)){ ?>
                       <tr>
                        <td><?php echo $num['Business']; ?></td>
                        <td><?php echo $num['TotalDebits']; ?></td>
                        <td><?php echo $num['TotalCredits']; ?></td>
                        <td><?php echo $num['NetProfit']; ?></td>
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
