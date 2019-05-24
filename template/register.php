<?php
session_start();
include('../connect.php');
$a = $_POST['name'];
$b = $_POST['address'];
$d = $_POST['memno'];
$e = $_POST['prod_name'];
$f = $_POST['note'];
$g = $_POST['date'];
// query
$sql = "INSERT INTO student (sname,sno,semail,sfaculty,sbirthday,birth) VALUES (:a,:b,:d,:e,:f,:g)";
$q = $db->prepare($sql);
$q->execute(array(':a'=>$a,':b'=>$b,':d'=>$d,':e'=>$e,':f'=>$f,':g'=>$g));
header("location: index1.php");


?>