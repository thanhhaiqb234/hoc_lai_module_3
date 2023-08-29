<%--
  Created by IntelliJ IDEA.
  User: thanh
  Date: 8/28/2023
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<table class="table">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Tiêu Đề</th>
        <th scope="col">Số Trang</th>
        <th scope="col">Tác Giả</th>
        <th scope="col">Thể Loại</th>
        <th scope="col">Xóa</th>
        <th scope="col">Sửa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${bookList}" varStatus="book" var="bookList">
        <tr>
            <td><c:out value="${book.count}"/></td>
            <td><c:out value="${bookList.title}"/></td>
            <td><c:out value="${bookList.pagesize}"/></td>
            <td><c:out value="${bookList.author}"/></td>
            <td><c:out value="${bookList.category}"/></td>
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#delete${bookList.id}">
                    Xóa
                </button>
                <form method="post" action="book-servlet?action=delete&code=${bookList.id}">
                    <div class="modal fade" id="delete${bookList.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Bạn Có muốn xóa quyển sách: ${bookList.title}
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Thoát</button>
                                    <button type="submit" class="btn btn-primary">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </td>
            <td>
                <button type="button" class="btn btn-danger" onclick="window.location.href ='book-servlet?action=edit&code=${bookList.id}'">
                    Sửa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
