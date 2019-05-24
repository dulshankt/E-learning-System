<script src="jeffartagame.js" type="text/javascript" charset="utf-8"></script>
<script src="js/application.js" type="text/javascript" charset="utf-8"></script>
<link href="../style.css" media="screen" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.7.1.min.js"> </script>
<form action="savesprovide.php" method="post">
<center><h4><i class="icon-plus-sign icon-large"></i> Add Stock Report</h4></center>
<hr>
<div id="ac">
<span>Course Name : </span><input type="text" style="height:30px; width:265px;" name="address" placeholder="Note"></textarea><br>
<div style="float:right; margin-right:10px;">
<button class="btn btn-success btn-block btn-large" style="width:267px;"><i class="icon icon-save icon-large"></i> Save</button>
</div>
</div>

<script>
$("#food_name").change(function(){
	if($(this).val()!="Select a Food"){
	$("#suplier_address").val($(this).val());
	}
	else{
		$("#suplier_address").val("Please Select a Food to get the Price");
	}
});
</script>

</form>
