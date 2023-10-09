<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.danhsachkhachhang.KhachHang" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Danh sach</title>
</head>
<body>
<table>
    <tr>
        <th>Name</th>
        <th>gioitinh</th>
        <th>address</th>
        <th>Picture</th>
    </tr>
    <%
        List<KhachHang> list = new ArrayList<>();
        list.add(new KhachHang("khanh dut","nu","HN","https://chocanh.vn/wp-content/uploads/hinh-anh-cho-corgi-7.jpg"));
        list.add(new KhachHang("kahnh dut","nu","HN","https://chocanh.vn/wp-content/uploads/hinh-anh-cho-corgi-7.jpg"));
        list.add(new KhachHang("kahnh dut","nu","HN","https://chocanh.vn/wp-content/uploads/hinh-anh-cho-corgi-7.jpg"));
        list.add(new KhachHang("kahnh dut","nu","HN","https://chocanh.vn/wp-content/uploads/hinh-anh-cho-corgi-7.jpg"));
        list.add(new KhachHang("kahnh dut","nu","HN","https://chocanh.vn/wp-content/uploads/hinh-anh-cho-corgi-7.jpg"));

        request.setAttribute("list",list);

    %>
    <c:forEach var="item" items="${list}">
        <tr>
            <td>${item.name}</td>
            <td>${item.gioitinh}</td>
            <td>${item.address}</td>
            <td><img src="${item.url}" alt="anh" style="width: 10px;height: 10px" ></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>