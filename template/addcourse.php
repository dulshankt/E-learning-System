<script src="jeffartagame.js" type="text/javascript" charset="utf-8"></script>
<script src="js/application.js" type="text/javascript" charset="utf-8"></script>
<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js"> </script>
<form action="addnew.php" method="post">
<center><h4><i class="icon-plus-sign icon-large"></i> Add  New Course</h4></center>
<hr>
<div id="ac">
<span>Course Name : </span><select name="course" style="width:265px; height:30px; margin-left:-5px;" >
	<?php
	include('../connect.php');
	$result = $db->prepare("SELECT * FROM course");
		$result->bindParam(':userid', $res);
		$result->execute();
		for($i=0;$row = $result->fetch(); $i++){
	?>
		<option><?php echo $row['cname']; ?></option>
		

	<?php
	}
	?>
	</select><br>
<span>Lecture : </span><input type="file"  name="faculty" placeholder="Lecture" style="width:265px; height:30px; margin-left:-5px;" >
<span>Tute : </span><input type="file"  name="year" placeholder="Tute" style="width:265px; height:30px; margin-left:-5px;" >
<span>Lab : </span><input type="file"  name="semester" placeholder="Lab" style="width:265px; height:30px; margin-left:-5px;" >
<span>Note : </span><input type="text"  name="note" placeholder="Note" style="width:265px; height:30px; margin-left:-5px;" >
<div style="float:right; margin-right:10px;">
<button class="btn btn-success btn-block btn-large" style="width:267px;"><i class="icon icon-save icon-large"></i> Save</button>
</div>
</div>
    
    
</form>

