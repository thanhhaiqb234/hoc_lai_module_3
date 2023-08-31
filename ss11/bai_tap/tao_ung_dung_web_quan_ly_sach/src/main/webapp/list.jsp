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
    <form action="books?action=search" method="post">
        <tr>
            <td>
                <input type="text" name="search">
                <button type="submit" value="sumit">Search</button>
            </td>
            <td>
                <button><a href="create.jsp" style="text-decoration: none">Thêm Mới Sách</a></button>
            </td>
        </tr>
    </form>

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
            <c:if test="${bookList.category == 1}">
                <td>Khoa Học</td>
            </c:if>
            <c:if test="${bookList.category == 2}">
                <td>Tự Nhiên</td>
            </c:if>
            <c:if test="${bookList.category == 3}">
                <td>Xã Hội</td>
            </c:if>
            <c:if test="${bookList.category == 4}">
                <td>Truyện</td>
            </c:if>
            <c:if test="${bookList.category == 5}">
                <td>Tiểu Thuyết</td>
            </c:if>
            <c:if test="${bookList.category == 6}">
                <td>Khác</td>
            </c:if>
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                        data-bs-target="#delete" id="buttonbook"
                        onclick="idBook('${bookList.id}','${bookList.title}')">
                    Xóa
                </button>
            </td>
            <td>
                <button type="button" class="btn btn-danger"
                        onclick="window.location.href ='books?action=edit&code=${bookList.id}'">
                    Sửa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<form method="post" action="books?action=delete">
    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xóa Sách</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="id">
                    Bạn Có Muốn Xóa Quyển Sách: <span id="thongBao"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </div>
        </div>
    </div>
</form>
<form>

</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<script>
    function idBook(id, name) {
        document.getElementById('id').value = id;
        document.getElementById('thongBao').innerText = name;
    }

    function suaBook(id, name, soTrang, tacGia, theLoai) {
        document.getElementById('idsua').innerText = id;
        document.getElementById('idsua').innerText = name;
        document.getElementById('idsua').innerText = soTrang;
        document.getElementById('idsua').innerText = tacGia;
        document.getElementById('idsua').innerText = theLoai;
    }
</script>
</body>

</html>