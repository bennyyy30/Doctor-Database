<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DocOffice</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet" />
    <link href="./style.css" rel="stylesheet" />
</head>

<body>
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
        <div class="tool"></div><span class="DocOffice"><a href="index.php"
            style="color: #fff; text-decoration: none;">DocOffice</a></span>
    </div>

    <center>

    <?PHP
      $link = mysqli_connect('127.0.0.1', 'root', 'Coconutty!777');

      if (!$link) {
        die("Cannot find added list of patients! " . mysqli_error());
      }
      else {
        echo "Here are all the pateints who were added! <br>";
      }

      $dbName = "DocOffice";
      mysqli_select_db($link, $dbName) or die("Unable to select database $dbName");

      $a = readline('Enter first NAME');

      $sql = "INSERT INTO PATIENT(`PatientID`, `PhoneNumber`, `DOB`, `PersonID`)
              VALUES ('868686', $a, 2001-05-16, '431431')";

      $sql2 = "SELECT * FROM PATIENT";

      $result = mysqli_query($link, $sql2);
      //$row = mysqli_fetch_row($result);

      print "<pre>";
      print "<table border=1>";
      print "<tr><td>Patient ID </td><td> Phone Number </td><td> DOB </td><td> PersonID </td>";

      while ($row = mysqli_fetch_array($result, MYSQLI_BOTH)) {
        print "\n";
        print "<tr><td>$row[PatientID] </td><td> $row[PhoneNumber]  </td><td> $row[DOB]  </td><td> $row[PersonID]  </td></tr>";
      }
 
      print "</table>";
      print "</pre>";
  
      mysqli_free_result($result);
      mysqli_close($link);
    ?>

    </center>

</body>
</html>