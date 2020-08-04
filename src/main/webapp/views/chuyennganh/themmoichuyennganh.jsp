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
			load();
			$("#insertChuyenNganh").submit(function(){
				tenchuyennganh = $("input[name='tenchuyennganh']").val();
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
				var chuyenganh = {
						"khoa": {
				            "makhoa": makhoa,
				            "sodienthoai": sodienthoai,
				            "tenkhoa": tenkhoa
				        },
				        "tenchuyennganh": tenchuyennganh
				};
				$.ajax({
					type: "POST",
					url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/create",
					contentType : 'application/json',
					data: JSON.stringify(chuyenganh),
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
		function load(){
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
				<h6 class="m-0 font-weight-bold text-primary">Thêm mới chuyên
					ngành</h6>
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="insertChuyenNganh">
						<table class="table table-borderless">
							<tr>
								<th>Tên chuyên ngành:</th>
								<td><input type="text" name="tenchuyennganh"
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Khoa:</th>
								<td><select id="khoa" class="form-control" >
										
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