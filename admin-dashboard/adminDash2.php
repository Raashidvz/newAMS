<?php
    session_start();
    $dbcon=mysqli_connect("localhost","root","","AMS");
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adminStyle2.css" type="text/css">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const tabs = document.querySelectorAll('.sidebar ul li a');
            const contents = document.querySelectorAll('.tab-content');

            // Function to show the active tab
            function showActiveTab(tabId) {
                // Hide all contents
                contents.forEach(content => content.classList.remove('active'));

                // Show the target tab content
                const target = document.getElementById(tabId);
                if (target) {
                    target.classList.add('active');
                }
            }

            // Check the URL parameters for the active tab
            const urlParams = new URLSearchParams(window.location.search);
            const activeTab = urlParams.get('tab');

            if (activeTab) {
                showActiveTab(activeTab); // Load the tab based on URL parameter
            } else {
                contents[0].classList.add('active'); // Load the first tab by default
            }

            tabs.forEach(tab => {
                tab.addEventListener('click', function (e) {
                    e.preventDefault();
                    const tabId = tab.getAttribute('href').substring(1); // Get tab ID from href
                    showActiveTab(tabId);
                });
            });
        });

    </script>
</head>
<body>
    <!-- <header>
        <h1>Admin Dashboard</h1>
        <nav>
            <ul>
                <li><a href="#" class="logout-btn">Logout</a></li>
            </ul>
        </nav>
    </header> -->
    <div class="dashboard">
        <aside class="sidebar">
           
            <ul>
                <!-- <li><a href="#overview">Dashboard Overview</a></li> -->
                <li><a href="#manage-students">Manage Students</a></li>
                <li><a href="#manage-teachers">Manage Teachers</a></li>
                <li><a href="#manage-subjects">Manage Subjects</a></li>
                <li><a href="#manage-batches">Manage Batches</a></li>
            </ul>
            <a href="logout.php" class="logout-btn">Logout</a>
            
        </aside>
        <main class="content">
            <!-- Content will be dynamically loaded here -->
            
            <div id="manage-students" class="tab-content">
                <a href="addStudents.php?tab=manage-students" class="new-btn">Add New</a>
                <div style="height: 20px; width: 100%;"></div>
                <div class="card-container">
                    <?php
                        $sql="SELECT * FROM batches order by YEARR DESC";
                        $batches=mysqli_query($dbcon,$sql);
                        if($batches){
                            $rowCount=mysqli_num_rows($batches);
                            for($i=0;$i<$rowCount;$i++){
                                $row=mysqli_fetch_array($batches);
                                echo "
                                        <div class='card'>
                                            <h3>".$row['BATCH']."</h3>
                                            <a href='next-page.html' class='button-link'>Next Page</a>
                                        </div>";
                                
                            }
                                
                        }
                            
                        
                    ?>
                </div>

            </div>
        
            <div id="manage-subjects" class="tab-content">
                <a href="addSubjects.php?tab=manage-subjects" class="new-btn">Add New</a>
                <div style="height: 20px; width: 100%;"></div>
                <table>
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Class</th>
                            <th>Semester</th>
                            <th>Teacher-1</th>
                            <th>Teacher-2</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <?php
                        $sql="SELECT * FROM subjects ORDER BY SEMESTER";
                        $subjectTable=mysqli_query($dbcon,$sql);
                        if($subjectTable){
                            $rowCount=mysqli_num_rows($subjectTable);
                            for($i=0;$i<$rowCount;$i++){
                                $subject=mysqli_fetch_array($subjectTable);
                                $key1=$subject['TEACHER_ID'];
                                if($key1!=null){
                                    $sql="SELECT NAMEE FROM teachers WHERE TEACHER_ID=$key1";
                                    $data=mysqli_query($dbcon,$sql);
                                    $array=mysqli_fetch_array($data);
                                    $teacherName1=$array[0];

                                }else{
                                    $teacherName1=null;
                                }

                                $key2=$subject['TEACHER_ID2'];
                                if($key2!=null){
                                    $sql="SELECT NAMEE FROM teachers WHERE TEACHER_ID=$key2";
                                    $data=mysqli_query($dbcon,$sql);
                                    $array=mysqli_fetch_array($data);
                                    $teacherName2=$array[0];

                                }else{
                                    $teacherName2=null;
                                }

                                echo "<tr>
                                        <td>".$subject['SUBJECT_NAME']."</td>
                                        <td>".$subject['CLASS_NAME']."</td>
                                        <td>".$subject['SEMESTER']."</td>
                                        <td>".$teacherName1."</td>
                                        <td>".$teacherName2."</td>
                                        <td class='action-btn'><a href='update_subject.php?id1=".$key1."&id2=".$key2."&tab=manage-teachers' class='update-btn'>Update</a><a href='delete.php?id=".$subject['SUBJECT_ID']."&rolee=subject1&tab=manage-subjects' class='delete-btn'>Delete-1</a><a href='delete.php?id=".$subject['SUBJECT_ID']."&rolee=subject2&tab=manage-subjects' class='delete-btn'>Delete-2</a></td>
                                    </tr>";
                            }
                        }
                        
                    ?>
                        
                    </tbody>
                </table>
            </div>

            <div id="manage-teachers" class="tab-content">
                <a href="addTeachers.php?tab=manage-teachers" class="new-btn">Add New</a>
                <div style="height: 20px; width: 100%;"></div>
                <table>
                    <thead>
                        <tr>
                            
                            <th>User Name</th>
                            <th>Teacher Name</th>
                            <th>Email</th>
                            <th>Department</th>      
                            <th>Joining Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>

                        <?php
                        $sql="SELECT * FROM users WHERE ROLEE=2 AND STATUSS='ACTIVE'";
                        $teachers=mysqli_query($dbcon,$sql);
                        if($teachers){
                            $rowCount=mysqli_num_rows($teachers);
                            for($i=0;$i<$rowCount;$i++){
                                $row=mysqli_fetch_array($teachers);
                                $key=$row['USER_ID'];
                                $sql2="SELECT * FROM teachers where USER_ID=$key";
                                $data=mysqli_query($dbcon,$sql2);
                                if($data){
                                    $person=mysqli_fetch_array($data);
                                }
                                echo "<tr>
                                        <td>".$row['USER_NAME']."</td>
                                        <td>".$person['NAMEE']."</td>
                                        <td>".$row['EMAIL']."</td>
                                        <td>".$person['DEPARTMENT']."</td>
                                        <td>".$person['JOINING_DATE']."</td>
                                        <td class='action-btn'><a href='update_teacher.php?id=".$key."&tab=manage-teachers' class='update-btn'>Update</a><a href='delete.php?id=".$row['USER_ID']."&rolee=teacher&tab=manage-teachers' class='delete-btn'>Delete</a></td>
                                        
                                    </tr>";
                            }
                        }
                        
                    ?>
                        
                    </tbody>
                </table>
            </div>

            <div id="manage-batches" class="tab-content">
                <table>
                    <thead>
                        <tr>
                            
                            <th>Batch</th>
                            <th>Class</th>
                            <th>Sem-1</th>
                            <th>Sem-2</th>
                            <th>Sem-3</th>
                            <th>Sem-4</th>
                            <th>Sem-5</th>
                            <th>Sem-6</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                    <?php
                        $sql="SELECT * FROM batches order by YEARR DESC";
                        $batches=mysqli_query($dbcon,$sql);
                        if($batches){
                            $rowCount=mysqli_num_rows($batches);
                            for($i=0;$i<$rowCount;$i++){
                                $row=mysqli_fetch_array($batches);

                                echo "<tr>
                                        <td>".$row['YEARR']."</td>
                                        <td>".$row['CLASS']."</td>";

                                        if($row['SEMESTER_1']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_1&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_1&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                        if($row['SEMESTER_2']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_2&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_2&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                        if($row['SEMESTER_3']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_3&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_3&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                        if($row['SEMESTER_4']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_4&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_4&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                        if($row['SEMESTER_5']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_5&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_5&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                        if($row['SEMESTER_6']==0){
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=1&semester=SEMESTER_6&tab=manage-batches' class='accessAllow-btn'>Give Access</a></td>"; 
                                        }else{
                                            echo "<td><a href='updateAccess.php?id=".$row['BATCH_ID']."&access=0&semester=SEMESTER_6&tab=manage-batches' class='accessDeny-btn'>Deny Access</a></td>";
                                        }

                                    echo "<td class='action-btn'><a href='delete.php?id=".$row['BATCH_ID']."&rolee=batch&tab=manage-batches' class='delete-btn'>Delete</a></td>";
                                        
                                echo "</tr>";

                            }
                        }
                        
                    ?>
                
                    </tbody>
                </table>
            </div>
            <!-- Add more sections as needed -->
        </main>
    </div>
    <script src="script.js"></script>
</body>
</html>
