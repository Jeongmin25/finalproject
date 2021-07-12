<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<style type="text/css">
#footer{
   border-top:1px solid #ccc;
   display: flex;
}

.footerlist>li {
    list-style: none;
    float: left;
    margin-right: 20px;
}

ul.footerlist {
    padding-left: 0px;
}
a:hover{
	cursor:pointer;
	color: #021B80;
    text-decoration: none;
}
a{
	color:gray;
}

ul.footerlist>li>a.link
	margin-top: 30px;

}

.foo_div1{
	flex-direction: column;
	width: 80%;
}

.foo_div2{
	flex-direction: column;
}
</style>
</head>
<body>

<div id="footer" style="opacity: 2;">

	<div class="logo">
	<img src="../img/logo_letter.png">
	</div>

	<div class=foo_div1 style="">
		<ul class="footerlist">
			<li><a class="link" href="">기업소개</a></li>
			<li><a class="link" href="" onclick="">이용약관</a></li>
			<li><a class="link" href="" target="">개인정보처리방침</a></li>
			<li><a class="link" href="">고객센터</a></li>
		</ul>
	</div>

<br/><br/>


	<div class="foo_div2">
		<p>(주)원티드랩 (대표이사:이복기) | 서울특별시 송파구 올림픽로 300 롯데월드타워 35층 | 통신판매번호 : 2020-서울송파-3147
		<br/>
		유료직업소개사업등록번호 : (국내) 제2020-3230259-14-5-00018호 | (국외) 서울동부-유-2020-2 | 사업자등록번호 : 299-86-00021 | 02-539-7118
		<br/>
		© Wantedlab, Inc.
		</p>
	
	</div>

</div>

<!-- <ul class="footerlist">
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt=" 인스타그램 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt=" 페이스북 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt=" 네이버블로그 바로가기"></a>
</li>
<li>
<a href="" class="link_sns" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="  "></a>
</li>
<li>
<a href="" class="link_sns lst" target="_blank"><img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="  "></a>
</li>
</ul>
</div> -->

<!-- <div class="footer_cc">

	<div class="cc_view cc_call">
	<dl class="list">
	<dt>고객센터 운영시간</dt>
	<dd>당신이 잠들때</dd>
	</dl>
	</div>


주소 : 서울시 백암빌딩 501호 <span class="bar">I</span> 팀장 : 윤준수 <span class="bar">I</span> 
이메일 : <a href="bitcamp@bitcamp.com" class="link">help@bitcamp.com</a> -->


</body>
</html>