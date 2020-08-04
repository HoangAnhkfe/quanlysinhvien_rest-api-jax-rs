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
		var malopnienche = sessionStorage.getItem("malopnienche");
		load(malopnienche);
		$("#updateLopNienChe").submit(function(){
			tenlopnienche = $("input[name='tenlopnienche']").val();
			nienkhoa = $("input[name='nienkhoa']").val();
			siso = $("input[name='siso']").val();
			machuyennganh = $('#chuyennganh').val();
			magiangvien = $('#giangvien').val();
			var machuyennganh;
			var tenchuyennganh;
			var makhoacn;
			var tenkhoacn;
			var magiangvien;
			var tengiangvien;
			var gioitinh;
			var ngaysinh;
			var sodienthoai;
			var diachi;
			var email;
			var makhoagv;
			var tenkhoagv;
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/find/"+machuyennganh,
				success: function(result){
					if(result!=null){
						machuyennganh= result.machuyennganh;
						tenchuyennganh= result.tenchuyennganh;
						makhoacn= result.khoa.makhoa;
						tenkhoacn= result.khoa.tenkhoa;
					}
				}
				
			});
			$.ajax({
				type: "GET",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/giangvien/find/"+magiangvien,
				success: function(result){
					if(result!=null){
								magiangvien= result.mangiangvien;
								tengiangvien= result.tengiangvien;
								gioitinh= result.gioitinh;
								ngaysinh= result.ngaysinh;
								sodienthoai= result.sodienthoai;
								diachi= result.diachi;
								email= result.email;
								makhoagv= result.khoa.makhoa;
								tenkhoagv= result.khoa.tenkhoa;
					}
				}
				
			});
			var lopnienche = {
					"malopnienche": malopnienche, 
			        "tenlopnienche": tenlopnienche,
			        "nienkhoa": nienkhoa,
			        "siso": siso,
			        "chuyennganh":{
			        	"machuyennganh": machuyennganh,
						"tenchuyennganh": tenchuyennganh,
						"khoa": {
								"makhoa": makhoacn,
								"tenkhoa": tenkhoacn
						}
				        },
			        "giangvien":{
				        "magiangvien": magiangvien,
				        "tengiangvien": tengiangvien,
				        "gioitinh": gioitinh,
				        "ngaysinh": ngaysinh,
				        "sodienthoai": sodienthoai,
				        "diachi": diachi,
				        "email": email,
				        "khoa": {
							"makhoa": makhoagv,
							"tenkhoa": tenkhoagv
					}
				        }
			};
			$.ajax({
				type: "PUT",
				url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/lopnienche/update",
				contentType : 'application/json',
				data: JSON.stringify(lopnienche),
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
	function load(malopnienche){
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/lopnienche/find/"+malopnienche,
			success : function(result) {
				$("input[name='malopnienche']").val(result.malopnienche);
				$("input[name='tenlopnienche']").val(result.tenlopnienche);
				$("input[name='nienkhoa']").val(result.nienkhoa);
				$("input[name='siso']").val(result.siso);
				}
			});
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/listchuyennganh",
			success: function(result){
				if(result!=null){
					var chuyennganh = $('#chuyennganh');
					chuyennganh.find('option').remove();
					$.each(result, function(key, value){
						$('<option>').val(value.machuyennganh).text(value.tenchuyennganh).appendTo(chuyennganh);
					})
				}
			}
		});
		$.ajax({
			type: "GET",
			url: "http://localhost:8080/quanlysinhvien_jax-rs/webapi/giangvien/listgiangvien",
			success: function(result){
				if(result!=null){
					var giangvien = $('#giangvien');
					giangvien.find('option').remove();
					$.each(result, function(key, value){
						$('<option>').val(value.magiangvien).text(value.tengiangvien).appendTo(giangvien);
					})
				}
			}
		});
	}
</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Cập nhật thông tin lớp niên chế</h6>
			</div>
			<div class="card-body">
				<div class="col-sm-6">
					<form id="updateLopNienChe">
						<table class="table table-borderless">
							<tr>
								<th>Mã lớp niên chế:</th>
								<td><input type="text" name="malopnienche"
									 class="form-control" readonly="readonly"/></td>
							</tr>
							<tr>
								<th>Tên lớp niên chế:</th>
								<td><input type="text" name="tenlopnienche"
									 class="form-control" /></td>
							</tr>
							<tr>
								<th>Niên khóa:</th>
								<td><input type="text" name="nienkhoa"
									
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Sĩ số:</th>
								<td><input type="text" name="siso"
									
									class="form-control" /></td>
							</tr>
							<tr>
								<th>Chuyên Ngành:</th>
								<td><select id="chuyennganh" class="form-control">

								</select></td>
							</tr>
							<tr>
								<th>Giảng Viên:</th>
								<td><select id="giangvien" class="form-control">

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