<?php
session_start();
include('../connect.php');
$a = $_POST['course'];
$b = $_POST['faculty'];
$d = $_POST['year'];
$e = $_POST['semester'];

// query
$sql = "INSERT INTO course (cname,cfaculty,cyear,csemeseter) VALUES (:a,:b,:d,:e)";
$q = $db->prepare($sql);
$q->execute(array(':a'=>$a,':b'=>$b,':d'=>$d,':e'=>$e));
header("location: add course.php");

?>
