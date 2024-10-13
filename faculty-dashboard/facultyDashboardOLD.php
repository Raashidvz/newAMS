<?php
    session_start();
    if($_SERVER['REQUEST_METHOD']=='GET'){
       // session_start();
        error_reporting(0);
        $userid=$_GET['id'];
        $_SESSION["USER_ID"]=$userid;
        $dbcon=mysqli_connect("localhost","root","","AMS");
        $sql="SELECT * FROM teachers WHERE USER_ID='$userid'";
        $teacher=mysqli_query($dbcon,$sql);
        if($teacher){
            $teacher_row=mysqli_fetch_array($teacher);
        }
        $sql="SELECT * FROM subjects WHERE TEACHER_ID='$teacher_row[TEACHER_ID]'";
        $subjects=mysqli_query($dbcon,$sql);
        if($subjects){
            $sub_count=mysqli_num_rows($subjects);
        }

        //Lets store data in session
        $_SESSION["USER_ID"] = $userid;
        $_SESSION["TEACHER_ID"] = $teacher_row['TEACHER_ID'];

    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Faculty Dashboard</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .navbar {
            background-color: #0d7aa7;
            color: white;
            height: 90px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar h1 {
            margin: 0;
            font-size: 24px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        .navbar ul li {
            position: relative;
        }

        .navbar ul li a {
            color: white;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        /* .navbar ul li a:hover {
            background-color: #0d7aa7;
        } */

        .navbar ul li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: white;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1000;
        }

        /* .navbar ul li ul li {
            width: 200px;
        } */

        /* .navbar ul li ul li a {
            color: #333;
            padding: 10px;
            border-radius: 0;
        } */

        /* .navbar ul li ul li a:hover {
            background-color: #f5f5f5;
        } */

        /* .navbar ul li:hover ul {
            display: block;
        } */

        .content {
            padding: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }

        

        .panel-container {
            display: grid;
            /* grid-template-columns: 1fr 1fr; */
            gap: 20px;
        }

        .panel {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .panel:hover {
            transform: translateY(-5px);
        }

        .panel h3 {
            margin-top: 0;
            margin-bottom: 10px;
            font-size: 20px;
            color: #333;
        }

        /* .panel p {
            margin-bottom: 15px;
            color: #666;
        } */

        .panel a {
            text-decoration: none;
            color: white;
            background-color: #0d7aa7;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .panel a:hover {
            background-color: #0a6b91;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <div class="navbar">
        <h1>Welcome, Professor!</h1>
        <ul>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="panel-container">
            <?php
    
                for($i=0;$i<$sub_count;$i++){
                    
                    $sub_row=mysqli_fetch_array($subjects);
                    echo "<div class='panel'>
                                <h3>".$sub_row['SUBJECT_NAME']."</h3>
                                <div style='height: 20px; width: 100%;'></div>
                                <a href='moduleListOLD.php?id=".$sub_row['SUBJECT_ID']."&subject=".$sub_row['SUBJECT_NAME']."'>View Subject</a>
                         </div>";
                }
        
                

            ?>
           
        </div>
    </div>
</body>
</html>
