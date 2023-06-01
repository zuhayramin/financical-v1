<!DOCTYPE html>
<?php
//include auth_session.php file on all user panel pages
include("auth_session.php");
include("db.php");
$username =   $_SESSION['username'];
?>
<html lang ='en'>
<head>
  <meta charset='utf-8'>
  <title>Transactions</title>
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
          <a href='reports.php'><span class='las la-users'></span>
            <span>Reports</span></a>
        </li>
        <li>
          <a href='transactions.php' class='active'><span class='las la-clipboard-list'></span>
            <span>Transactions</span></a>
        </li>
        <li>
          <a href='business.php'><span class='las la-landmark'></span>
            <span>Business</span></a>
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
            <h4>Hello <?php echo $username; ?>, <a href='logout.php'>Logout</h4>
      </header>

      <main>
        <h3>Add A Debit Transaction <a href='addtran.php'>Here!</a></h3>
        <h3>Add A Credit Transaction <a href='addcredit.php'>Here!</a></h3>
        <?php
        $query2 = "(SELECT b.name AS Name, (0 - td.amount) AS Amount, td.category AS Category, td.date AS Date, td.branch_debit AS Branch, td.online_debit AS Online
FROM DebitTransactions td
INNER JOIN AccountInfo ac
ON td.account_no = ac.account_no
INNER JOIN BusinessInfo b
ON b.bus_reg_no = ac.business_no
INNER JOIN UserInfo u
ON u.user_id = b.owner_id
WHERE u.username = '$username'
)
UNION
(SELECT b.name AS Name, tc.amount AS Amount, tc.category AS Category, tc.date AS Date, tc.branch_credit AS Branch, tc.online_credit AS Online
FROM CreditTransactions tc
INNER JOIN AccountInfo ac
ON tc.account_no = ac.account_no
INNER JOIN BusinessInfo b
ON b.bus_reg_no = ac.business_no
INNER JOIN UserInfo u
ON u.user_id = b.owner_id
WHERE u.username = '$username'
)
ORDER BY Date desc";

$res = mysqli_query($con, $query2);?>
              <div class='recent-grid'>
                <div class='projects'>
                  <div class='card'>
                    <div class='card-header'>
                      <h2>All Transactions</h2>
                    </div>

                    <div class='card-body'>
                      <table width="100%">
                        <tr><th>Category</th><th>Amount</th><th>Date</th><th>Branch</th><th>Online</th></tr>

<?php
                     while($num =  mysqli_fetch_assoc($res)){ ?>
                       <tr>
                        <td><?php echo $num['Category']; ?></td>
                        <td><?php echo $num['Amount']; ?></td>
                        <td><?php echo $num['Date']; ?></td>
                        <td><?php echo $num['Branch']; ?></td>
                        <td><?php echo $num['Online']; ?></td>
                        </td>
                       </tr>
                    <?php }
                        ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </main>
        </div>
        <?php $mysqli -> close(); ?>
        </body>
        </html>
