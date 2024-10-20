<?php
    error_reporting(0);
    use PhpOffice\PhpSpreadsheet\Reader\Xlsx;
    require_once('vendor/autoload.php');
    $dbcon=mysqli_connect("localhost","root","","AMS");
    $allowed_ext=['xls','cvs','xlsx'];
    $tab=$_GET['tab'];
    //GET ALL SUBJECTS
    $sql="SELECT SUBJECT_NAME FROM subjects";
    $subjects=mysqli_query($dbcon,$sql);
    if($subjects){
        $count=mysqli_num_rows($subjects);
        $allowed_sub=array($count);
        for($i=0;$i<$count;$i++){
            $row=mysqli_fetch_array($subjects);
            $allowed_sub[$i]=$row[0];
        }
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload PDF</title>
    <link rel="stylesheet" href="addStudents.css">
</head>
<body>
    <div class="container">

        <h2>Upload Teachers</h2>
        
        <form action="" method="post" enctype="multipart/form-data">
            <label>Select EXCEL file to upload:</label>
            <label for="file-input" id="file-label" class="custom-file-upload">
                Choose File
            </label>
            <input  type="file" id="file-input" name="fileUpload[]" multiple required>
            <input type="submit" name="upload-file" id="upload-file" value="Upload File">
            <h5 id="prin"></h5>
        </form>
    </div>
    <script>
        document.getElementById('file-input').addEventListener('change', function() {
            var fileLabel = document.getElementById('file-label');
            var fileNames = Array.from(this.files).map(file => file.name).join(', ');
            fileLabel.textContent = fileNames || 'Choose Files';
            document.getElementById('prin').value.innerHTML=fileNames;
        });
    </script>

    <?php
        if(isset($_POST['upload-file'])){
                 
            for($i=0;$i<count($_FILES['fileUpload']['name']);$i++){

                $fileName= basename($_FILES['fileUpload']['name'][$i]);
                $uploadfile=$_FILES['fileUpload']['tmp_name'][$i];
                move_uploaded_file($uploadfile,$fileName);
                $file_extension=pathinfo($fileName,PATHINFO_EXTENSION);

                if(in_array($file_extension,$allowed_ext)){

                    $reader=new \PhpOffice\PhpSpreadsheet\Reader\Xlsx();
                    $spreedsheet=$reader->load($fileName);
                    $excelsheet=$spreedsheet->getSheet(0);
                    $spreadsheetAry=$excelsheet->toArray();
                    $sheetcount=count($spreadsheetAry);

                    for($row=1;$row<$sheetcount;$row++){
                        
                        $username = isset($spreadsheetAry[$row][0]) ? $spreadsheetAry[$row][0] : null;
                        $email = isset($spreadsheetAry[$row][1]) ? $spreadsheetAry[$row][1] : null;
                        $teacherName = isset($spreadsheetAry[$row][2]) ? $spreadsheetAry[$row][2] : null;
                        $department = isset($spreadsheetAry[$row][3]) ? $spreadsheetAry[$row][3] : null;
                        $joiningDate = isset($spreadsheetAry[$row][4]) ? $spreadsheetAry[$row][4] : null;
                        $sub1 = isset($spreadsheetAry[$row][5]) ? $spreadsheetAry[$row][5] : null;
                        $sub2 = isset($spreadsheetAry[$row][6]) ? $spreadsheetAry[$row][6] : null;
                        $sub3 = isset($spreadsheetAry[$row][7]) ? $spreadsheetAry[$row][7] : null;
                        $sub4 = isset($spreadsheetAry[$row][8]) ? $spreadsheetAry[$row][8] : null;

                        // echo $username."<BR>";
                        // echo $email."<BR>";
                        // echo $teacherName."<BR>";
                        // echo $department."<BR>";
                        // echo $joiningDate."<BR>";
                        // echo $sub1."<BR>";
                        // echo $sub2."<BR>";
                        
                        //converting data to upper case for more accuracy
                        $teacherName=strtoupper($teacherName);
                        $department=strtoupper($department);
                        $joiningDate=strtoupper($joiningDate);
                        
                        $SUB1=isset($sub1) ? strtoupper($sub1) : null;
                        $SUB2=isset($sub2) ? strtoupper($sub2) : null;
                        $SUB3=isset($sub3) ? strtoupper($sub3) : null;
                        $SUB4=isset($sub4) ? strtoupper($sub4) : null;

                        // $month=date('m');
                        // if($month>5){
                            // $yr=date('Y');
                        // }else{
                        //     $yr=date('Y')-1;
                        // }
                        
                        if($username){

                            //check whether the data already exist or not
                            $sqlx="SELECT * FROM users where USER_NAME=$username AND STATUSS='ACTIVE'";
                            $check=mysqli_query($dbcon,$sqlx);
                            $deciscion=mysqli_fetch_array($check);

                            if($deciscion[1]==$username){

                                //user already exist so update teacher
                                $sql2="UPDATE users SET EMAIL='$email' WHERE USER_ID='$deciscion[0]'";
                                $data2=mysqli_query($dbcon,$sql2);
                                if($data2){
                                    $sql21="UPDATE teachers SET NAMEE='$teacherName',DEPARTMENT='$department',JOINING_DATE='$joiningDate' WHERE USER_ID='$deciscion[0]'";
                                    $data21=mysqli_query($dbcon,$sql21);
                                    if($data21){
                                        //echo "DATA UPDATED SUCCESSFULLY";
                                    }

                                    //first delete subjects allotted and add new
                                    $sql="SELECT TEACHER_ID FROM teachers WHERE USER_ID=$deciscion[0]";
                                    $data=mysqli_query($dbcon,$sql);
                                    if($data){
                                        $teacherID=mysqli_fetch_array($data);
                                        $sql="UPDATE subjects SET TEACHER_ID=null WHERE TEACHER_ID=$teacherID[0]";
                                        $sql2="UPDATE subjects SET TEACHER_ID2=null WHERE TEACHER_ID2=$teacherID[0]";
                                        $data=mysqli_query($dbcon,$sql);
                                        $data2=mysqli_query($dbcon,$sql2);
                                        if($data && $data2){
                                            
                                            //now add subjects
                                            if(in_array($SUB1,$allowed_sub)){
                                                $sql1="SELECT * FROM subjects WHERE SUBJECT_NAME='$SUB1'";
                                                $data=mysqli_query($dbcon,$sql1);
                                                if($data){
                                                    $sub_row=mysqli_fetch_array($data);
                                                    if($sub_row['TEACHER_ID']==null){
                                                        $sql5="UPDATE subjects SET TEACHER_ID='$teacherID[0]' WHERE SUBJECT_NAME='$SUB1'";
                                                        $data5=mysqli_query($dbcon,$sql5);
                                                    }else if($sub_row['TEACHER_ID2']==null){
                                                        $sql5="UPDATE subjects SET TEACHER_ID2='$teacherID[0]' WHERE SUBJECT_NAME='$SUB1'";
                                                        $data5=mysqli_query($dbcon,$sql5);
                                                    }
                                                    //Now we have to give acess to teacher to know details about students of this batch
                                                    //So lets add this batch to routemap table
                                                    $yr=date('Y');
                                                    if($sub_row['SEMESTER']==1 || $sub_row['SEMESTER']==2){
                                                        $yr=$yr;
                                                    }else if($sub_row['SEMESTER']==3 || $sub_row['SEMESTER']==4){
                                                        $yr=$yr-1;
                                                    }else if($sub_row['SEMESTER']==5 || $sub_row['SEMESTER']==6){
                                                        $yr=$yr-2;
                                                    }else {
                                                        $yr=$yr-3;
                                                    }
                                                    $sq="SELECT * FROM batches WHERE CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr'";
                                                    $dat=mysqli_query($dbcon,$sq);
                                                    if($dat){
                                                        $batch_row=mysqli_fetch_array($dat);
                                                        $sql="SELECT * FROM routemap WHERE SUBJECT_NAME='$sub_row[SUBJECT_NAME]' AND CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr' AND TEACHER_ID='$teacherID[0]' ";
                                                        $routeCheck=mysqli_query($dbcon,$sql);
                                                        if($routeCheck){
                                                            $checkRow=mysqli_fetch_array($routeCheck);
                                                            if($checkRow['YEARR']!=$yr){
                                                                $sql="INSERT INTO routemap(TEACHER_ID, SUBJECT_NAME, CLASS, YEARR) VALUES ('$teacherID[0]','$sub_row[SUBJECT_NAME]','$sub_row[CLASS_NAME]','$yr')";
                                                                $routemap=mysqli_query($dbcon,$sql);
                                                            }
                                                        }
                                            
                                                    }


                                                }
                                            }
                                            if(in_array($SUB2,$allowed_sub)){
                                                $sql1="SELECT * FROM subjects WHERE SUBJECT_NAME='$SUB2'";
                                                $data=mysqli_query($dbcon,$sql1);
                                                if($data){
                                                    $sub_row=mysqli_fetch_array($data);
                                                    if($sub_row['TEACHER_ID']==null){
                                                        $sql5="UPDATE subjects SET TEACHER_ID='$teacherID[0]' WHERE SUBJECT_NAME='$SUB2'";
                                                        $data5=mysqli_query($dbcon,$sql5);
                                                    }else if($sub_row['TEACHER_ID2']==null){
                                                        $sql5="UPDATE subjects SET TEACHER_ID2='$teacherID[0]' WHERE SUBJECT_NAME='$SUB2'";
                                                        $data5=mysqli_query($dbcon,$sql5);
                                                    }
                                                    //Now we have to give acess to teacher to know details about students of this batch
                                                    //So lets add this batch to routemap table
                                                    $yr=date('Y');
                                                    if($sub_row['SEMESTER']==1 || $sub_row['SEMESTER']==2){
                                                        $yr=$yr;
                                                    }else if($sub_row['SEMESTER']==3 || $sub_row['SEMESTER']==4){
                                                        $yr=$yr-1;
                                                    }else if($sub_row['SEMESTER']==5 || $sub_row['SEMESTER']==6){
                                                        $yr=$yr-2;
                                                    }else {
                                                        $yr=$yr-3;
                                                    }
                                                    $sq="SELECT * FROM batches WHERE CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr'";
                                                    $dat=mysqli_query($dbcon,$sq);
                                                    if($dat){
                                                        $batch_row=mysqli_fetch_array($dat);
                                                        $sql="SELECT * FROM routemap WHERE SUBJECT_NAME='$sub_row[SUBJECT_NAME]' AND CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr' AND TEACHER_ID='$teacherID[0]'";
                                                        $routeCheck=mysqli_query($dbcon,$sql);
                                                        if($routeCheck){
                                                            $checkRow=mysqli_fetch_array($routeCheck);
                                                            if($checkRow['YEARR']!=$yr){
                                                                $sql="INSERT INTO routemap(TEACHER_ID, SUBJECT_NAME, CLASS, YEARR) VALUES ('$teacherID[0]','$sub_row[SUBJECT_NAME]','$sub_row[CLASS_NAME]','$yr')";
                                                                $routemap=mysqli_query($dbcon,$sql);
                                                            }
                                                        }
                                                    
                                                    }
                                                }
                                            }
                                        }
                                    }

                                }
                                   
                            }else{

                                //user doesnt exist so add teacher
                                $sql = "INSERT INTO users (USER_NAME, PASSWORDD, EMAIL,ROLEE) VALUES ('$username', '$username', '$email','2')";
                                $data=mysqli_query($dbcon,$sql);
                                if($data){
                                    
                                    //echo "Data inserted successfully";
                                    $sql2="SELECT USER_ID FROM users WHERE USER_NAME=$username";
                                    $data2=mysqli_query($dbcon,$sql2);
                                    if($data2){
                                        $key=mysqli_fetch_array($data2);
                                        $sql3="INSERT INTO teachers (USER_ID, NAMEE, DEPARTMENT, JOINING_DATE) VALUES ('$key[0]','$teacherName','$department','$joiningDate')";
                                        $data3=mysqli_query($dbcon,$sql3);
                                    }
                                }

                                if(in_array($SUB1,$allowed_sub)){
                                    $sql4="SELECT TEACHER_ID FROM teachers WHERE USER_ID=$key[0]";
                                    $data4=mysqli_query($dbcon,$sql4);
                                    if($data4){
                                        $teacherkey=mysqli_fetch_array($data4);

                                        //get subject row
                                        $sql1="SELECT * FROM subjects WHERE SUBJECT_NAME='$SUB1'";
                                        $data=mysqli_query($dbcon,$sql1);
                                        if($data){
                                            $sub_row=mysqli_fetch_array($data);
                                            if($sub_row['TEACHER_ID']==null){
                                                $sql5="UPDATE subjects SET TEACHER_ID='$teacherkey[0]' WHERE SUBJECT_NAME='$SUB1'";
                                                $data5=mysqli_query($dbcon,$sql5);
                                            }else if($sub_row['TEACHER_ID2']==null){
                                                $sql5="UPDATE subjects SET TEACHER_ID2='$teacherkey[0]' WHERE SUBJECT_NAME='$SUB1'";
                                                $data5=mysqli_query($dbcon,$sql5);
                                            }
                                            //Now we have to give acess to teacher to know details about students of this batch
                                            //So lets add this batch to routemap table
                                            $yr=date('Y');
                                            if($sub_row['SEMESTER']==1 || $sub_row['SEMESTER']==2){
                                                $yr=$yr;
                                            }else if($sub_row['SEMESTER']==3 || $sub_row['SEMESTER']==4){
                                                $yr=$yr-1;
                                            }else if($sub_row['SEMESTER']==5 || $sub_row['SEMESTER']==6){
                                                $yr=$yr-2;
                                            }else {
                                                $yr=$yr-3;
                                            }
                                            $sq="SELECT * FROM batches WHERE CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr'";
                                            $dat=mysqli_query($dbcon,$sq);
                                            if($dat){
                                                $batch_row=mysqli_fetch_array($dat);
                                                $sql="SELECT * FROM routemap WHERE SUBJECT_NAME='$sub_row[SUBJECT_NAME]' AND CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr' AND TEACHER_ID='$teacherkey[0]'";
                                                $routeCheck=mysqli_query($dbcon,$sql);
                                                if($routeCheck){
                                                    $checkRow=mysqli_fetch_array($routeCheck);
                                                    if($checkRow['YEARR']!=$yr){
                                                        $sql="INSERT INTO routemap(TEACHER_ID, SUBJECT_NAME, CLASS, YEARR) VALUES ('$teacherkey[0]','$sub_row[SUBJECT_NAME]','$sub_row[CLASS_NAME]','$yr')";
                                                        $routemap=mysqli_query($dbcon,$sql);
                                                    }
                                                }
                                            
                                            }
                                            
                                        }
                                
                                    }
                                }


                                if(in_array($SUB2,$allowed_sub)){
                                    $sql4="SELECT TEACHER_ID FROM teachers WHERE USER_ID=$key[0]";
                                    $data4=mysqli_query($dbcon,$sql4);
                                    if($data4){
                                        $teacherkey=mysqli_fetch_array($data4);

                                        //get subject row
                                        $sql1="SELECT * FROM subjects WHERE SUBJECT_NAME='$SUB2'";
                                        $data=mysqli_query($dbcon,$sql1);
                                        if($data){
                                            $sub_row=mysqli_fetch_array($data);
                                            if($sub_row['TEACHER_ID']==null){
                                                $sql5="UPDATE subjects SET TEACHER_ID='$teacherkey[0]' WHERE SUBJECT_NAME='$SUB2'";
                                                $data5=mysqli_query($dbcon,$sql5);
                                            }else if($sub_row['TEACHER_ID2']==null){
                                                $sql5="UPDATE subjects SET TEACHER_ID2='$teacherkey[0]' WHERE SUBJECT_NAME='$SUB2'";
                                                $data5=mysqli_query($dbcon,$sql5);
                                            }
                                            //Now we have to give acess to teacher to know details about students of this batch
                                            //So lets add this batch to routemap table
                                            $yr=date('Y');
                                            if($sub_row['SEMESTER']==1 || $sub_row['SEMESTER']==2){
                                                $yr=$yr;
                                            }else if($sub_row['SEMESTER']==3 || $sub_row['SEMESTER']==4){
                                                $yr=$yr-1;
                                            }else if($sub_row['SEMESTER']==5 || $sub_row['SEMESTER']==6){
                                                $yr=$yr-2;
                                            }else {
                                                $yr=$yr-3;
                                            }
                                            $sq="SELECT * FROM batches WHERE CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr'";
                                            $dat=mysqli_query($dbcon,$sq);
                                            if($dat){
                                                $batch_row=mysqli_fetch_array($dat);
                                                $sql="SELECT * FROM routemap WHERE SUBJECT_NAME='$sub_row[SUBJECT_NAME]' AND CLASS='$sub_row[CLASS_NAME]' AND YEARR='$yr' AND TEACHER_ID='$teacherkey[0]'";
                                                $routeCheck=mysqli_query($dbcon,$sql);
                                                if($routeCheck){
                                                    $checkRow=mysqli_fetch_array($routeCheck);
                                                    if($checkRow['YEARR']!=$yr){
                                                        $sql="INSERT INTO routemap(TEACHER_ID, SUBJECT_NAME, CLASS, YEARR) VALUES ('$teacherkey[0]','$sub_row[SUBJECT_NAME]','$sub_row[CLASS_NAME]','$yr')";
                                                        $routemap=mysqli_query($dbcon,$sql);
                                                    }
                                                }
                                                
                                            }
                                        }
                                
                                    }
                                }


                                // if(in_array($SUB2,$allowed_sub)){
                                //     $sql4="SELECT TEACHER_ID FROM teachers WHERE USER_ID=$key[0]";
                                //     $data4=mysqli_query($dbcon,$sql4);
                                //     if($data4){
                                //         $teacherkey=mysqli_fetch_array($data4);
                                //         $sql5="UPDATE subjects SET TEACHER_ID='$teacherkey[0]' WHERE SUBJECT_NAME='$SUB2'";
                                //         $data5=mysqli_query($dbcon,$sql5);
                                //     }
                                // }

                            }

                        }
                        
                    }

                }
                unlink($fileName);
            }
            header("Location: adminDashboard.php?tab=" . $tab);
                  
        }

    ?>


</body>
</html>
