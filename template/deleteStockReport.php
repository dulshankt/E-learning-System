<?php
	include('../connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("DELETE FROM student WHERE studentid= :memid");
	$result->bindParam(':memid', $id);
	$result->execute();
?>