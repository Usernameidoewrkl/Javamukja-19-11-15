<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head>
<title>List</title>
<meta charset="utf-8">
<script type="text/javascript">
  $(document).ready(function(){
	  var modal ='${msg}';
	  checkModal(modal);

	  history.replaceState({},null,null);

	  function checkModal(modal){
		  if(history.state) return;
		  if(modal){
			$(".modal-body").html(modal);
		    $("#myModal").modal("show");
		  }
	  }
  });
  
    function read(tno){
       var url = "read";
       url += "?tno="+tno;      
       url += "&col=${col}";
       url += "&word=${word}";
       url += "&nowPage=${nowPage}";   
       location.href=url;
     }
    
    function upRcnt(tno){
    	 var url = "upRcnt";
         url += "?tno="+tno;      
         url += "&col=${col}";
         url += "&word=${word}";
         url += "&nowPage=${nowPage}";
         
         location.href=url;
       }
</script>
</head>
<body>
<input type="hidden" name="id" value="${dto.fname}" />
<input type="hidden" name="id" value="${dto.MFname}" />
<div class="container">
   <h2 style="color:#fac564">자유 게시판</h2>
  <form class="form-inline" action="${root}/talk/list">
  <div class="form-group" style="color:white;">
  <select class="form-control" name="col" >
  <option value="title" style="color:black;"
  <c:if test="${col=='title'}">selected</c:if>
    >제목</option>
    <option value="hashtag" style="color:black;"
  <c:if test="${col=='hashtag'}">selected</c:if>
  >해쉬태그</option>
  <option value="id" style="color:black;"
 <c:if test="${col=='id'}">selected</c:if>
  >작성자</option>
  <option value="total" style="color:black;"
  <c:if test="${col=='total'}">selected</c:if>
  >전체출력</option>
  </select>
  </div>
  <div class="form-group">
  <input type="text" class="form-control" style="color:white;" placeholder="Enter검색어"
  name="word" value="${word}">
  </div>
  <button class="btn btn-white btn-outline-white">검색</button>&nbsp;
  <c:if test="${not empty id && (grade=='A' || grade=='C' ||grade=='N')}">
				<button type="button" class="btn btn-white btn-outline-white"
					onclick="location.href='create'">등록</button>
			</c:if>
  </form>
  <br>
		<c:forEach var="dto" items="${list }">
  		<c:set var="tcount" value="${util:tcount(dto.tno,tinter)}"/>
		<div class="card" style="width: 60rem;height: 34rem; background-color: #00000000; border:solid 8px; border-style: ridge; border-color:#fac564;">
			<div class="card-profile">
			    <h2><span class="badge badge-pill badge-danger" style="text-align:center; position:absolute; 
			    margin-left:140px; margin-top:30px; color:#ffffff;">${dto.id }</span></h2>
			    <h2><span class="badge badge-pill badge-warning" style="text-align:center; position:absolute; 
			    margin-left:250px; margin-top:23px; color:#ffffff;">${dto.category }</span></h2>
			    <h2 class="card-title" style="text-align:center; position:absolute; 
			    margin-left:140px; margin-top:70px; color:#fac564;" ><a href="javascript:read('${dto.tno}')" ><span class="badge" style="font-size:87%; ">Title: </span> ${dto.title }</a></h2>
			    <h4 class="card-date" style="color:#524b4b; position:absolute; 
			    margin-left:820px; margin-top:15px">${dto.rdate}</h4>
			    <img class="rounded float-left" alt="Cinque Terre" src="${root }/member/storage/${dto.MFname}" style="width:110px; height:110px; margin:20px;"/>
			    <h3 style="color:#e21919; position:absolute; 
			    margin-left:25px; margin-top:400px">${dto.hashtag}</h3>
			  <a href="javascript:read('${dto.tno}')" ><img src="${root }/talk/storage/${dto.fname}" class="card-img" 
			  style="width:400px; height:400px; margin-top:110px; margin-left:380px; position:absolute; border:solid 8px; border-color:#b33f3a; border-style: ridge;"></a>
			</div>
			<div class="card-text" style="width:490px; margin-left:20px; margin-top:70px">
			    <a href="javascript:read('${dto.tno}')" >
			    <text>${dto.content}</text>
			    </a>
			</div>
			<div class="card-bottom" style="position:absolute; margin-top:460px; margin-left:50px">
					<button type="button" onclick="javascript:read('${dto.tno}')" class="btn btn-outline-warning" style="width:85px; height:45px;"> 댓글 <span class="badge" style="font-size: 90%;"> ${tcount } </span></button>
					<button type="button" onclick="javascript:upRcnt('${dto.tno}')"class="btn btn-outline-danger" style="width:85px; height:45px; margin-left:15px">♥ ${dto.rcnt }</button>
					<button type="button" class="btn btn-outline-success" style="width:85px; height:45px; margin-left:15px">조회수: ${dto.viewcnt }</button>
			</div>
		</div><br>
		</c:forEach>
			${paging}
			</div>		
	
	 <!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
<div class="modal-dialog modal-sm">
<div class="modal-content" style="border: 3px solid #fff;">
<div class="modal-header" style="background-color:black">
 
<h4 class="modal-title" style="color:#fac564">확인 메세지</h4>
</div>
<div class="modal-body" style="background-color:black">
<p>This is a small modal.</p>
</div>
<div class="modal-footer" style="background-color:black">
<button type="button" class="btn btn-white btn-outline-white" data-dismiss="modal">Close</button>
</div>
</div>
</div>
</div>


