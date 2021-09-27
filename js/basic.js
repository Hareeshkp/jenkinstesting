function datalistValidator(modelname) {
		var obj = $("#BasicUom").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
}


function datalistValidators(modelname) {
	var obj = $("#BasicUom").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
$(document).ready(function() {
		$('#fm1').submit(function() {
				var modelname = $("#basicuom").val();
				var existingModelName = $('h2').text();
				
				if (datalistValidator(modelname)) {
						return true;
				}
				else{
					alert(modelname + " is not a valid BasicUom");
					$("#basicuom").val(existingModelName).focus();
                    return false;

				}
				
		});
});