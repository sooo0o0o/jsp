<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/jboard/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <%@ include file="./_header.jsp" %>
        <main id="article">
            <section class="write">
                <nav>
                    <h1>글쓰기</h1>
                </nav>
                <!-- 
                	파일 업로드 작업 과정
                	1) Tomcat 설정
                		- Servers > context.xml > <Context> 에 allowCasualMultipartParsing  = "true" 설정
                 		- Servers > server.xml > (line 64) maxPostSize = "10485760" (= 10MB)
                 		
                 	2) 파일 전송 폼 설정
                 		- form 태그에 enctype="multipart/form-data" 설정
                 		
                 	3) 업로드 로직 처리(별도의 lib 필요 X)
                 		- fileService.java : req.getParts() 파일 업로드 수행
                 		- workspace > metadata > .plugins > ....wst.server.core 
                 			> tmp0 > wtpwebapps > jboard 에 파일 업로드 확인
                 -->
                <form action="/jboard/article/write.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="writer" value="${sessUser.uid}" readonly>
                    <table border="0">                        
                        <tr>
                            <th>제목</th>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>파일</th>
                            <td>
                            	<p style="margin-bottom: 6px;">
                            		최대 2개 파일 첨부 가능, 각 파일 당 최대 10MB
                            	</p>
                                <input type="file" name="file1" />
                                <input type="file" name="file2" />
                            </td>
                        </tr>
                    </table>
                    
                    <div>
                        <a href="/jboard/article/list.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="작성완료" class="btn btnComplete"/>
                    </div>
                </form>

            </section>
        </main>
        <%@ include file="./_footer.jsp" %>
    </div>    
</body>
</html>