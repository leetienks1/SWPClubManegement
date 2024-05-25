<%-- 
    Document   : addNews
    Created on : May 25, 2024, 2:40:53 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    </head>
    <body>
        <h1><c:choose>
                <c:when test="${news.id != 0}">Sửa Tin tức</c:when>
                <c:otherwise>Thêm Tin tức</c:otherwise>
            </c:choose></h1>
        <form action="news" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${news.id}" />
            <label for="title">Tiêu đề:</label>
            <input type="text" name="title" value="${news.title}" required /><br>
            <label for="content">Nội dung:</label>
            <textarea name="content" required>${news.content}</textarea><br>
            <input type="submit" value="Lưu" />
        </form>
        <script>
            CKEDITOR.replace('content', {
                filebrowserUploadUrl: 'upload',
                filebrowserUploadMethod: 'form'
            });
        </script>
    </body>
</html>
