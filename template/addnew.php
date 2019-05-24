<?php
session_start();
include('../connect.php');
$a = $_POST['course'];
$b = $_POST['faculty'];
$d = $_POST['year'];
$e = $_POST['semester'];
$f = $_POST['note'];

// query
$sql = "INSERT INTO course (cname,clecture,ctute,clab,cnote) VALUES (:a,:b,:d,:e,:f)";
$q = $db->prepare($sql);
$q->execute(array(':a'=>$a,':b'=>$b,':d'=>$d,':e'=>$e,':f'=>$f));
header("location: add.php");

?>