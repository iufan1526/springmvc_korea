checkNull = function(obj, value, messaege){

	if(value == '' || value == null ){
			alert(value + messaege);
			obj.focus();
			return false;
	}else {
		return true;
	}
}

checkGander = function(obj, value, messaege){

	if(value == '0' || value == null ){
			alert(value + messaege);
			obj.focus();
			return false;
	}else {
		return true;
	}
}

checkAddress = function(obj, value, messaege){

	if(value == '0' || value == null ){
			alert(value + messaege);
			obj.focus();
			return false;
	}else {
		return true;
	}
}

checkPasswordCk = function(value1, value2, messaege){

	if(value1 == value2){
		return true;
	}else {
		alert(messaege);
		obj.focus();
		return false;
	}
}

checkValue = function(value1,messaege){

	if(value == '0' || value == null){
		alert(messaege);
			obj.focus();
			return false;
	}else {
		return true;
	}
}



//정규식 

checkId = function(obj, value, message) {
    var regExp = /^[A-Za-z0-9,_-]{2,20}$/;
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}

checkPassword = function(obj, value, message) {
	var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*]).{8,20}$/;
    /*var regExp = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$/;*/
    if(regExp.test(value)) {
		return true;
	} else {
		alert(message);
        obj.focus();
		return false;
	}
}

checkEmail = function(obj, value, message) {
    var regExp = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		return false;
	}
}

checkMobile = function(obj, value, message) {
    var regExp = /^\d{3}\d{3,4}\d{4}$/;
    if(regExp.test(value)) {
    	return true;
    } else {
		alert(message);
		obj.focus();
		return false;
	}
}


