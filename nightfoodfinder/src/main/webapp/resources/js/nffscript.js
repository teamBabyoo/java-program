$(document).ready(function() {
    let $height1;           // option탭 높이
    // header 높이
    let $height_header = $('header').height();
    // content영역 높이
    let $height_content = $('.content').height();

    // footer 위치
    // ↙ 문서가 로딩된 후에 변경된 내용은 반영이 안 될수도 있음
//    $('footer').css('top', $height_header + $height_content);



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

        $('.bgbox.active').click((e) => {
            $('.search').removeClass('focusIn');
            $('.search').css('height', 60);
//            console.log("포커스 나갔음");
            $('.optionBox').addClass('hidden').removeClass('active');
            $('.bgbox').removeClass('active');
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
        $('.bgbox.active').click((e) => {
            $('.bgbox').removeClass('active');
            $('#person_btn .pop_person').addClass('hidden');
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
        $('.sharePop.hidden').removeClass('hidden');
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
});