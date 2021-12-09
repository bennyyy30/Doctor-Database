<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appointment</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link href="./style.css" rel="stylesheet" />
</head>

<body>
    <!--Form-->
    <form class="myForm" method="get" enctype="application/x-www-form-urlencoded"
        action="/html/codes/html_form_handler.cfm">
        <p>
            <label>Name
                <input type="text" name="customer_name" required>
            </label>
        </p>

        <p>
            <label>Phone
                <input type="tel" name="phone_number">
            </label>
        </p>

        <p>
            <label>SSN
                <input type="ssn" name="ss_number">
            </label>
        </p>

        <fieldset>
            <legend>Which doctor do you want to see?</legend>
            <p><label> <input type="radio" name="Robert" required value="cardiologist"> Robert Stevens </label></p>
            <p><label> <input type="radio" name="Jane" required value="dentist"> Jane Goodall </label></p>
            <p><label> <input type="radio" name="Doyoung" required value="doctor"> Doyoung Kim </label></p>
        </fieldset>

        <fieldset>
            <legend>Which speciality are you looking for?</legend>
            <p><label> <input type="radio" name="Family Medicine" required value="Bob"> Family Medicine </label></p>
            <p><label> <input type="radio" name="N/A" required value="Fred"> N/A </label></p>
            <p><label> <input type="radio" name="Pediatrics" required value="Luigi"> Pediatrics </label></p>
        </fieldset>
        <p>
            <label>Appointment Date/Time
                <input type="datetime-local" name="pickup_time" required>
            </label>
        </p>

        <p>
            <label>Message
                <textarea name="message" maxlength="500"></textarea>
            </label>
        </p>

        <p><button>Make Appointment</button></p>
        </div>

        <!--Nav Bar-->
        <div class=home>
        </div>
        <div class=navMenuLayout>
            <div class=navDoctorLayout><span class="navDoctorDesign"><a href="./doctor.php"
                        style="color: #fff; text-decoration: none;">Doctors</a></span></div>
            <div class=navPatientsLayout><span class="navPatientsDesign"><a href="./patients.php"
                        style="color: #fff; text-decoration: none;">Patients</a></span></div>
            <div class=navAddPatientsLayout><span class="navAddPatientsDesign"><a href="./addpatients.php"
                        style="color: #fff; text-decoration: none;">+ Patients</a></span></div>
            <div class=navAddPharmacyLayout><span class="navAddPharmacyDesign"><a href="./pharmacy.php"
                        style="color: #fff; text-decoration: none;">Pharmacy</a></span></div>
            <div class=topAppointmentButtonLayout>
                <div class=topAppointmentButtonDesign><span class="topAppointmentButton"><a href="./appointment.php"
                            style="color: #fff; text-decoration: none;">APPOINTMENT</a></span></div>
            </div>
        </div>
        <!--<div class="tool"></div><span class="DocOffice"><a href="index.php"
            style="color: #fff; text-decoration: none;">DocOffice</a></span>
        </div-->
        
        <center>

        <?PHP
          $link = mysqli_connect('127.0.0.1', 'root', 'Coconutty!777');

          if (!$link) {
            die("Connection failed! " . mysqli_error());
          }
          else {
           echo "Connection Successful! <br>";
          }

          $dbName = "DocOffice";
          mysqli_select_db($link, $dbName) or die("Unable to select database $dbName");

          $sql = "INSERT INTO DOCTOR (`DoctorID`, `FirstName`, `LastName`, `MedicalDegrees`, `PersonID`)
                  VALUES ('9876', 'kanika', 'sood', 'Doctor of CS', '212349')";

          $sql2 = "SELECT * FROM DOCTOR "

          $insert mysqli_query($link, $sql);
          $result1 = mysqli_query($link, $sql2);
          //$row = mysqli_fetch_row($result1);

          print "<pre>";
          print "<table border=1>";
          print "<tr><td>Doctor ID </td><td> First Name </td><td> Last Name </td><td> Medical Degrees </td><td> Person ID </td>";

          while ($row = mysqli_fetch_array($result1, MYSQLI_BOTH)) {
            print "\n";
            print "<tr><td>$row[DoctorID] </td><td> $row[FirstName]  </td><td> $row[LastName]  </td><td> $row[MedicalDegrees]  </td><td> $row[PersonID]  </td></tr>";
          }

          print "</table>";
          print "</pre>";
  
          mysqli_free_result($result);
          mysqli_close($link);
        ?>

        </center>

</body>
</html>