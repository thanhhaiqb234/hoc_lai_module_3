<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 8/25/2023
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1px " style="color: darkslateblue">
    <thead>
    <tr>
        <th>STT</th>
        <th>Tên Học Sinh</th>
        <th>Giới Tính</th>
        <th>Điểm</th>
        <th>Xếp Loại</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${hocSinhList}" varStatus="hocSinhList" var="hocSinh">
        <tr>
            <td><c:out value="${hocSinhList.count}"></c:out></td>
            <td><c:out value="${hocSinh.tenHocVien}"></c:out></td>
            <c:if test="${hocSinh.gioiTinh == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${hocSinh.gioiTinh == false}">
                <td>Nữ</td>
            </c:if>
            <td><c:out value="${hocSinh.diem}"></c:out></td>

            <c:choose>
                <c:when test="${hocSinh.diem >= 90}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${hocSinh.diem >= 80}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${hocSinh.diem >= 60}">
                    <td>Trung Bình</td>
                </c:when>
                <c:when test="${hocSinh.diem < 60}">
                    <td>Yếu</td>
                </c:when>
            </c:choose>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
