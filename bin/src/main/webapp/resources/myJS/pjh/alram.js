$.ajax({
	 url : `${cPath}/user/alram`
	,method : 'get'
	,dataType :'json'
	,success : function(resp){
		let alramList = resp.alramList;
		console.log(alramList);
	}
	,error : function(err){
		console.log(err);
	}
})