<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1px>
		<thead>
			<tr>
				<th>Seller</th>
				<th>Selling Item</th>
				<th>Buyer</th>
				<th>Exchange Item</th>
				<th>Status</th>
				<th>Last Edited Time</th>
			</tr>
		</thead>
		<tbody>
			<#list orderList as order>
			<tr>
				<td>${order.sellerid}</td>
				<td>${order.sellgoodsid}</td>
				<td>${order.buyerid}</td>
				<td>${order.exchangegoodsid}</td>
				<td>${order.status}</td>
				<td>${order.lastactiontime}</td>
			</tr>
			</#list>
		</tbody>
	</table>
</body>
</html>