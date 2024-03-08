<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin thanh toán</title>
    <style>
        /* CSS cho hình ảnh mã QR */
        .qr-code {
            text-align: center;
            margin-top: 50px;
        }
        
        /* CSS cho bảng thông tin người nhận */
        .recipient-info {
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
            background-color: #f2f2f2; /* Màu nền cho toàn bộ bảng */
            border-collapse: collapse;
        }

        /* CSS cho các hàng chẵn và lẻ */
        .recipient-info tr:nth-child(even) {
            background-color: #dddddd; /* Màu nền cho hàng chẵn */
        }

        .recipient-info tr:nth-child(odd) {
            background-color: #ffffff; /* Màu nền cho hàng lẻ */
        }

        /* CSS cho các ô tiêu đề */
        .recipient-info th {
            background-color: #4CAF50; /* Màu nền cho ô tiêu đề */
            color: white;
            padding: 10px;
        }

        /* CSS cho các ô dữ liệu */
        .recipient-info td {
            padding: 10px;
            text-align: left;
        }

        /* CSS cho nút thanh toán */
        .payment-button {
            display: block;
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    
    <!-- Hình ảnh mã QR -->
    <div class="qr-code">
        <!-- Đường dẫn đến hình ảnh mã QR -->
        <img src="./img/qr.jpg" alt="QR Code">
    </div>
    
    <!-- Bảng thông tin người nhận -->
    <table class="recipient-info" border="1">
        <tr>
            <th>Tên ngân hàng</th>
            <td>BIDV Bank</td>
        </tr>
        <tr>
            <th>Số tiền khoản</th>
            <td>4270999931</td>
        </tr>
        <tr>
            <th>Chủ tài khoản</th>
            <td>DINH QUANG DUY</td>
        </tr>
        <tr>
            <th>Số tiền</th>
            <td>${amount}</td>
        </tr>
    </table>

    <!-- Thêm mã JavaScript nếu cần -->
    <script>
        function confirmPayment() {
            // Xử lý khi nhấn nút đã thanh toán
            alert("Đã thanh toán thành công!");
        }
    </script>
</body>
</html>
