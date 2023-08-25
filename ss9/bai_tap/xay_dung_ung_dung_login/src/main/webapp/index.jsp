<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="logins?action=login" method="post" style="border: darkslateblue solid 1px">
    <tr>
            <th>
                <h3>Username</h3>
                <input name="username" style="width: 200px">
            </th>
            <th>
                <h3>Password</h3>
                <input name="password" style="width: 200px">
            </th>
        <br>
            <th>
                <button style="width: 100px ; height: 50px">Sumit</button>
            </th>
            <th>
                <h3>
                    <p>Thông Báo : ${thongBao} </p>
                </h3>
            </th>
    </tr>
</form>
</body>
</html>