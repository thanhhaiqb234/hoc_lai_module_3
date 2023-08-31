<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 8/31/2023
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="books?action=create" style="border: black solid 1px ; width: 30%" >
  <h2>Thêm Mới sách</h2>
  <tr>
    <th>Tiêu Đề</th>
    <td><input name="title" type="text" style="width: 30%"></td>
  </tr>
  <br><br>
  <tr>
    <th>Số Trang</th>
    <td><input name="pagesize" type="text" style="width: 30%"></td>
  </tr>
  <br><br><br>
  <tr>
    <th>Tác Giả</th>
    <td><input name="author" type="text" style="width: 30%"></td>
  </tr>
  <br><br><br>
  <tr>
    <th>Thể Loại</th>
    <td><input name="category" type="text" style="width: 30%"></td>
  </tr>
  <br><br><br>
  <tr >
    <td style="text-align: center">
      <button type="submit">Thêm Mới</button>
    </td>
  </tr>
</form>
</body>
</html>
