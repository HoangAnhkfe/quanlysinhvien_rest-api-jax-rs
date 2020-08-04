<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
</head>
<body>
<script type="text/javascript">
$('document').ready(function(){
	var makhoa = sessionStorage.getItem("makhoa");
	load(makhoa);
	
});
function load(makhoa){
	$.ajax({
		type: "GET",
		url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/khoa/find/"+makhoa,
		success : function(result) {
			$("input[name='makhoa']").val(result.makhoa);
			$("input[name='tenkhoa']").val(result.tenkhoa);
			$("input[name='sodienthoai']").val(result.sodienthoai);
			update();
			}
		});
	function update(){
		$("#updateKhoa").submit(function(){
			makhoan = $("input[name='makhoa']").val();
			tenkhoa = $("input[name='tenkhoa']").val();
			sodienthoai = $("input[name='sodienthoai']").val();
			var khoa = {
					"makhoa": makhoan,
					"tenkhoa": tenkhoa,
					"sodienthoai": sodienthoai
					};
			$.ajax({
				type: "PUT",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/khoa/update",
				contentType : 'application/json',
				data: JSON.stringify(khoa),
				success: function(result){
					if(result === "true"){
						sessionStorage.clear();
						location.reload();
						}else{
							alert('Có lỗi xảy ra!');
							}
					}
				})
			})
		}
}
</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Cập nhật thông tin khoa:
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="updateKhoa">
						<table class="table table-borderless">
							<tr>
								<th>Mã khoa:</th>
								<td><input type="text" name="makhoa" readonly="readonly"
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Tên khoa:</th>
								<td><input type="text" name="tenkhoa" class="form-control" /></td>
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