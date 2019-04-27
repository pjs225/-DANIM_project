<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: rgb(200,160,220,0.5);
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a, .sidebar-nav li span {
    display: block;
    text-decoration: none;
    color: #000;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgb(200,160,220, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  } 
  </style>
<title>Insert title here</title>
<script type="text/javascript">
function allchk(bool){
	$("input[name=chk]").attr("checked", bool);
}

$(function(){
	$("#muldelform").submit(function(){
		// $("#muldelform input: checked")
		if($("input[name=chk]:checked").length==0){
			alert("하나 이상 체크해주세요!")
			return false;
		}else{
			alert("삭제 성공!")
		}

	});
}); 
</script>
</head>
<%



		String id = (String)session.getAttribute("sessionId");         

%>
<body>
<div style="height: 100px;">
	<jsp:include page="./form/header.jsp"></jsp:include>
</div>

<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
       <span style="font-weight: bold">MENU</span>
      </li>
      <li><a href="myPage.jsp">개인정보 변경</a></li>
      <li><a href="map.do?command=myDiary&id=<%=id%>">내 플래너</a></li>
      <li><a href="danim.do?command=myHistory&id=<%=id%>">내가 올린 글</a></li>
      <li><a href="danim.do?command=payHistory&id=<%=id%>">결제 내역</a></li>

    </ul>
  </div>
</div>
  <!-- /사이드바 -->
<div align="center">
	<form action="danim.do?command=muldel" method="post" id="muldelform">
	<h1>내가 올린 글</h1>
	<input type="hidden" name="command" value="" >
	<table border="1">
		<col width="50"/>
		<col width="50"/>
		<col width="200px"/>
		<col width="200px"/>
		<col width="300px"/>
		<col width="100px"/>
		<col width="50px"/>
		<tr>
			<th><input type="checkbox" name="all" onclick="allchk(this.checked)" /></th>
			<th>번  호</th>
			<th>글제목</th>
			<th>파일이름</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
			<tr>
				<td colspan="6">---작성된 글이 없습니다----</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td><input type="checkbox" name="chk" value="${dto.boardno }"/>
						<td>${dto.boardno }</td>
						<td><a href="danim.do?command=boarddetail&boardno=${dto.boardno }">${dto.title }</a></td>
						<td>${dto.filename }</td>
						<td>${dto.regdate }</td>
						<td>${dto.viewcount }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<tr></tr>	
	</table>
		<input type="submit"  id="write" value="삭제" class="btn-primary center-block"  >
</form>


<div class="pager">
	
		<c:if test="${paging.curPageNum>4 }">
			<a href="danim.do?command=review&page=${paging.blockStartNum-1 }">앞으로</a>	
		</c:if>
		<c:forEach var="i" begin="${paging.blockStartNum }" end="${paging.blockLastNum }">
			<c:choose>
				<c:when test="${i>paging.lastPageNum || paging.lastPageNum==0 }">
					<a href="danim.do?command=review&page=${i }">${i }</a>
				</c:when>
				<c:when test="${i==paging.curPageNum }">
					<a href="danim.do?command=review&page=${i }" class="selected">${i }</a>
				</c:when>	
				<c:otherwise>
					<a href="danim.do?command=review&page=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.lastPageNum>paging.blockLastNum }">
			<a href="danim.do?command=review&page=${paging.blockLastNum+1 }">뒤로</a>
		</c:if>

</div>
<div>

</div>
</div>
</body>
</html>