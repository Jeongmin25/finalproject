<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<style type="text/css">
/* 	
.container_tag{
		flex-direction: row;
	}

.container_area{
		flex-direction: row;
		/* 기본값, 아이템을 왼쪽에서 오른쪽으로 수평 정렬함 */
	} 
	
.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
} 
 */

</style>

</head>
<body>
<h2>전체 > </h2>
<hr>
<div class="container_tag">
  <!-- Trigger the modal with a button -->
  <!-- 구동하고자 하는 버튼이나 링크에 data-toggle="modal"을 부여하면 modal을 띄울 준비가 되고 
  data-target="DOM선택자"를 입력하면 지정된 내용을 modal로 띄울 수 있다.-->
  <button type="button" class="btn btn-default btn-ms" data-toggle="modal" data-target="#myModal_tag">
  	<span class="tag">태그</span>
  	<span class="tag_info" style="color: #021B80"><b>업계연봉수준</b></span>
  	<span class="tag_arrow">▼</span>
  </button>
  &nbsp;
  <button type="button" class="btn btn-default btn-ms" data-toggle="modal" data-target="#myModal_area">
  	<span class="tag">지역</span>
  	<span class="tag_info" style="color: #021B80"><b>전국</b></span>
  	<span class="tag_arrow">▼</span>
  </button>
  &nbsp;
  <button type="button" class="btn btn-default btn-ms" data-toggle="modal" data-target="#myModal_career">
  	<span class="tag">경력</span>
  	<span class="tag_info" style="color: #021B80"><b>전체</b></span>
  	<span class="tag_arrow">▼</span>
  </button> 
  
 <br/><br/>
 <!-- 북마크  -->
 <div class="bookmark-button">
		<button data-attribute-id="explore__bookmarkPage__click" type="button" style="background-color: white; border: none;">
		<svg width="13" height="17" viewBox="0 0 13 17" style="color:#36f"><defs>
		<path id="bookmarkIconFill" d="M6.25 13.21L.905 16.22c-.403.228-.905-.06-.905-.517V.596C0 .267.27 0 .605 0h11.29c.334 0 .605.267.605.596v15.107c0 .458-.502.745-.905.518L6.25 13.209z">
		</path></defs>
		<g fill="none" fill-rule="evenodd" transform="translate(.188)">
		<use fill="currentColor" xlink:href="#bookmarkIconFill"></use></g></svg>
		<span>북마크 모아보기</span><svg width="12" height="12" viewBox="0 0 12 12">
		<path fill="currentColor" d="M4.22 9.72a.75.75 0 001.06 1.06l4.25-4.25a.75.75 0 000-1.06L5.28 1.22a.75.75 0 00-1.06 1.06L7.94 6 4.22 9.72z">
		</path></svg></button>
 </div>
 
<!-- 태그 Modal -->
  <div class="modal fade" id="myModal_tag" tabindex="-1" role="dialog" aria-labelledby="myModal_80tagLabel">
    <div class="modal-dialog madal-fullsize" role="document">
    
      <!-- Modal content-->
      <div class="modal-content madal-fullsize">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align: center;">태그</h4>
          <br/>
          <b>기업의 특별한 복지, 혜택 등 태그를 선택하여</b><br/>
          <b>나에게 꼭 맞는 포지션을 찾아보세요!</b>
        </div>
        <div class="modal-body">
          <h4>1. 카테고리 선택</h4>
          	<ul>
          		<li class="select-category">
		          	<button class="btn_salary" style="width:120px; height:40px; padding:5px; background: rgb(246, 246, 246); border: none; border-radius: 50px;">업계연봉수준</button>
		          	<button class="btn_reward" style="width:120px; height:40px; padding:5px; background: rgb(236, 241, 241); border: none; border-radius: 50px;">보상</button>  	
		          	<button class="btn_companyculture" style="width:120px; height:40px; padding:5px; background: rgb(234, 237, 244); border: none; border-radius: 50px;">기업문화</button>
		          	<button class="btn_meal" style="width:120px; height:40px; padding:5px; background: rgb(233, 231, 238); border: none; border-radius: 50px;">식사·간식</button>
		          	<button class="btn_commute" style="width:120px; height:40px; padding:5px; background: rgb(233, 244, 251); border: none; border-radius: 50px;">출퇴근</button>
		          	<button class="btn_etc" style="width:120px; height:40px; padding:5px; background: rgb(238, 245, 246); border: none; border-radius: 50px;">기타</button>
		          <!-- 	<button class="btn_staffgrowth" style="width:120px; height:40px; padding:5px; background: rgb(238, 237, 244); border: none; border-radius: 50px;">인원성장률</button>
		          	<button class="btn_resign" style="width:120px; height:40px; padding:5px; background: rgb(232, 237, 243); border: none; border-radius: 50px;">퇴사율</button>
		          	<button class="btn_staffnum" style="width:120px; height:40px; padding:5px; background: rgb(233, 244, 251); border: none; border-radius: 50px;">인원수</button>
		          	<button class="btn_history" style="width:120px; height:40px; padding:5px; background: rgb(239, 251, 243); border: none; border-radius: 50px;">업력</button>
		      		<button class="btn_vacation" style="width:120px; height:40px; padding:5px; background: rgb(240, 249, 245); border: none; border-radius: 50px;">근무·휴가</button> 
		          	<button class="btn_convention" style="width:120px; height:40px; padding:5px; background: rgb(232, 237, 243); border: none; border-radius: 50px;">편의시설</button>
		          	<button class="btn_family" style="width:120px; height:40px; padding:5px; background: rgb(238, 246, 248); border: none; border-radius: 50px;">가족</button>
		          	<button class="btn_healthy" style="width:120px; height:40px; padding:5px; background: rgb(236, 249, 247); border: none; border-radius: 50px;">건강·여가</button>
		          	<button class="btn_education" style="width:120px; height:40px; padding:5px; background: rgb(235, 244, 250); border: none; border-radius: 50px;">교육</button>
		          	-->
          		</li>
          	</ul>
          	<br/>
          <h4>2. 태그 선택</h4>
          <ul>
          	<li class="select-tag">
		    	<button class="btn_salary" style="width:120px; height:40px; padding:5px; background: rgb(246, 246, 246); border: none; border-radius: 50px;">#업계평균이상</button>
		    	<button class="btn_salary" style="width:120px; height:40px; padding:5px; background: rgb(246, 246, 246); border: none; border-radius: 50px;">#연봉상위1%</button>
          		<button class="btn_salary" style="width:120px; height:40px; padding:5px; background: rgb(246, 246, 246); border: none; border-radius: 50px;">#연봉상위2~5%</button>
          		<button class="btn_salary" style="width:120px; height:40px; padding:5px; background: rgb(246, 246, 246); border: none; border-radius: 50px;">#연봉상위6~10%</button>
       		</li>
       	</ul>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-defualt">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  
  
<!-- 지역 Modal -->
  <div class="modal fade" id="myModal_area" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align: center;">지역</h4>
        </div>
        <div class="modal-body">
          <h5 style="margin-left: 50px;">지역　　　　　　　　　 　　　상세지역</h5>
      		<select name="sido1" id="sido1"  size="6" style="width:200px;height:100px;margin-left: 50px;"></select>
			<select name="gugun1" id="gugun1" size="6" style="width:250px;height:100px;"></select>
        <br/><br/>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  
  
  
 <!-- 경력 Modal -->
  <div class="modal fade" id="myModal_career" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align: center;">경력</h4>
        </div>
        <div class="modal-body">
       	 <br/><br/>
          <select name="career" id="career" class="form-inline" style="width: 550px; height: 30px;"
			onchange="detail(this)">
			<option value="0" selected="selected">전체</option>
			<option value="1">1년</option>
			<option value="2">2년</option>
			<option value="3">3년</option>
			<option value="4">4년</option>
			<option value="5">5년</option>
			<option value="6">6년</option>
			<option value="7">7년</option>
			<option value="8">8년</option>
			<option value="9">9년</option>
			<option value="10">10년</option>
		</select>
		<br/><br/>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">확인</button>
        </div>
      </div>
    </div>
  </div>
 
</div>

 	<br/><br/>
 	

 	

<!-- <form name="form1" method="get" action="">
	<div>
		<select name="code1" onchange="setComboBox(this)" style="width:100px;">
		<option value="">- 전체 -</option>
		<?makeCode1Option();?>
		</select>
		<select name="code2" onchange="setComboBox(this)" style="width:100px;">
		<option value="">- 전체 -</option>
		</select>
		<select name="code3" style="width:100px;">
		<option value="">- 전체 -</option>
		</select>
	</div>
</form>

<script type="text/javascript">
	function setComboBox(o){
	var code = o.value;
	var div = $(o).parent(); // 셀렉트 박스의 상위 객체
	var cnt = $('select', div).size(); // 셀렉트 박스 갯수
	var idx = $('select', div).index(o); // 현재 셀렉트 박스의 순서
	var depth = cnt - 1 + idx;
	var combo = $('select', div).eq(idx + 1);
	var text = '<option value="">- 전체 -</option>';
	
	if(code == ''){ // 전체를 선택했을 경우
	$('select:gt(' + idx + ')', div).html(text);
	return;
	}
	
	$.post('/include/util/code_data.php', {depth:depth, code:code}, function(rst){
	var data = eval('(' + rst + ')');
	var loop = data.length;
	$('select:gt(' + idx + ')', div).html(text);
	for(var i=0 ; i<loop ; i++){
	combo.append('<option value="' + data[i].code + '">' + data[i].name + '</option>');
	}
	});
	}
</script> -->


<script type="text/javascript">


$('document').ready(function() {
	 var area0 = ["전국","서울","인천","대전","광주","대구","울산","부산","경기","강원","충북","충남","전북","전남","경북","경남","제주"];
	 var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	  var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	  var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
	  var area4 = ["전체","광산구","남구","동구","북구","서구"];
	  var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	  var area6 = ["전체","남구","동구","북구","중구","울주군"];
	  var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	  var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	  var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	  var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	  var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	  var area12 = ["전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	  var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	  var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	  var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	  var area16 = ["전체","서귀포시","제주시"];
	   
   
	   // 시/도 선택 박스 초기화

   $("select[name^=sido]").each(function() {
    $selsido = $(this);
    $.each(eval(area0), function() {
     $selsido.append("<option value='"+this+"'>"+this+"</option>");
    });
    $selsido.next().append("<option value=''>시/도 구군</option>");
   });

   

   // 시/도 선택시 구/군 설정

   $("select[name^=sido]").change(function() {
    var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
    var $gugun = $(this).next(); // 선택영역 군구 객체
    $("option",$gugun).remove(); // 구군 초기화

    if(area == "area0")
     $gugun.append("<option value=''>구/군 선택</option>");
    else {
     $.each(eval(area), function() {
      $gugun.append("<option value='"+this+"'>"+this+"</option>");
     });
    }
   });


  });

</script>




<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
/* $(function(){
  $('.btn_show').click(function(){
    $('.btn_word').show();
  });
  $('.btn_hide').click(function(){
    $('.btn_word').hide();
  });
}); */


$(document).ready(function () {
	  $(document).on("click", "button[name='#btn_salary']", function () {
	    $("body").append("<button name='#btn_salary_tag'>+</button>");
	  });
	});
	
	
$("#btn_salary").on("click", function(e)){
	#
	
}


</script>

<select name="language" onchange="handleOnChange(this)">
  <option value="korean">한국어</option>
  <option value="english">영어</option>
  <option value="chinese">중국어</option>
  <option value="spanish">스페인어</option>
</select>
<div id='result'></div>

<script type="text/javascript">

function handleOnChange(e) {
	  // 선택된 데이터 가져오기
	  const value = e.value;
	  
	  // 데이터 출력
	  document.getElementById('result').innerText
	    = value;
	}

</script>

<!-- 으악으각아아아 -->
<div class="tr_hashTag_area">
    <p><strong>해시태그 구현</strong></p>
           <div class="form-group">
                <input type="hidden" value="" name="tag" id="rdTag" />
            </div>
        
             <ul id="tag-list"></ul>
                        
            <div class="form-group">
            	<input type="text" id="tag" size="7" placeholder="엔터로 해시태그를 등록해주세요." style="width: 300px;"/>
           </div>
</div>

<script>
    $(document).ready(function () {
        var tag = {};
        var counter = 0;

        // 입력한 값을 태그로 생성한다.
        function addTag (value) {
            tag[counter] = value;
            counter++; // del-btn 의 고유 id 가 된다.
        }

        // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
        function marginTag () {
            return Object.values(tag).filter(function (word) {
                return word !== "";
            });
        }
    
        // 서버에 제공
        $("#tag-form").on("submit", function (e) {
            var value = marginTag(); // return array
            $("#rdTag").val(value); 

            $(this).submit();
        });

        $("#tag").on("keypress", function (e) {
            var self = $(this);

            //엔터나 스페이스바 눌렀을때 실행
            if (e.key === "Enter" || e.keyCode == 32) {

                var tagValue = self.val(); // 값 가져오기

                // 해시태그 값 없으면 실행X
                if (tagValue !== "") {

                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                    var result = Object.values(tag).filter(function (word) {
                        return word === tagValue;
                    })
                
                    // 해시태그가 중복되었는지 확인
                    if (result.length == 0) { 
                        $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
                        addTag(tagValue);
                        self.val("");
                    } else {
                        alert("태그값이 중복됩니다.");
                    }
                }
                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
            }
        });

        // 삭제 버튼 
        // 인덱스 검사 후 삭제
        $(document).on("click", ".del-btn", function (e) {
            var index = $(this).attr("idx");
            tag[index] = "";
            $(this).parent().remove();
        });
})
</script>



<body>
<button class="btn_show" style="padding:3px">show</button>
<button class="btn_hide" style="padding:3px">hide</button>
<div class="btn_word">Hello world!!!</div>


<form class="list form-inline">
<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>적극 채용 중인 회사</h3>
<br>
<div class="addgonggo form-control" OnClick="location.href='writegonggo'">
	<div class="gonggoicon">
	<span class="glyphicon glyphicon-file" ></span>
	<p>공고list DB연결</p>
	</div>
</div>
<c:set var="strPlanDate" value="${date}"/>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="end_plan_date"  value="${dto.deadline}"/>
	<fmt:parseNumber value="${strPlanDate.time/ (1000*60*60*24)}" integerOnly="true" var="strDate"/>
	<fmt:parseDate value="${end_plan_date}" var="endPlanDate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${endPlanDate.time/ (1000*60*60*24)+1}" integerOnly="true" var="endDate"/>
	
	<c:if test="${(endDate - strDate)>=0}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h4 class="subject">${dto.jobgroup}</h4>
	<c:set var="endday1" value="${end_plan_date.substring(0,4)}"/>
	<c:set var="endday2" value="${end_plan_date.substring(5,7)}"/>
	<c:set var="endday3" value="${end_plan_date.substring(8,10)}"/>
	<h5 style="color:gray">마감일 : ${endday1}년 ${endday2}월 ${endday3}일</h5>
	<h3 class="numdday">D - ${(endDate - strDate)}</h3>
	</div>
	</c:if>
</c:forEach>
</form>
</body>

</html>