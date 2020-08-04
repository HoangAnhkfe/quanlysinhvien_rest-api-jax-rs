<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$('document').ready(function(){
		var magiangvien = sessionStorage.getItem("magiangvien");
		load(magiangvien);
		$("#updateGiangVien").submit(function(){
			magiangvien = $("input[name='magiangvien']").val();
			tengiangvien = $("input[name='tengiangvien']").val();
			gioitinh = $("input[name='gioitinh']:checked").val();
			ngaysinh = $("input[name='ngaysinh']").val();
			diachi = $("input[name='diachi']").val();
			email = $("input[name='email']").val();
			sodienthoai = $("input[name='sodienthoai']").val();
			makhoa = $('#khoa').val();
			var tenkhoa;
			var sodienthoai;
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/khoa/find/"+makhoa,
				success: function(result){
					if(result!=null){
						tenkhoa = result.tenkhoa;
						sodienthoai = result.sodienthoai;
					}
				}
				
			});
			var giangvien = {
					"khoa": {
			            "makhoa": makhoa,
			            "sodienthoai": sodienthoai,
			            "tenkhoa": tenkhoa
			        },
			        "magiangvien": magiangvien,
			        "tengiangvien": tengiangvien,
			        "gioitinh": gioitinh,
			        "ngaysinh": ngaysinh,
			        "diachi": diachi,
			        "email": email,
			        "sodienthoai": sodienthoai
			};
			$.ajax({
				type: "PUT",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/giangvien/update",
				contentType : 'application/json',
				data: JSON.stringify(giangvien),
				success: function(result){
					if(result){
						sessionStorage.clear();
						location.reload();
						}else{
							alert('Có lỗi xảy ra!');
							}
					}
			}); 
		});  
	});
	function load(magiangvien){
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/giangvien/find/"+magiangvien,
			success : function(result) {
				$("input[name='magiangvien']").val(result.magiangvien);
				$("input[name='tengiangvien']").val(result.tengiangvien);
				result.gioitinh == 1 ? ($("#nam").prop("checked", true)) : ($("#nu").prop("checked", true));
				$("input[name='ngaysinh']").val(result.ngaysinh);
				$("input[name='diachi']").val(result.diachi);
				$("input[name='email']").val(result.email);
				$("input[name='sodienthoai']").val(result.sodienthoai);
				}
			});
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/khoa/listkhoa",
			success: function(result){
				if(result!=null){
					var khoa = $('#khoa');
					khoa.find('option').remove();
					$.each(result, function(key, value){
						$('<option>').val(value.makhoa).text(value.tenkhoa).appendTo(khoa);
					})
				}
			}
		});
	}
</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Cập nhật thông tin giảng
					viên</h6>
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="updateGiangVien">
						<table class="table table-borderless">
						<tr>
								<th>Mã giảng viên:</th>
								<td><input type="text" name="magiangvien"
									class="form-control" readonly="readonly"/></td>
							</tr>
						
							<tr>
								<th>Tên giảng viên:</th>
								<td><input type="text" name="tengiangvien"
									class="form-control" /></td>
							</tr>

							<tr>
								<th>Giới tính:</th>
								<td><input type="radio" name="gioitinh" value="1" id="nam"/>Nam <input
									type="radio" name="gioitinh" value="0" id="nu"/>Nữ</td>
							</tr>
							<tr>
								<th>Ngày sinh:</th>
								<td><input type="date" name="ngaysinh" class="form-control" /></td>
							</tr>
							<tr>
								<th>Địa chỉ:</th>
								<td><input type="text" name="diachi" class="form-control" /></td>
							</tr>
							<tr>
								<th>Email:</th>
								<td><input type="text" name="email" class="form-control" /></td>
							</tr>
							<tr>
								<th>Số điện thoại:</th>
								<td><input type="text" name="sodienthoai"
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Khoa:</th>
								<td><select id="khoa" class="form-control">

								</select></td>
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