<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$('document').ready(function(){
		$("#insertSinhVien").submit(function(){
			hoten = $("input[name='hoten']").val();
			gioitinh = $("input[name='gioitinh']:checked").val();
			ngaysinh = $("input[name='ngaysinh']").val();
			diachi = $("input[name='diachi']").val();
			email = $("input[name='email']").val();
			sodienthoai = $("input[name='sodienthoai']").val();
			
			var sinhvien = {
			        "hoten": hoten,
			        "gioitinh": gioitinh,
			        "ngaysinh": ngaysinh,
			        "diachi": diachi,
			        "email": email,
			        "sodienthoai": sodienthoai
			};
			$.ajax({
				type: "POST",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/sinhvien/create",
				contentType : 'application/json',
				data: JSON.stringify(sinhvien),
				success: function(result){
					if(result){
						location.reload();
						}else{
							alert('Có lỗi xảy ra!');
							}
					}
			}); 
		}); 
	});
	
</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Thêm mới sinh
							viên</h6>
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="insertSinhVien">
						<table class="table table-borderless">
							
							<tr>
								<th>Tên sinh viên:</th>
								<td><input type="text" name="hoten"
									
									class="form-control" /></td>
							</tr>

							<tr>
								<th>Giới tính:</th>
								<td><input type="radio" name="gioitinh" value="1" />Nam <input
									type="radio" name="gioitinh" value="0" />Nữ</td>
							</tr>
							<tr>
								<th>Ngày sinh:</th>
								<td><input type="date" name="ngaysinh"
									
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Địa chỉ:</th>
								<td><input type="text" name="diachi"
									
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Email:</th>
								<td><input type="text" name="email"
									
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Số điện thoại:</th>
								<td><input type="text" name="sodienthoai"
									
									class="form-control" /></td>
							</tr>
						</table>
						<button type="submit" class="btn btn-success">Lưu</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>