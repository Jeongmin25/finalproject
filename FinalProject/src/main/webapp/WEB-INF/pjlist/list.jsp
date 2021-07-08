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


</style>

<script type="text/javascript">
	function submit2(frm){
		frm.action='/pjlist';
		frm.submit();
		return true;
	}
</script>
</head>


<body>

<h2>전체 </h2>
<hr>

<div class="container_tag">

  <!-- Trigger the modal with a button -->
  <!-- 구동하고자 하는 버튼이나 링크에 data-toggle="modal"을 부여하면 modal을 띄울 준비가 되고 
  data-target="DOM선택자"를 입력하면 지정된 내용을 modal로 띄울 수 있다.-->
  <button type="button" class="myModal_tag btn btn-default btn-ms" data-toggle="modal" data-target="#myModal_tag">
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
			<button data-attribute-id="explore__bookmarkPage__click" type="button" style="background-color: white; border: none;" onclick="location.href='/bookmark'">
			<svg width="13" height="17" viewBox="0 0 13 17" style="color:#36f"><defs>
			<path id="bookmarkIconFill" d="M6.25 13.21L.905 16.22c-.403.228-.905-.06-.905-.517V.596C0 .267.27 0 .605 0h11.29c.334 0 .605.267.605.596v15.107c0 .458-.502.745-.905.518L6.25 13.209z">
			</path></defs>
			<g fill="none" fill-rule="evenodd" transform="translate(.188)">
			<use fill="currentColor" xlink:href="#bookmarkIconFill"></use></g></svg>
			<span>북마크 모아보기</span><svg width="12" height="12" viewBox="0 0 12 12">
			<path fill="currentColor" d="M4.22 9.72a.75.75 0 001.06 1.06l4.25-4.25a.75.75 0 000-1.06L5.28 1.22a.75.75 0 00-1.06 1.06L7.94 6 4.22 9.72z">
			</path></svg></button>
	 </div>	 
	 
</div>


<form id="tag" method="post" >
<!-- 태그 Modal -->

  <div class="modal fade" id="myModal_tag" tabindex="-1" role="dialog" aria-labelledby="myModal_80tagLabel">
    <div class="modal-dialog madal-fullsize" role="document">
    
      <!-- Modal content-->
      <div class="modal-content madal-fullsize">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="text-align: center;">태그</h4>
          <br/>
          <b style="margin-left: 35px;">기업의 특별한 복지, 혜택 등 태그를 선택하여
         나에게 꼭 맞는 포지션을 찾아보세요!</b>
        </div>
        
        
        <div class="modal-body" style="margin-left: 180px;">
			<table id="seltag" >
				<tr>
					<td>
					<h4>1. 카테고리 선택</h4>
						<select style="width: 200px; height: 35px;" name="cctg" id="cctg" class="sel form-control" 
						onchange="selectctg(this.value)">
							<option hidden disabled>카테고리</option>
								<option value="보상">보상</option>
								<option value="출퇴근">출퇴근</option>
								<option value="식사/간식">식사/간식</option>
								<option value="기업문화">기업문화</option>
								
						</select>
	          	<br/>
						
					<h4>2. 태그 선택</h4>
						<select style="width: 200px; height: 35px;" name="hashtag" id="hashtag" class="sel form-control" onchange="selecttag(this.value)">
							<option >해시태그</option>
						</select>
							<!-- <button type="button" class="add" id="btnaddctg">+ 추가</button>-->
						<div id="output1">
						 <c:forEach var="category" items="${category}">
							<div class="form-control">
								<input type="button" name="ctg" id="ctg" value="${category.ctg}"> 
								<span class="remove1 glyphicon glyphicon-remove"></span>
							</div>
						 </c:forEach>
						</div>
						<br/>
						<div id="output2">
						 <c:forEach var="category" items="${category}">
							<div class="form-control">
								<input type="button" name="tag" id="tag" value="${category.tag}"> 
								<span class="remove1 glyphicon glyphicon-remove"></span>
							</div>
						 </c:forEach>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
        <div class="modal-footer">
          <button type="submit" class="tagconfirm btn btn-defualt" id="tagModalConfirm1" onclick="return submit2(this.form)">확인</button>
        </div>
     </div>
 </div>
 </div>
 

<script type="text/javascript">

	function selectctg(c) {
		
		var ipt = document.createElement("input");
		ipt.setAttribute("type","button");
		ipt.setAttribute("class","form-control");
		ipt.setAttribute("name","ctg");
		ipt.setAttribute("id","ctg");
		ipt.setAttribute("value",c);
		var space= document.getElementById("output1");
		var spanx=document.createElement("span");
		spanx.setAttribute("class","remove glyphicon glyphicon-remove");
		//space.appendChild(ipt);
		//space.appendChild(spanx);	
		
	    var pay = ["연봉업계평균이상","연봉상위1%","연봉상위2~5%","연봉상위6~10%","연봉상위11~20%"];
	    var com = ["성과급", "상여금", "연말보너스","스톡옵션"];
	    var work = ["택시비", "차량지원", "재택근무", "원격근무"];
	    var eat = ["조식제공", "중식제공", "석식제공", "식비","커피","간식"];
	    var culture = ["수평적조직", "스타트업", "자율복장", "워크샵"];
	    var hashtag = document.getElementById("hashtag");
	   
	    if(c == "업계연봉수준") var t = pay;
	    else if(c == "보상") var t = com;
	    else if(c == "출퇴근") var t = work;
	    else if(c == "식사/간식") var t = eat;
	    else if(c == "기업문화") var t = culture;
	
	    hashtag.options.length = 0;
	
	    for (x in t) {
	        var opt = document.createElement("option");
	       	opt.setAttribute("type","button");
	        opt.value = t[x];
	        opt.innerHTML = t[x];
	        hashtag.appendChild(opt);
	    }
	}

	function selecttag(t) {
			var ipt = document.createElement("input");
			ipt.setAttribute("type","button");
			ipt.setAttribute("class","form-control");
			ipt.setAttribute("name","tag");
			ipt.setAttribute("id","tag");
			ipt.setAttribute("value",t);
			var space= document.getElementById("output2");
			var spanx=document.createElement("span");
			spanx.setAttribute("class","remove glyphicon glyphicon-remove");
			space.appendChild(ipt);	
			space.appendChild(spanx);	
		
	}
	
	$(document).on("click",".remove1",function(e){
		var r1 = e.target;
		var r2= r1.parentNode;
		r2.parentNode.removeChild(r2);
		
	});
		

	$( document ).ready( function() {
		$( 'button#tagModalConfirm1' ).click( function() {
			var tag1 = $( 'input#tag' ).val();
			alert( tag1 );
			
			$.ajax({
		        type : "post",  
		        url : "/pjlistsearch",        
		        data : "tag1="+tag1,
		        dataType: 'json',
		        
		        error : function(){
		            alert("통신 에러","error","확인",function(){});
		        },

		        success : function(data) {
		        	//console.log(data); list 데이터 확인 
		        	var s="";
		        	
		        	if(data==""){
		        		s+="<br><br><br>";
		        		s+="<h3 style='margin-left: 300px;'>["+title+"] 검색 결과가 없습니다.</h3><br><br>";
		        		s+='<button type="button" class="lostbtn btn-default btn" style="margin-left: 380px;">뒤로가기</button>';
		        		
		        	}else{
		        	
		        		
			       		//반복문으로 값 출력
			        	$.each(data, function(idx, val) {
			        		s+='<table class="newstable table table" num="'+val.num+'" style="width: 900px;" id="newstable">';
				        	s+='<tr>';
			        		s+='<td style="width:210px; height: 150px;">';
				        	s+='<img src="../newsImage/'+val.image+'" style="max-width: 200px; max-height: 150px;"></td>';
				        	s+='<td><h4>'+val.title+'</h4><br>';
				        	s+='<h5 style="color: gray;">'+val.content+'</h5><br>';
				        	s+='<span class="glyphicon glyphicon-eye-open" style="font-size: 1.2em;"></span>&nbsp;';
				        	s+=val.readcount;
				        	s+='</h5></td></tr>';
				        	s+='</table>';
				        	
			        	});
		        		
		        	}	        	
		               	
		        	$("div.newslist").html(s);
		        }	
			})	
			
			
			
			
			
		});
	});
	
	
	/*  $('#tagModalConfirm1').on('click', function(){
    $.ajax({
        url : '',
        type : 'POST',
        success : function(result){
            $('#okky').modal('show');
            // console.log(result);
            if (서버에서 넘어온 값 == true){
                $('#okky_con').html('사용 가능한 ID 입니다.');
            }else{
                $('#okky_con').html('이미 사용중인 ID 입니다.');
        },

        error : function(xhr, ajaxOptions, thrownError){
            console.log('Error : ' + xhr.status + '\n' +
            'Message : ' + xhr.statusText + '\n' +
            'Response : ' + xhr.responseText + '\n' + thrownError);
        }

    });
}); */

	/* $(document).on("click", "#tagModalConfirm", function(e){
		var categoty=$(this).attr("category");
		var tag=$(this).attr("category.tag");
		
		alert(num+", "+id+", ");
	
	})	 */
	
</script>

<!-- 지역 Modal -->
  <div class="modal fade" id="myModal_area" tabindex="-1" role="dialog" aria-labelledby="myModal_80tagLabel">
    <div class="modal-dialog madal-fullsize" role="document">
	    
	      <!-- Modal content-->
	      <div class="modal-content">
		   <!--   <form id="area" name="area" method="post" enctype="multipart/form-data"> -->
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
		          <button type="submit" class="btn btn-default" id="tagModalConfirm2" >확인</button>
		        </div>
		    <!--   </form>  --> 
		    </div>
		    
		</div>
	</div>


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


$( document ).ready( function() {
	$( 'button#tagModalConfirm2' ).click( function() {
		var tag1 = $( 'select#sido1' ).val();
		var tag2 = $( 'select#gugun1' ).val();	
		alert(tag1+" "+tag2);
	} );
} );
</script>

<!-- 경력 Modal -->
<div class="modal fade" id="myModal_career" tabindex="-1" role="dialog" aria-labelledby="myModal_80tagLabel">
    <div class="modal-dialog madal-fullsize" role="document">
		    
		   <!-- Modal content-->
		   <div class="modal-content">
		 <!--  <form id="career" name="career" method="post" enctype="multipart/form-data">  -->
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
		          <button type="submit" class="btn btn-default" id="tagModalConfirm3">확인</button>
		       </div>
		      <!-- </form> -->
			</div>
			
		</div>
	</div>
</form>


<script type="text/javascript">

$( document ).ready( function() {
	$( 'button#tagModalConfirm3' ).click( function() {
		var tag1 = $( 'select#career' ).val();
		alert(tag1);
	} );
} );

</script>

 <form class="list form-inline">
<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>적극 채용 중인 회사</h3>
<hr>
<br>
<c:set var="strPlanDate" value="${date}"/>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">	
	<div class="gonggo-box form-control" onclick="location.href='/pjlist/gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h4 class="subject">${dto.jobgroup}</h4>
		<h6 class="empname">${dto.empname }</h6>
		<h5 class="job">${dto.job }</h5>
	</div>
</c:forEach>
</form>


</body>

</html>