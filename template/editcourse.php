<?php
	include('../connect.php');
	$id=$_GET['id'];
	$result = $db->prepare("SELECT * FROM course WHERE courseid= :userid");
	$result->bindParam(':userid', $id);
	$result->execute();
	for($i=0; $row = $result->fetch(); $i++){
?>
<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
<form action="saveeditcourse.php" method="post">
<center><h4><i class="icon-edit icon-large"></i> Edit course </h4></center><hr>
<div id="ac">
<input type="hidden" name="memi" value="<?php echo $id; ?>" />
<span>Course Name : </span><input type="text" style="width:265px; height:30px;" name="name" value="<?php echo $row['cname']; ?>"  required /><br>
<span>Faculty : </span><input type="text" style="width:265px; height:30px;" name="cperson" value="<?php echo $row['cfaculty']; ?>"  required /><br>
<span>Year : </span><input type="text" style="width:265px; height:30px;" name="address" value="<?php echo $row['cyear']; ?>"  required /><br>
<span>Semester : </span><input type="text" style="width:265px; height:30px;" name="contact" value="<?php echo $row['csemeseter']; ?>" required /><br>
<div style="float:right; margin-right:10px;">

<button class="btn btn-success btn-block btn-large" style="width:267px;"><i class="icon icon-save icon-large"></i> Add </button>
</div>
</div>
</form>
<?php
}
?>