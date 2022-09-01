<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<%@ include file="../module/head.jsp" %>
</head>
<body>
<header class="mb-3"></header>
  <section>
   <c:url var="find_idUrl" value="/login/find_id/"/>
   <form action="${find_idUrl}" method="post">
   <div id ="find_id" name="find_id">
   <div align="center">
	<p id ="title" name = "title" align ="center"></p> 
	<h2>아이디 찾기</h2>
	<p>아이디는 가입하신 이메일을 통해 찾을 수 있습니다.</p>
	
     <div class=""></div>
     <table>
         <tr>
             <td>
                <br>
                 <input placeholder="이메일"  id="email1" name="email" size=50px; required>
             </td>
         </tr>
     </table>
    
     <br>
       <br>
	     <button class="btn btn-outline-primary bluebtn"  id="find_idBtn" value="아이디 찾기" >아이디찾기</button> <br><br>
	     <button class="btn btn-outline-primary bluebtn"  id="reset" onclick= "location.href='../login'" value="취소" >취소</button> <br><br>
  </form>
   </div>
   </div>
 </section>
    <br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<br><br><br><br>
	<%@ include file="../module/footer.jsp" %>
</body>
</html>