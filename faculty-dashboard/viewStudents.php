<?php
    session_start();
    if($_SERVER['REQUEST_METHOD']=='GET'){
        //error_reporting(0);
        $dbcon=mysqli_connect("localhost","root","","AMS");
        $sub_id=$_SESSION["SUBJECT_ID"];
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
            background-color: #f4f4f9;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .container h1 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #0d7aa7;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #0d7aa7;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* .actions a {
            text-decoration: none;
            color: white;
            background-color: #0d7aa7;
            padding: 8px 12px;
            border-radius: 5px;
            margin-right: 5px;
            display: inline-block;
            transition: background-color 0.3s;
        } */

        /* .actions a:hover {
            background-color: #0a6b91;
        } */

        .back-button {
            background-color: #0d7aa7;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            display: inline-block;
        }

        .back-button:hover {
            background-color: #0a6b91;
        }

        .back-button-container {
            text-align: left;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="back-button-container">
            <button class="back-button" onclick="history.back()">Back</button>
        </div>
        
        <h1>Student List</h1>
        <table>
            <thead>
                <tr>
                    <th>Roll NO</th>
                    <th>Full Name</th>
                    <th>Class</th>
                    <th>Batch</th>
                    <th>Email</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <?php
                        
                        $sql="SELECT * FROM `subjects` WHERE SUBJECT_ID='$sub_id'";
                        $data=mysqli_query($dbcon,$sql);
                        if($data){
                            $sub_row=mysqli_fetch_array($data);
                            $class_name=$sub_row['CLASS_NAME'];
                            $semester=$sub_row['SEMESTER'];
                            $sem='SEMESTER_'.$semester;
                            $sql="SELECT * FROM batches WHERE CLASS='$class_name' AND $sem=1 order by YEARR";
                            $data2=mysqli_query($dbcon,$sql);
                            if($data2){
                                $batch_count=mysqli_num_rows($data2);
                                for($i=0;$i<$batch_count;$i++){
                                    $batch=mysqli_fetch_array($data2);
                                    $sql="SELECT * FROM students WHERE BATCH_ID='$batch[BATCH_ID]' order by NAMEE";
                                    $data3=mysqli_query($dbcon,$sql);
                                    if($data3){
                                        $student_count=mysqli_num_rows($data3);
                                        for($j=0;$j<$student_count;$j++){
                                            $student=mysqli_fetch_array($data3);
                                            $sql="SELECT * FROM users WHERE USER_ID='$student[USER_ID]'";
                                            $data4=mysqli_query($dbcon,$sql);
                                            $user=mysqli_fetch_array($data4);
                                             echo"  <tr>
                                                        <td>".$user['USER_NAME']."</td>
                                                        <td>".$student['NAMEE']."</td>
                                                        <td>".$class_name."</td>
                                                        <td>".$batch['YEARR']."</td>
                                                        <td>".$user['EMAIL']."</td>
                                                        <td>".$student['PARENT_CONTACT']."</td>
                                                    </tr>";
                                                
                                        }
                                    }
                                }
                            }
                        }
                    



                    
                ?>
                <!-- Add more student rows as needed -->
            </tbody>
        </table>
    </div>

</body>
</html>
