$(document).ready(function() {
    let $height1;           // option탭 높이
    // header 높이
    let $height_header = $('header').height();
    // content영역 높이
    let $height_content = $('.content').height();
    // wrapper 영역 높이
    let $height_wrapper = $('.wrapper').width();
//    console.log("$height_wrapperㅋ", $height_wrapper);

    $('footer').css('bottom', $height_content);
    
    // footer 위치
    // ↙ 문서가 로딩된 후에 변경된 내용은 반영이 안 될수도 있음
    $(document).on('change', function() {
        $('footer').css('bottom', -($height_wrapper));   
        
     })



    // 옵션탭이 활성화되면 .search의 height값을 동적으로 처리
    $('.search *').click((e) => function() {
        $height1 = $('.optionBox.active').height();
        $('.search.focusIn').css('height', 58 + $height);
    });

    // 검색 input창에 포커스가 들어오면 불투명배경을 올리고 검색 탭을 활성화
    $('.search > form > input').focus((e) => {
//        console.log("포커스 들어옴");
        $('.bgbox').addClass('active');
        $('.search').addClass('focusIn');
//        $('.search.focusIn').css('height', 58);
        $('.optionBox').removeClass('hidden').addClass('active');
        // 스크롤 막기
        $('.wrapper').on('scroll touchmove mousewheel', function(e) {
        	e.preventDefault();
        	e.stopPropagation();
        	return false;
        });

        $('.bgbox.active').click((e) => {
            $('.search').removeClass('focusIn');
            $('.search').css('height', 60);
//            console.log("포커스 나갔음");
            $('.optionBox').addClass('hidden').removeClass('active');
            $('.bgbox').removeClass('active');
            // 스크롤 다시 허용
            $('.wrapper').off('scroll touchmove mousewheel');
        })
    });

    // 조건 탭 이동
    $('.optionTab > li').click((e) => {
        $('.optionTab > li').removeClass('on');
        e.target.classList.add('on');

        if ($('.optionTab > li:nth-child(1)').attr('class') == 'on') {
            $('.select').addClass('hidden');
            $('.tab_1').removeClass('hidden');
        }
        if ($('.optionTab > li:nth-child(2)').attr('class') == 'on') {
            $('.select').addClass('hidden');
            $('.tab_2').removeClass('hidden');
        }
        if ($('.optionTab > li:nth-child(3)').attr('class') == 'on') {
            $('.select').addClass('hidden');
            $('.tab_3').removeClass('hidden');
        }
    });
    
    // 로그인 띄우기, 알림팝업 띄우기
    $('#person_btn').click((e) => {
        $('.bgbox').addClass('active');
        $('#person_btn .pop_person.hidden').removeClass('hidden');
        // 스크롤 막기
        $('.wrapper').on('scroll touchmove mousewheel', function(e) {
        	e.preventDefault();
        	e.stopPropagation();
        	return false;
        });
        
        $('.bgbox.active').click((e) => {
            $('.bgbox').removeClass('active');
            $('#person_btn .pop_person').addClass('hidden');
            // 스크롤 다시 허용
            $('.wrapper').off('scroll touchmove mousewheel');
        })
    });
    
    $('#notice_btn').click((e) => {
        $('.bgbox').addClass('active');
        $('#notice_btn .notice_list_box.hidden').removeClass('hidden');
        
        $('.bgbox.active').click((e) => {
            $('.bgbox').removeClass('active');
            $('#notice_btn .notice_list_box').addClass('hidden');
        })
    });
    // 상세페이지 공유탭 클릭
    $('.tab_share').click((e) => {
    	// offset().left, offset().top
    	popX = $(e.target).offset().left;
    	popY = $(e.target).offset().top;
    	$('.sharePop.hidden').css({
    		'top': popY,
    		'left': popX
    	});
        $('.sharePop.hidden').removeClass('hidden');
        $('.sharePop').addClass('act');
        
    });
    
    $('#closesnspop').click(() => {
    	$('.sharePop.act').removeClass('act');
    	$('.sharePop').addClass('hidden');
//        	alert('z');
    });
    
    // btnTop
    var btn = $('#btnTop');

    $(window).scroll(function() {
      if ($(window).scrollTop() > 300) {
        btn.addClass('show');
      } else {
        btn.removeClass('show');
      }
    });

    btn.on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({scrollTop:0}, '300');
    });
    // --------- btnTop 끝
    
    // award가게 단골등록
    $(".addFreq").click((e) => {
    	let $i = $(e.target)
    	let userNo = $i.data("userno");
    	let storeNo = $i.data("storeno");
    	e.preventDefault();
    	let isReg = confirm("단골 가게로 등록하시겠습니까?");
    	if (isReg) {
    		$.getJSON({
    			url: "/nightfoodfinder/front/store/frequent_check.do",
    			data: {storeNo, userNo},
    			success: (result) => {
    				alert(result);
    				let url = "/nightfoodfinder/front/store/frequent_regist.do";
    				let msg = "단골가게로 등록되었습니다"
    				if(result === 1){
    					url = "/nightfoodfinder/front/store/frequent_delete.do"
    						msg = "단골이 취소되었습니다"
    					
    				}
    				$.getJSON({
    					url: url,
    					data: {storeNo, userNo},
    					success: (list) => {
    						alert(msg);
    					},
    					error: function(e) {
    					} 
    				});
    					
    			}
    		});
    	} 
    	
    })
});