<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.util.*" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>공지사항 상세</title>
	<%@ include file="../module/head.jsp" %>
	
</head>
<body>
 <header>
    <%@ include file="../module/navigation.jsp" %>
 </header>
	<%@ include file="../module/categoryNavigation.jsp" %>
	
  <section class="container">
   <div class="mt-5">
	   <div class="mb-1 border-bottom border-2 border-secondary">
<!--data.title-->
	     <h5>제목 값</h5> 
	   </div>	   
	   <div class="mb-3 text-end">
<!--data.createDate, data.accountId, data.viewCnt 값 넣기 -->	   
	      <label class="text-muted"><small>홍길동</small></label>
	      <fmt:formatDate value="" var="createDate" dateStyle="medium"/>
	      <label class="text-muted"><small>${createDate}</small></label>
	      <label class="text-muted"><small>조회수</small></label>
	   </div>   
   </div>
   
	 <div class="mb-5 border-bottom border-2 border-secondary">
<!--data.content -->	  
	    <p>
	    내용 값
	    </p>
    </div>
    
    <div>
      <div class="mb-1 text-center">
      <c:url var="noticeUrl" value="/notice"/>
        <button class="btn btn-primary" type="button" onclick="location.href='${noticeUrl}'">목 록</button>
<!-- 권한별 수정,삭제표기 // 접속자세션 eq 관리자권한 체크
	<c:if test="session.loginData.accId eq ">
	     <button class="btn btn-primary" type="button" onclick="location.href='${noticeUrl}/modify?id='">수 정</button>
	     <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#removeModal">삭 제</button>
    </c:if>  
-->	   
	  </div>
    </div>  
  </section>
 
 
 <!--삭제모달 --> 
   <div class="modal fade" id="removeModal" tabindex="-1"  aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h6 class="modal-title" >삭제 확인</h6>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		           해당 게시물을 정말 삭제하겠습니까?
		      </div>
		      <div class="modal-footer">
<!--deleteNotice(id값)-->		      
		        <button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal" onclick="deleteNotice()">확인</button>
		      </div>
		    </div>
		  </div>
	</div> 
  
  
 <!--하단페이지 < include file="../module/footer.jsp" >--> 
 <%@ include file="../module/footer.jsp" %>
 
<script type="text/javascript">

<!-- 삭제 모달 Ajax-->
function deleteNotice(noticeId){
	  $.ajax({
		  url:"${noticeUrl}/delete",
		  type:"post",
		  data:{
			  id:boardId
			  
		  },
		  dataType:"json",
		  success: function(data){
			  if(data.code ==="success"){
				  alert("삭제완료");
				  location.href="${noticeUrl}";
			  }else if(data.code ==="fail"){
				  alert("삭제 작업 중 문제가 발생하였습니다.");
			  }else if(data.code ==="notExists"){
				  alert("이미 삭제되었습니다.");
			  }
		  }
	  });
}


</script> 
</body>
</html>