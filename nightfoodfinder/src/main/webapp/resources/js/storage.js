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
		//console.log(i,"번째 : ",list[i]);
		  if(str == list[i] ){
		  		list.splice(i,1);
		  		console.log("splice::::");
		 	}
		  }
	if (index != "") {
		sessionStorage.removeItem("list");
		
		list.unshift(str);
		sessionStorage.setItem("list", JSON.stringify(list));
	}
	console.log(sessionStorage.getItem('list'));
})


/*
//최근본 아이템 삭제 기간
var LATELY_VIEW_ITEM_EXPIRATION_DATE = 1;
//최근본 아이템 최대 저장 개수
var LATELY_VIEW_ITEM_MAX_SAVE_COUNT = 10;
//최근본 아이템 페이징 사이즈
var LATELY_VIEW_ITEM_PAGEING_SIZE = 5;

function isNull(obj){
	if(obj == '' || obj == null || obj == undefined || obj == NaN){ 
		return true;
	}else{
		return false;
	}
}

function setSessionStorage(name,obj){
	sessionStorage.setItem(name, obj);
}

function removeSessionStorage(name){
	sessionStorage.removeItem(name);
}

function getItemSessionStorage(name){
	return sessionStorage.getItem(name);
}



function initLatelyViewItemList(){
	//로컬스토리지에서 latelyViewItemList 로 저장된 정보가 있는지 확인후
	if(isNull(getItemSessionStorage('latelyViewItemList'))){
		
		//없을경우 공간 생성
		setSessionStorage('latelyViewItemList',null);
		
		//상품을 표시할 ul에 없을경우 화면 표시
		$("#history_box").append('<li>최근 본<br>페이지가<br>없습니다.</li>');
		//기존 정보가 있을 경우
	}else{
		var latelyViewItemListJson =getItemSessionStorage('latelyViewItemList');
		
		var list = JSON.parse(latelyViewItemListJson);
		if ( list == null) list = [];
		var index = storeNo;
		var storeName = storeName;
		var str = index + '|'+ storeName
		if (index != "") {
			list.unshift(str);
			sessionStorage.setItem("list", JSON.stringify(list));
		}
		
		
	}
}

$(document).ready(function(){
	
	initLatelyViewItemList();
	console.log(sessionStorage.getItem('latelyViewItemList'));
})
*/