<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- jquery ajax에 필요한 부분 start -->
    <script type="text/javascript"
    src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript"
    src="<%=request.getContextPath()%>/js/ajaxsetup.js"></script>
  <!--jquery ajax에 필요한 부분 end  -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
<script src="${pageContext.request.contextPath}/js/ajaxsetup.js"></script>

<style>
.btn-primary {
    color: black;
    background-color: #fac564;
    border-color: #fac564;
}
.btn-primary:hover {
    color: #fac564;
    background-color: black;
    border-color: #fac564;
}
</style>

<script>
function pwFind(form){
  if(form.id.value==""){
    alert("아이디를 입력해주세요");
    document.frm.id.focus();
  }
  else if(form.mname.value==""){
    alert("이름을 입력해주세요");
    document.frm.mname.focus();
  }
  else{
    var url = "searchPw";
    var param ="id="+form.id.value+"&mname="+form.mname.value;
    
    $.get(url, param, function(data, textStatus) {
      // 응답함수
      // alert(data);
      $("#pwfind").text(data);
    });
  }
}
</script>
</head>
<body style="background-color:black;">
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10" style="color: #fac564">SEARCH PW</h1>
<form class="form-horizontal" method="post" name="frm" action="">

<div class="form-group">
  <label class="control-label col-sm-2" for="id" style="color: #fac564">ID</label>
  <div class="col-sm-3">
  <input type="text" name="id" id="id" class="form-control"
  value="user1">
  </div>
</div>

<div class="form-group">
<label class="control-label col-sm-2" for="mname" style="color: #fac564">NAME</label>
  <div class="col-sm-3">
<input type="text" name="mname" id="mname" class="form-control"
value="홍길동">
</div>
</div>


<div class="form-group">
<div class="col-sm-offset-2 col-sm-5">
<button type="button" class="btn btn-white btn-outline-white"
 onclick="pwFind(document.frm)">FIND</button>
<button type="button" class="btn btn-white btn-outline-white"
 onclick="self.close()">BACK</button>
</div>
</div>
</form>
<div id="pwfind" style="color:#fac564; 
		border:solid 2px; border-color:#fac564;
		width:250px; height:25px; text-align:center;"></div>
</div>
</body>
</html>