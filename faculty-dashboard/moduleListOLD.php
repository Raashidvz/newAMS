<?php
    session_start();
    if($_SERVER['REQUEST_METHOD']=='GET'){
        // session_start();
        error_reporting(0);
        $sub_id=$_GET['id'];
        $_SESSION["SUBJECT_ID"]=$sub_id;
        $sub_name=$_GET['subject'];
        $dbcon=mysqli_connect("localhost","root","","AMS");

        //Lets store data to session
        $_SESSION["SUBJECT_ID"] = $sub_id;
        $_SESSION["SUBJECT_NAME"] = $sub_name;

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
            background-color: #0d7aa7; /* #0d7aa7;#673AB7 0d7aa7  0d7aa7 0d7aa7 */
            height: 90px;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .back-button {
            background-color: #0d7aa7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 24px;
            font-weight: bold;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .back-button-container {
            text-align: left;
            margin-bottom: 20px;
        }

        .navbar ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            gap: 20px;
        }

        /* .navbar ul li {
            position: relative;
        } */

        .navbar ul li a {
            color: white;
            text-decoration: none;
            font-size: medium;
            padding: 10px 15px;
            /* display: block;
            border-radius: 5px;
            
            transition: background-color 0.3s; */
        }

        /* .navbar ul li a:hover {
            background-color: #0d7aa7;
        } */

        /* .navbar ul li ul {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: white;
            color: #333;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            z-index: 1000;
        } */

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

        .navbar ul li:hover ul {
            display: block;
        }

        .content {
            padding: 20px;
            max-width: 1200px;
            margin: 20px auto;
        }

        .content h2 {
            font-size: 26px;
            margin-bottom: 20px;
            color: #0d7aa7;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 columns */
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            margin-bottom: 15px;
            color: #6c757d;
        }

        .card a {
            text-decoration: none;
            color: #0d7aa7;
            font-weight: bold;
        }

        .card a:hover {
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
    <!-- Navigation bar -->
    <div class="navbar">
        <button class="back-button" onclick="history.back()"><?php echo $_SESSION["SUBJECT_NAME"]; ?></button>
        <ul>
            <li><a href="viewStudents.php">View Students</a></li>
        </ul>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="card-container">

            <?php
                $sql="SELECT TOTAL_MODULES FROM subjects WHERE SUBJECT_ID='$sub_id'";
                $subject=mysqli_query($dbcon,$sql);
                if($subject){
                    $module_count=mysqli_fetch_array($subject);
                
                    for($i=1;$i<=$module_count[0];$i++){
                        $sql="SELECT * FROM notes WHERE SUBJECT_ID='$sub_id' AND MODULE='$i'";
                        $module=mysqli_query($dbcon,$sql);
                        if($module){
                            
                            $module_row=mysqli_fetch_array($module);
                            $module_name=($module_row['MODULE_NAME']==null)?"Module not added":$module_row['MODULE_NAME'];
                            //$_SESSION['MODULE_NAME']=$module_name;
                            echo "
                                <div class='card'>
                                    <h3>MODULE-".$i."</h3>
                                    <p>".$module_name."</p>
                                    <a href='notes-assignmentsOLD.php?module=".$i."'>View</a>
                                </div>
                            ";
                        }
                        
                    }
                }
                
                
            ?>
        </div>
    </div>
</body>
</html>
