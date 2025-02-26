<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="/jboard/css/style.css"/>
</head>
<body>
    <div id="wrapper">
       <%@ include file="./_header.jsp" %>
        <main id="article">
            <section class="modify">
                <nav>
                    <h1>글수정</h1>
                </nav>
                <form action="/jboard/article/modify.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="writer" value="${sessUser.uid}" readonly>
                    <table border="0">                        
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" value="${articleDTO.title}"placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
	                        <th>작성자</th>	
	                        <td><input type="text" name="writer" value="${articleDTO.writer}(${articleDTO.nick})" readonly/></td>
                    	</tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" >${articleDTO.content}</textarea>
                            </td>
                        </tr>
                        <tr>
						    <th>기존 파일</th>
						    <td>
						        <c:forEach var="file" items="${files}">
						            <input type="checkbox" name="deleteFiles" value="${file.fno}"> 삭제
						            <a href="/jboard/upload/${file.sName}" download>${file.oName}</a><br>
						        </c:forEach>
						    </td>
						</tr>
						<tr>
						    <th>새 파일 추가</th>
						    <td>
						        <input type="file" name="file"/>
						    </td>
						</tr>
                    </table>
                    
                    <div>
                        <a href="./view.html" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
        <%@ include file="./_footer.jsp" %>
    </div>    
</body>
</html>