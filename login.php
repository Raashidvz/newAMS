<?php
    $dbcon=mysqli_connect("localhost","root","","AMS");
    // error_reporting(0);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f5f5f5;
            font-family: 'Arial', sans-serif;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 30px;
            color: #333;
        }

        .input-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        .input-group input[type="text"],
        .input-group input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .input-group input[type="text"]:focus,
        .input-group input[type="password"]:focus {
            outline: none;
            border-color: #0056b3;
        }

        .login-btn {
            width: 100%;
            padding: 10px;
            background-color: #0056b3;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-btn:hover {
            background-color: #004494;
        }

        .login-container p {
            margin-top: 20px;
            color: #666;
            font-size: 14px;
        }

        .login-container p a {
            color: #0056b3;
            text-decoration: none;
        }

        .login-container p a:hover {
            text-decoration: underline;
        }
        
        
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>
        <form action="" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <button type="submit" name="login" class="login-btn">Login</button>
            </div>
        </form>
        <p>Do you wanna <a href="pswd_change.php" class="change-pswd">change password </a>?</p>
    </div>
    <?php
        if(isset($_POST['login'])){
            $username=$_POST['username'];
            $pswd=$_POST['password'];
            
            $sql="SELECT * FROM users WHERE USER_NAME='$username'";
            $data=mysqli_query($dbcon,$sql);
            if($data){
                $user=mysqli_fetch_array($data);
                if($user[1]==$username && $user[2]==$pswd){
                    if($user['ROLEE']=='TEACHERS'){
                        //header("location:faculty-dashboard/faculty-dashboard.php?id=".$user['USER_ID']."");
                        header("location:faculty-dashboard/facultyDashboard.php?id=".$user['USER_ID']."");

                        exit();
                    }else if($user['ROLEE']=='STUDENTS'){
                        header("location:student-dashboard/student-dashboard.php?id=".$user['USER_ID']."");
                        exit();
                    }
                    else if($user['ROLEE']=='ADMIN'){
                        header("location:admin-dashboard/adminDash2.php");
                        exit();
                    }

                }else{
                    echo "<script>alert('USERNAME OR PASSWORD DOES NOT MATCH')</script>";
                }
            }else{
                echo "<script>alert('FALSE: connection Error')</script>";
                
            }
        }
    ?>

</body>
</html>
