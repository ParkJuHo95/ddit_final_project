$(document).off('submit','#insertCerForm');
$(document).on('submit','#insertCerForm',function(event){
	event.preventDefault();
	var target = event.target;
	var url = `${cPath}${$(target).data("formLocation")}`;
	var method = target.method;
	var value = target['cerName']['value']
	var data = {
		value:value
	}
	submitAjax(url,method,data);
});