<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
.btn {
width: 120px; 
background-color: #021B80;
border: none;
}
</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data" class="form form-inline">
<div class="write" style="width: 800px;">
<h2>채용공고 작성</h2><br>

<h3>회사 이름<br><br><!-- account 연결 필요 -->
<input type="text" name="empname" class="form-control"></h3>

<h3>직군/직무<br><br></h3>
<select name="job" id="job" class="form-inline" style="width: 200px; height: 30px;"
			onchange="selectjob(this)">
			<option selected="selected">직군</option>
			<option value="IT/인터넷">IT/인터넷</option>
			<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
			<option value="디자인">디자인</option>
			<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
			<option value="생산/제조">생산/제조</option>
			<option value="유통/무역">유통/무역</option>
			<option value="서비스/고객지원">서비스/고객지원</option>
		</select>
<select name="jobgroup" id="jobgroup" class="form-inline" style="width: 200px; height: 30px;">
			<option>직무</option>
</select>
<h3>회사 로고</h3>
<input type="file" name="upload" class="form-control">
<div class="category">
<h3>태그</h3>
<select name="ctg" id="ctg" class="form-inline" style="width: 200px; height: 30px;"
			onchange="selectctg(this)">
			<option selected="selected">카테고리</option>
			<option value="업계연봉수준">업계연봉수준</option>
			<option value="보상">보상</option>
			<option value="출퇴근">출퇴근</option>
			<option value="식사/간식">식사/간식</option>
			<option value="기업문화">기업문화</option>
		</select>
<select name="tag" id="tag" class="form-inline" style="width: 200px; height: 30px;">
			<option selected="selected">카테고리</option>
			<option value="업계연봉수준">업계연봉수준</option>
			<option value="보상">보상</option>
			<option value="출퇴근">출퇴근</option>
			<option value="식사/간식">식사/간식</option>
			<option value="기업문화">기업문화</option>
</select>
<button type="button" class="add" id="btnaddctg">+ 추가</button>

</div>
<h3>공고 내용</h3>
<textarea rows="20" cols="100" class="form-control" name="empcontent" ></textarea>

<h3>마감일</h3>
<input type="date" name="deadline" value="2021-07-14" class="form-control">
<br>
<br>

<button type="submit" class="btn btn-info">업로드</button>
<button type="button" class="btn btn-info" onclick="location.href='gonggolist'">목록</button>
</div>
</form>
</body>
<script type="text/javascript">
//직군 onchange 이벤트
function selectjob(e) {
    var it = ["웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"];
    var business = ["사업개발기획자", "컨설턴트", "경영지원"];
    var design = ["그래픽디자이너", "웹디자이너", "일러스트레이터", "UI 디자이너"];
    var marketing = ["광고기획자", "마케팅전략기획자", "키워드광고", "소셜마케터"];
    var production = ["생산직종사자", "제조엔지니어", "품질관리자", "반도체/디스플레이"];
    var trade  = ["수출입사무", "유통관리자", "배송담당", "항공운송"];
    var service  = ["MD", "CS어드바이저", "CS매니저", "텔레마케터"];
    var target = document.getElementById("jobgroup");

    if(e.value == "IT/인터넷") var d = it;
    else if(e.value == "경영/기획/컨설팅") var d = business;
    else if(e.value == "디자인") var d = design;
    else if(e.value == "미디어/홍보/마케팅") var d = marketing;
    else if(e.value == "생산/제조") var d = production;
    else if(e.value == "유통/무역") var d = trade;
    else if(e.value == "서비스/고객지원") var d = service;


    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}
window.onload = function() {
	document.getElementById("btnaddctg").onclick=function(){	
		var ctg=["업계연봉수준","보상","출퇴근","식사/간식","기업문화"];
		var cate=document.createElement("select");
		cate.setAttribute("width","100px");
		cate.setAttribute("name","lang");
		ctg.forEach(function(elt,i,array){
			var block=document.createElement("option");
			block.setAttribute("value",elt);
			block.innerHTML=elt;
			cate.appendChild(block);
		});
			
			document.appendChild(cate);
		}
	
		/*  var pay = ["", "", "", ""];
		    var business = ["", "", ""];
		    var design = ["", "", "", ""];
		    var marketing = ["", "", "", ""];
		    var production = ["", "", "", ""];
		    var trade  = ["", "", "", ""];
		    var service  = ["", "", "", ""];
		    var target = document.getElementById("jobgroup");

		    if(e.value == "IT/인터넷") var d = it;
		    else if(e.value == "경영/기획/컨설팅") var d = business;
		    else if(e.value == "디자인") var d = design;
		    else if(e.value == "미디어/홍보/마케팅") var d = marketing;
		    else if(e.value == "생산/제조") var d = production;
		    else if(e.value == "유통/무역") var d = trade;
		    else if(e.value == "서비스/고객지원") var d = service;


		    target.options.length = 0;

		    for (x in d) {
		        var opt = document.createElement("option");
		        opt.value = d[x];
		        opt.innerHTML = d[x];
		        target.appendChild(opt); 
		    } 
	
	
	
	var tg=document.createElement("select");
	tg.setAttribute("width","100px");
	tg.setAttribute("name","tag");
	tag.forEach(function(elt,i,array){
		var block=document.createElement("option");
		block.setAttribute("value",elt);
		block.innerHTML=elt;
		tag.appendChild(block);
		})*/

		
	}
</script>
</html>