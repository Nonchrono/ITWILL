<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>

<!-- 본문시작 bbsList.jsp -->
<div class="container">
<h3>* 글목록 *</h3>
<p><a href="bbsForm.jsp">[글쓰기]</a></p>
<div class="table-responsive">
    <table class="table table-hover table-condensed">
    <thead>
        <tr class="success">
            <th scope="row" style="text-align: center;">제목</th>
            <th scope="row" style="text-align: center;">조회수</th>
            <th scope="row" style="text-align: center;">작성자</th>
            <th scope="row" style="text-align: center;">작성일</th>
        </tr>
    </thead>
    <tbody>
<%
	//한페이지당 출력할 행의 갯수
	int recordPerPage = 10;

    ArrayList<BbsDTO> list=dao.list3(col, word, nowPage, recordPerPage);
    if(list == null) {
        out.println("<tr>");
        out.println("   <td colspan='4'>");
        out.println("       <strong>관련자료 없음!!</strong>");
        out.println("   </td>");
        out.println("</tr>");
    } else {
    	// 오늘 날짜를 문자열 "2022-10-22" 만들기
		String today = Utility.getDate();   	
    	
        for(int i=0; i < list.size(); i++) {
            dto = list.get(i);
%>

    <tr>
		<td style="text-align: left">
<%
		//답변 이미지 출력
		for (int n=1; n<=dto.getIndent(); n++) {
			out.println("<img src='../images/reply.gif'>");
		} // for end
		
%> 
		<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
<% 

			// 오늘 작성한 글제목 뒤에 new 이미지 출력
			// 작성일 (regdt)에서 "년월일"만 자르기
			String regdt = dto.getRegdt().substring(0,10);
			if (regdt.equals(today)) { // 작성일과 오늘 날짜가 같다면
				out.println("<img src='../images/new.gif'>");
			} // if end
			
			// 조회수가 10 이상이면 hot 이미지 출력
			if (dto.getReadcnt() >= 10) {
				out.println("<img src='../images/hot.gif'>");
			}
%>			
		</td>
		<td><%=dto.getReadcnt()%></td>
		<td><%=dto.getWname()%></td>
		<td><%=dto.getRegdt().substring(0,10)%></td>
	</tr>
<%
        } // for end
        
        
        // 글 갯수
        int totalRecord = dao.count(); 
        out.println("<tr>");
        out.println("	<td colspan='4' style='text-align:center;'>");
        out.println("		글 갯수:<strong> " + totalRecord + " </Strong>");
        out.println("	</td>");
        out.println("</tr>");
        
        // 페이지 리스트
        out.println("<tr>");
        out.println("	<td colspan='4' style='text-align:center; height: 50px'>");
        String paging = new Paging().paging3(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
        out.print(paging);
        out.println("	</td>");
        out.println("</tr>");
%>  
    <!-- 검색 시작 -->
	<tr>
		<td colspan="4" style='text-align:center; height:50px; '>
			<form action="bbsList.jsp" onsubmit="return searchCheck()"><!-- myscript.js 함수 작성함 -->
				<select name="col">
					<option value="subject_content">제목+내용
					<option value="subject">제목
					<option value="content">내용
					<option value="wname">작성자
				</select>
				<input type="text" name="word" id="word">
				<input type="submit" value="검색" class="btn btn-primary">
			</form>
		</td>
	</tr>
	<!-- 검색 끝 -->
<%
    } // if end
%>
    </tbody>
    </table>
</div>
</div>
    <!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>