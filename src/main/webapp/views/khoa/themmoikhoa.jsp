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
			$("#insertKhoa").submit(function(){
				tenkhoa = $("input[name='tenkhoa']").val();
				sodienthoai = $("input[name='sodienthoai']").val();
				var khoa = {
						"tenkhoa": tenkhoa,
						"sodienthoai": sodienthoai
						};
				$.ajax({
					type: "POST",
					url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/khoa/create",
					contentType : 'application/json',
					data: JSON.stringify(khoa),
					success: function(result){
						if(result){
							location.reload();
							}else{
								alert('Có lỗi xảy ra!');
								}
						}
					})
				})
			});
	</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				
					<h6 class="m-0 font-weight-bold text-primary">Thêm mới khoa</h6>
				
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="insertKhoa">
						<table class="table table-borderless">
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