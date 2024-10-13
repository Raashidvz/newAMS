<?php
    error_reporting(0);
    $dbcon=mysqli_connect("localhost","root","","AMS");
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
        label>a{
            color: grey;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="login-container">
      
        <form action="" method="post">
            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">Old Password</label>
                <input type="password" id="password" name="old-pswd" required>
            </div>
            <div class="input-group">
                <label for="password">New Password</label>
                <input type="password" id="password" name="new-pswd" required>
            </div>
            <div class="input-group">
                <label for="password">Confirm Password</label>
                <input type="password" id="password" name="confirm-pswd" required>
            </div>
            
            <button type="submit" name="change-pswd" class="login-btn">submit</button>
           
            
        </form>
        <!-- <p>Don't have an account? <a href="register.html">Sign up</a></p> -->
    </div>
    <?php
        if(isset($_POST['change-pswd'])){
            $username=$_POST['username'];
            $old_pswd=$_POST['old-pswd'];
            $new_pswd=$_POST['new-pswd'];
            $confirm_pswd=$_POST['confirm-pswd'];
            
            $sql="SELECT * FROM users WHERE USER_NAME='$username'";
            $data=mysqli_query($dbcon,$sql);
            if($data){
                $user=mysqli_fetch_array($data);
                if($user['USER_NAME']==$username && $user['PASSWORDD']==$old_pswd){
                    
                    if($new_pswd==$confirm_pswd){
                        //changing password
                        $sql="UPDATE users SET PASSWORDD='$new_pswd' WHERE USER_ID='$user[USER_ID]'";
                        $result=mysqli_query($dbcon,$sql);
                        if($result){
                            echo "<script>alert('Password succesfully changed')</script>";
                            header("location:login.php");
                        }

                    }else{
                        echo "<script>alert('New password doesnt match')</script>";
                    }


                }else{
                    echo "<script>alert('USERNAME OR PASSWORD DOES NOT MATCH')</script>";
                }
            }else{
                echo "FALSE: connection Error";
            }
        }
    ?>

</body>
</html>
