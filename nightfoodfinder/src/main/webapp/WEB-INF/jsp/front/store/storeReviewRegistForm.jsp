<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="상세페이지" />
</c:import>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="wrapper detail_wrap reviewRegist_wrap clearboth">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
	
		<div class="content clearboth">
	      <div id="commentplace">
	        <div class="commentwrap">
	          <ul class="clearboth">
	            <li class="float_l">
	              <span>수저가</span>에 대한 솔직한 리뷰를 써주세요.
	            </li>
	            <!--
	              <li id="btn_leave_rv" class="float_r">
	                <i class="fa fa-plus-circle" aria-hidden="true"></i>리뷰남기기
	              </li>
	              -->
	          </ul>
	
	          <div class="leave_rv user_rv">
	            <!-- <form name="reviewForm" id="reviewForm" onsubmit="return registReview()" method="POST" enctype="multipart/form-data"> -->
	            <form name="reviewForm" id="reviewForm" method="POST" enctype="multipart/form-data"
	              action="review_regist.do">
	              <ul class="clearboth">
	                <li>
	                  <ul class="clearboth">
	                    <li id="scopePannel" class="float_l">
	                      평점
	                      <a href="#" data-rscope=1>★</a>
	                      <a href="#" data-rscope=2>★</a>
	                      <a href="#" data-rscope=3>★</a>
	                      <a href="#" data-rscope=4>★</a>
	                      <a href="#" data-rscope=5>★</a>
	                    </li>
	                    <li class="float_r">
	                      <i class="fa fa-user-circle-o" aria-hidden="true"></i>${user.userEmail}
	                    </li>
	                  </ul>
	                </li>
	                <li>
	                  <textarea name="reviewContent" placeholder="매너있는 리뷰를 남겨주세요. "></textarea>
	                </li>
	                <li>
	                  <ul class="clearboth">
	                    <li class="float_l">
	                      <input id="input_file" type="file" name="attach" multiple="multiple" />
	                      <label for="input_file">+</label>
	                    </li>
	                    <!-- <li class="float_r"><button type="submit">등록</button></li> -->
	                    <li class="float_r"><input type="submit" />등록</li>
	                  </ul>
	                </li>
	              </ul>
	              <input type="hidden" id="nickName" />
	              <input type="hidden" name="storeScope" />
	              <input type="hidden" name="storeNo" value="${review.storeNo }" />
	              <input type="hidden" name="writerNo" value="7" />
	              <!-- <input type="hidden" name="recomment" value="" /> -->
	            </form>
	          </div>
	          <!-- sotreNo 받고
	                    content내용 보내기 -->
	        </div>
	      </div>
	    </div>
		
		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
<script>
let writerNo = 7;
/**
 * 댓글 등록
 * @returns
 */
function registReview() {
	let reviewContent = $('textarea[name="reviewContent"]').val();
	let form = $('#reviewForm')[0];
	let data = new FormData(form);
	console.log("나", data);
	$.ajax({
		type: "POST",
		enctype: "multipart/form-data",
		url: "review_regist.do",
		data: data,
		dataType: "json",
		cache: false,
        processData: false,
        contentType: false,
        success: function(data) {
        	alert('성공');
        },
        error: function(e) {
        	console.log("ERROR : ", e);
            alert("fail");
        }
	});
	return false;
};


/*
		// Get form
        var form = $('#fileUploadForm')[0];
 
        // Create an FormData object 
        var data = new FormData(form);
 
       // disabled the submit button
        $("#btnSubmit").prop("disabled", true);
 
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/document/upload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                alert("complete");
                $("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                alert("fail");
            }
        });
*/

/**
 * 리뷰 별점 전처리
 * @returns
 */
$('#scopePannel > a').click(function(e) {
	// 모든 별을 기본색상으로 초기설정
	$pchildren = $(e.target).parent().children();	
	$pchildren.css('color', '#7f7f7f');
	
	// 위로 튐 방지
	e.preventDefault();
	// storeScope --> n점 (n번째 별)
	storeScope = parseInt($(e.target).attr('data-rscope'));
	$('input[name="storeScope"]').val(storeScope); 
	console.log("현재별점: ", storeScope);
	// 현재 클릭한 별의 형제 요소의 길이만큼 반복문 돌리며 rscope값이 작을 경우 색상변경(e.target 포함)
	for (let i = 0; i < $(e.target).siblings().length; i++) {
		let $sibling = $(e.target).siblings().eq(i);
		console.log(i, "번째 siblings : ", $sibling.attr('data-rscope'));
		if (parseInt($sibling.attr('data-rscope')) <= storeScope){
			if ($sibling.attr('data-rscope') == '1') {
				$sibling.css('color', 'yellow');
			}
			console.log(i, "번째 적용됨 : ", $sibling.attr('data-rscope'));
			$(e.target).css('color', 'red');
			$sibling.css('color', 'red');
		}
	}
});
</script>
</body>
</html>
