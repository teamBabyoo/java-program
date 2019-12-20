/**
 * 세션스토리지에 방문기록 저장하기
 */
$(document).ready(function(){
	var out = sessionStorage.getItem('list');
	var list = JSON.parse(out);
	if ( list == null) list = [];
	var index = storeNo;
	var name = storeName;
	var str = index + '|'+ name
	
	for(let i = 0; i<list.length; i++){
		  if(str == list[i] ){
		  		list.splice(i,1);
		 	}
		  }
	if (index != "") {
		sessionStorage.removeItem("list");
		
		list.unshift(str);
		sessionStorage.setItem("list", JSON.stringify(list));
	}
	console.log(sessionStorage.getItem('list'));
})
