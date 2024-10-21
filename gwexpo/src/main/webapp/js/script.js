//서브메뉴
$('.nav > li').hover(
    function() {
        $(this).find('.sub').stop().css({
            display: 'flex',
            opacity: 0,
            marginTop: '-10px'
        }).animate({
            opacity: 1,
            marginTop: '0px'
        }, 300);
    },
    function() {
        $(this).find('.sub').stop().animate({
            opacity: 0,
            marginTop: '-10px'
        }, 200, function() {
            $(this).css('display', 'none');
        });
    }
);

// 사이트맵 모달
$('.side button').click(function(){
    $('.siteMap').toggleClass('active');
    $('body').toggleClass("no-scroll");
    
    // 모바일에서만 버튼 이미지 전환 (1024px 이하)
    if (window.matchMedia("(max-width: 1024px)").matches) {
        $(this).find('img').toggle();
    }
});

// PC 버전 닫기 버튼 (사이트맵 내부)
$('.siteMap > button.pc').click(function(){
    $('.siteMap').removeClass('active');
    $('body').removeClass("no-scroll");
    $('.side button').find('img:first-child').show().next().hide();
});

//탭
function moveSlider($clickedTab) {
    var leftOffset = $clickedTab.position().left;
    $('.tabNav .slider').css({
        'left': leftOffset + 'px',
        'width': $clickedTab.outerWidth() + 'px'
    });
}

moveSlider($('.tabNav li.active'));

$('.tabNav li').click(function() {
    var tab_id = $(this).index();

    $('.tabNav li').removeClass('active');
    $('.tabInner').removeClass('active').hide();

    $(this).addClass('active');
    $('.tabInner').eq(tab_id).addClass('active').fadeIn(500);

    // 슬라이더 이동
    moveSlider($(this));

    // 네비 움찔...
    $(this).css('transform', 'scale(0.95)');
    setTimeout(() => {
        $(this).css('transform', 'scale(1)');
    }, 200);
});
// const items = document.querySelectorAll('.projectLists li');
// let ticking = false;

// function checkScroll() {
//     const triggerBottom = window.innerHeight * 0.8;

//     items.forEach((item, index) => {
//         const itemTop = item.getBoundingClientRect().top;

//         if (itemTop < triggerBottom) {
//             if (!item.classList.contains('show')) {
//                 setTimeout(() => {
//                     item.classList.add('show');
//                 }, index * 50); // 딜레이를 50ms로 줄임
//             }
//         }
//     });

//     ticking = false;
// }

// function requestTick() {
//     if (!ticking) {
//         requestAnimationFrame(checkScroll);
//     }
//     ticking = true;
// }

// // 초기 체크
// requestTick();

// // 스크롤 이벤트에 requestTick 함수 연결
// window.addEventListener('scroll', requestTick, { passive: true });

// // 초기 체크
// checkScroll();

// // 스크롤 이벤트에 체크 함수 연결
// window.addEventListener('scroll', checkScroll);

// //헤더 스크롤
// $(window).scroll(function() {
//     if ($(this).scrollTop() > 150) {
//         $('header').addClass('active');
//     } else {
//         $('header').removeClass('active');
//     }
// });

// //모바일 메뉴
// $(".headerInner > button").click(function () {
//     $('.mbNavContainer').addClass("active");
//     $('body').addClass("no-scroll");
// })

// $('.mbNavContainer > button').click(function () {
//     $('.mbNavContainer').removeClass("active")
//     $('body').removeClass("no-scroll");
// })

// //헤더 스크롤
// $(window).scroll(function() {
//     if ($(this).scrollTop() > 150) {
//         $('.subContainer.pro, .subContainer.view').addClass('active');
//     } else {
//         $('.subContainer.pro, .subContainer.view').removeClass('active');
//     }
// });

// $('.cardLists li').click(function() {
//   // 클릭한 li가 이미 active 상태인지 확인
//   if ($(this).hasClass('active')) {
//       // 이미 active 상태라면 아무것도 하지 않음
//       return;
//   }
  
//   // 모든 li에서 active 클래스 제거
//   $('.cardLists li').removeClass('active');
  
//   // 클릭한 li에 active 클래스 추가
//   $(this).addClass('active');
  
//   // 모든 카드 내용 숨기기
//   $('.cardContents').hide();
  
//   // 선택된 카드의 내용만 표시
//   $(this).find('.cardContents').fadeIn(500);
// });

// // famDrop 버튼 클릭 시 active 클래스 토글
// $('.famDrop button').click(function(event) {
//     event.stopPropagation();
//     $(this).parent('.famDrop').toggleClass('active');
// });

// // famDrop 내부의 링크 클릭 시 드롭다운 닫기
// $('.famDrop .famLists a').click(function() {
//     $(this).closest('.famDrop').removeClass('active');
// });

// // 문서의 다른 부분 클릭 시 active 클래스 제거
// $(document).click(function(event) {
//     if (!$(event.target).closest('.famDrop').length) {
//         $('.famDrop').removeClass('active');
//     }
// });

// //탭
// const tabItem = document.querySelectorAll('.tabNav li');
// const tabInner = document.querySelectorAll('.tabInner');

// function activateTab(items, index) {
//     tabInner.forEach((inner) => {
//         inner.classList.remove('active');
//     });

//     items.forEach((item) => {
//         item.classList.remove('active');
//     });

//     items[index].classList.add('active');
//     tabInner[index].classList.add('active');
// }

// tabItem.forEach((tab, idx) => {
//     tab.addEventListener('click', function() {
//         activateTab(tabItem, idx);
//     });
// });


// 모바일 메뉴
// $('.headerInner button').click(function(){
//   $('.mbNavWrap').show();
// });
// $('.mbNavTop button').click(function(){
//   $('.mbNavWrap').hide();
// });




// 예약신청 모달 열기
// $('.bookingBtn button').click(function(){
//   $('.modal').show();
// });
// $('.modalWrapper button').click(function(){
//   $('.modal').hide();
// });
