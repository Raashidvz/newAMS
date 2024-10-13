<?php
    session_start();
    if($_SERVER['REQUEST_METHOD']=='GET'){
        // error_reporting(0);
        error_reporting(E_ALL);
        ini_set('display_errors', 1);
        $userid=$_GET['id'];
        $_SESSION["USER_ID"]=$userid;
        $dbcon=mysqli_connect("localhost","root","","AMS");
        $sql="SELECT * FROM teachers WHERE USER_ID='$userid'";
        $teacher=mysqli_query($dbcon,$sql);
        if($teacher){
            $teacher_row=mysqli_fetch_array($teacher);
            $_SESSION['TEACHER_ID']=$teacher_row['TEACHER_ID'];
            $_SESSION['DEPARTMENT']=$teacher_row['DEPARTMENT'];
        }
        $sql="SELECT * FROM subjects WHERE TEACHER_ID='$teacher_row[TEACHER_ID]' OR TEACHER_ID2='$teacher_row[TEACHER_ID]'";
        $subjects=mysqli_query($dbcon,$sql);
        if($subjects){
            $sub_count=mysqli_num_rows($subjects);
        }

        //to get old subjects
        $sql="SELECT * FROM notes WHERE TEACHER_ID='$teacher_row[TEACHER_ID]'";
        $notes=mysqli_query($dbcon,$sql);
        if($notes){
            $count=mysqli_num_rows($notes);
            $values=array();
            for($i=0,$j=0;$i<$count;$i++){
                $notes_row=mysqli_fetch_array($notes);
                $sqlx="SELECT * FROM subjects WHERE SUBJECT_ID='$notes_row[SUBJECT_ID]'";
                $datax=mysqli_query($dbcon,$sqlx);
                $check=mysqli_fetch_array($datax);
                
                if($check['TEACHER_ID']==$teacher_row['TEACHER_ID'] || $check['TEACHER_ID2']==$teacher_row['TEACHER_ID'] ){
                    continue;
                }else{
                    $values[$j]=$notes_row['SUBJECT_ID'];
                    $j++;
                }
                
            }
            $old_subjects = array_values(array_unique($values));
            $total_subjects = count($old_subjects) + $sub_count;
        }

        //Lets store data in session
        $_SESSION["USER_ID"] = $userid;
        $_SESSION["TEACHER_ID"] = $teacher_row['TEACHER_ID'];

        // Get the current date
        $currentDay = date('l');    // e.g., "Monday"
        $currentDate = date('F j, Y');  // e.g., "October 11, 2024"

    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style21.css" type="text/css">
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
                <li><a href="#overview">Overview</a></li>
                <li><a href="#view-subjects">Current Subjects</a></li>
                <li><a href="#view-old-subjects">Old Subjects</a></li>
                <li><a href="#view-students">Students</a></li>
                <li><a href="#view-all-files">My files</a></li>
                <li><a href="#view-calendar">Calendar</a></li>
                
            </ul>
            <a href="logout.php" class="logout-btn">Logout</a>
            
        </aside>
        <main class="content">
            <!-- Content will be dynamically loaded here -->
            <div id="overview" class="tab-content">
                <header class="header">
                    <h1>Welcome, <?php echo $teacher_row['NAMEE']; ?> !</h1>
                </header>
                <div class="overview-cards">
                    <div class="card total-users">
                        <h3>Department</h3>
                        <p><?php echo $teacher_row['DEPARTMENT']; ?></p>
                    </div>
                    <div class="card learning-time">
                        <h3>Total Subjects</h3>
                        <p><?php echo $total_subjects; ?></p>
                    </div>
                    <div class="card total-contents">
                        <h3>Total Uploads</h3>
                        <p><?php echo $count; ?></p>
                    </div>
                </div>
                <div class="charts">
                    <div class="chart-container">
                        <!-- <div class="symbol">📅</div> -->
                            <!-- <div class="day"><?php echo $currentDay; ?></div> -->
                            <!-- <div class="date"><?php echo $currentDate; ?></div> -->
                        </div>
                    <div class="chart-container">
                        <canvas id="learningProgress"></canvas>
                    </div>
                </div>
            </div>

            <div id="view-subjects" class="tab-content">
              
                    <div class="panel-container">
                        <?php
                
                            for($i=0;$i<$sub_count;$i++){
                                
                                $sub_row=mysqli_fetch_array($subjects);
                                echo "<div class='panel'>
                                            <h3>".$sub_row['SUBJECT_NAME']."</h3>
                                            <div style='height: 20px; width: 100%;'></div>
                                            <a href='moduleList.php?id=".$sub_row['SUBJECT_ID']."&subject=".$sub_row['SUBJECT_NAME']."'>View Subject</a>
                                    </div>";
                            }
                    
                            

                        ?>
                    
                    </div>
                
            </div>
        
            <div id="view-old-subjects" class="tab-content">
                <div class="panel-container">
                    <?php
                        if(count($old_subjects)==0){
                            echo "<h3>No subjects found!</h3>";
                        }else{
                            for($i=0;$i<count($old_subjects);$i++){
                                $sql="SELECT * FROM subjects WHERE SUBJECT_ID='$old_subjects[$i]'";
                                $data=mysqli_query($dbcon,$sql);
                                if($data){
                                    $sub_row=mysqli_fetch_array($data);
                                    echo "<div class='panel'>
                                            <h3>".$sub_row['SUBJECT_NAME']."</h3>
                                            <div style='height: 20px; width: 100%;'></div>
                                            <a href='moduleList.php?id=".$sub_row['SUBJECT_ID']."&subject=".$sub_row['SUBJECT_NAME']."'>View Subject</a>
                                    </div>";
                                }
                            
                            }
                        }
                        
                
                        

                    ?>
                
                </div>
            </div>
            
            <div id="view-students" class="tab-content">
                <p>VIEW STUDENTS</p>
            </div>

            <div id="view-all-files" class="tab-content">
                <p>MY FILES</p>
            </div>
            <div id="view-calendar" class="tab-content">
                <p>CALENDAR</p>
            </div>

            
            <!-- Add more sections as needed -->
        </main>
    </div>
    <!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="script.js"></script> -->
</body>
</html>
