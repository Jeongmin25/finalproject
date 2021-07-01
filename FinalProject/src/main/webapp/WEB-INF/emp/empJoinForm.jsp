<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
$(function(){
	$("#btncheck").click(function(){
		//email 읽기
		var email=$("#email").val();
		$.ajax({
			type:"get",
			url:"emailcheck",
			dataType:"json",
			data:{"email":email},
			success:function(data){
				if(data.count==1){
					alert("이미 가입된 이메일입니다\n다시 입력해주세요");
					$("#email").val("");
					$("#email").focus();
				}else{
					alert("가입이 가능한 이메일입니다");
				}
					
			}
		})
	});
});
</script>
</head>
<body>
<div class="main-container">
	<section class="intro-ment1-section-wrap">
		<h2>관리자 계정 만들기</h2>
	</section>
		<input type="text" name="managername" placeholder="담당자성함"/>
			<br/><br/>
			<input type="text" name="team" placeholder="직책(or팀)"/>
			<br/><br/>
			<input type="text" name="hp" placeholder="연락처"/>
			<br/><br/>
			<input type="email" name="email" placeholder="회사이메일(로그인 아이디로 사용됩니다)"/> 
			<button type="button" class="btn btn-default" id="btncheck" style="height: 30px;">중복체크</button> 
			<br/><br/>
			<input type="password" name="password" placeholder="6자리 이상 비밀번호"/> 
			<br/><br/>
	<hr>
	
	<section class="intro-ment2-section-wrap">
		<h3 color="#333333" class="intro-ment">회사 정보를 등록해주세요</h3>
		<h5 color="#757575" class="intro-ment">+JOB은 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 
		다음 정보를 리뷰하여 회사등록을 승인하고 있습니다.</h5>
	</section>
	<br/><br/>
		<section class="login-input-section-wrap">
		<form action="insert" method="POST">
		
			<div class="join-input-wrap empname-wrap">	
				회사이름*<br/>
					<input type="text" name="empname" placeholder="회사명" style="width: 600px; height: 30px;"/>
			</div> 
			
			<div class="join-input-wrap country-wrap">
				국가*<br/>
				<select name="country" id="country" class="form-inline" style="width: 200px; height: 30px;">
					<option value="kr">한국</option>
					<option value="tw">대만</option>
					<option value="sg">싱가폴</option>
					<option value="jp">일본</option>
					<option value="others">기타</option>
				</select>
			</div>
			
			<div direction="left" class="join-input-wrap area-wrap">
			지역*<br/>
				<select name="area" id="area" class="form-inline" style="width: 200px; height: 30px;">
	                 <option value='seoul'>서울</option>
	                 <option value='busan'>부산</option>
	                 <option value='daegu'>대구</option>
	                 <option value='incheon'>인천</option>
	                 <option value='gwangju'>광주</option>
	                 <option value='daejeon'>대전</option>
	                 <option value='ulsan'>울산</option>
	                 <option value='gyeonggi'>경기</option>
	                 <option value='gangwon'>강원</option>
	                 <option value='n-chungcheong'>충북</option>
	                 <option value='s-chungcheong'>충남</option>
	                 <option value='n-jeolla'>전남</option>
	                 <option value='s-jeolla'>전남</option>
	                 <option value='n-gyeongsang'>경북</option>
	                 <option value='s-gyeongsang'>경남</option>
	                 <option value='jeju'>제주</option>
				</select>
			</div>
			
			<div class="join-input-wrap addr-wrap">	
				대표 주소*<br/>
					<input type="text" name="addr" placeholder="대표 주소" style="width: 600px; height: 30px;"/>
			</div> 
			
			<div class="join-input-wrap empserial-wrap">	
				사업자등록번호*<br/>
					<input type="text" name="empserial" placeholder="사업자등록번호" style="width: 600px; height: 30px;"/>
			</div> 
			
			<div direction="left" class="join-input-wrap biztype-wrap">
				산업군*<br/>
				<select name="biztype" id="biztype" class="form-inline" style="width: 200px; height: 30px;">
					<option value="disabled">산업군</option>
					<option value="9927">IT,컨텐츠</option>
					<option value="9924">판매, 유통</option>
					<option value="9920">제조</option>
					<option value="9933">교육</option>
					<option value="9928">금융</option>
					<option value="9930">전문, 과학기술</option>
					<option value="9935">예술, 스포츠, 여가</option>
					<option value="9931">사업지원</option>
					<option value="9925">물류,운송</option>
					<option value="9929">부동산</option>
					<option value="9923">건설</option>
					<option value="9934">보건, 사회복지</option>
					<option value="9926">숙박, 음식점</option>
					<option value="9919">광업</option>
					<option value="9922">상수도,환경</option>
					<option value="9932">공공행정, 국방</option>
					<option value="9921">전기, 가스</option>
					<option value="9918">농림,어업</option>
					<option value="9937">가사, 가정</option>
					<option value="9938">국제,외국기관</option>
				</select>
			</div>
			
			<div class="join-input-wrap staffnum-wrap">	
				직원수*<small>(승인기준 : 팀원 10명 이상)</small><br/>
				<select name="staffnum" id="staffnum" class="form-inline" style="width: 200px; height: 30px;">
					<option value="disabled">회사규모</option>
					<option value="1~4">1~4명</option>
					<option value="5~10">5~10명</option>
					<option value="11~50">11~50명</option>
					<option value="51~200">51~200명</option>
					<option value="201~500">201~500명</option>
					<option value="501~1000">501~1000명</option>
					<option value="1001~5000">1001~5000명</option>
					<option value="5001~10000">5001~10000명</option>
					<option value="10001~">10001명 이상</option>
				</select>
			</div>
			
			<div class="join-input-wrap establishyear-wrap">	
				설립연도*<br/>
				<input type="text" name="establishyear" placeholder="ex)2012년" style="width: 600px; height: 30px;"/>
			</div> 
			
			<div class="join-input-wrap keyword-wrap">	
				뉴스검색키워드*<small>(키워드는 최대3개까지 입력가능합니다)</small><br/>
				<input type="text" name="keyword" placeholder="서비스명 혹은 브랜드명 입력(텍스트만 입력가능합니다.)" style="width: 600px; height: 30px;"/>
			</div> 
			
			
		
			<button type="submit" class="btn btn-default" style="width: 150px;">관리자 계정 생성</button>
			<br/><br/>
			<b>회원가입시 개인정보 처리방침을 읽었으며, 이용약관에 동의하신 것으로 간주합니다.</b>
			<hr>
			<a href="/empLogin">이미 가입되어 있으신가요? 로그인하기</a>
		</form>
		</section>
</div>
<br>
</body>
</html>