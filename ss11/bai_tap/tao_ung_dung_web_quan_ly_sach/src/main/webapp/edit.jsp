<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 8/29/2023
  Time: 8:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">
<div align="center">
    <form method="post" action="books?action=edit">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Sửa Thông Tin Sách
                </h2>
            </caption>
            <input itemid="" type="hidden" name="id" value="<c:out value='${books.id}'/>">
            <tr>
                <th>Tiêu Đề :</th>
                <td>
                    <input type="text" name="title" size="45"
                           value="<c:out value='${books.title}' />"/>
                </td>
            </tr>
            <tr>
                <th>Số Trang :</th>
                <td>
                    <input type="text" name="pagesize" size="45"
                           value="<c:out value='${books.pagesize}'  />"
                    />
                </td>
            </tr>
            <tr>
                <th>Tác Giả :</th>
                <td>
                    <input type="text" name="author" size="45"
                           value="<c:out value='${books.author}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Thể Loại :</th>
                <td>
                   <select name="category">
                       <option value="1">Khoa Học</option>
                       <option value="2">Tự Nhiên</option>
                       <option value="3">Xã Hội</option>
                       <option value="4">Truyện</option>
                       <option value="5">Tiểu Thuyết</option>
                       <option value="6">Khác</option>
                   </select>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
