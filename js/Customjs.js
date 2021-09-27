function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function isNumberKeyVal(evt, id) {
    try {
        var charCode = (evt.which) ? evt.which : event.keyCode;

        if (charCode == 46) {
            var txt = document.getElementById(id).value;
            if (!(txt.indexOf(".") > -1)) {

                return true;
            }
        }
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    } catch (w) {
        alert(w);
    }
}