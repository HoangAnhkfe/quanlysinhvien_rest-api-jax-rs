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
	var search = "";
	var page = 1;
		$(document).ready(function(event) {
			load(search, page);
		});
		
		function load(search, page){
			$("#submittk").click(function(){
				search = $("input[name='search']").val();
				load(search, page);
				$("input[name='search']").val(search);
				})
			$("#dataTable").hide();
			$("#phantrang").hide();
			$.ajax({
				type : "GET",
				url : "http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/showbypage?search="+search+"&page="+page,
				success : function(result) {
					if (result != null) {
						$("#dataTable").find("tr:gt(0)").remove();
						var table = $("#dataTable");
						$.each(result, function(key, value) {
							$("#dataTable").append('<tbody><tr ><td>'+value.machuyennganh+'</td><td>'+value.tenchuyennganh+'</td><td>'+value.khoa.tenkhoa+'</td><td><button data-id="'+value.machuyennganh+'" class="sua btn btn-primary">Sửa</button><button data-id="'+value.machuyennganh+'" class="xoa btn btn-success">Xóa</button></td></tr></tbody>');
							$(".sua").off('click').on(
									'click',
									function(e) {
										var x = $(this).data('id');
										sessionStorage.setItem("machuyennganh", x);
										window.location.replace("http://localhost:8080/quanlysinhvien_jax-rs/quan-ly-chuyen-nganh?action=suachuyennganh");
										});
							$(".xoa").off('click').on(
									'click',
									function(e) {
										$('#xoaModal').modal('show');
										var y = $(this).data('id');
										$("#srcXoa").val("http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/delete/"+y);
										$(".delete").click(function(){
											$.ajax({
												type:"DELETE",
												url : $("#srcXoa").val(),
											    success:function(result){
											    	$('#xoaModal').modal('hide');
												    if(result){
												    	load(search, page);
													    }
												    else{
													    alert("Co loi xay ra!");
													    }
												    }
												});
											})
										
									});
						});
					}
				}
			});
			$.ajax({
				type : "GET",
				url : "http://localhost:8080/quanlysinhvien_jax-rs/webapi/chuyennganh/phantrang?search="+search,
				success : function(result) {
					if (result != null) {
						$("#phantrang").find("li").remove();
						var ul = $("#phantrang");
						for(var i = 1; i <= result;i++){
							
							$("#phantrang").append('<li class="paginate_button page-item pt" id="'+i+'"><a href="#" aria-controls="dataTable" data-dt-idx="'+i+'" tabindex="0" class="page-link">'+i+'</a></li>');
							}
						
						$('li').on('click', function () {
							page = this.id;
							load(search, page);
						});
						
					}
				}
			});
			$("#dataTable").show();
			$("#phantrang").show();
			}
	</script>
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">Quản lý chuyên
					ngành</h6>
			</div>
			<div class="card-body">
				<div class="table">
					<div id="dataTable_wrapper"
						class="dataTables_wrapper dt-bootstrap4">
						<div class="row">
							<div class="col-md-3">
								<form 
									class="d-none d-sm-inline-block form-inline mr-auto  my-2 my-md-0 mw-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											aria-label="search"
											aria-describedby="basic-addon2" name="search">
									</div>
								</form>
							</div>
							<div class="col-md-9">
							<button class="btn btn-primary" id="submittk">
												<i class="fas fa-search fa-sm"></i>
											</button>
								<a
									href="/quanlysinhvien_jax-rs/quan-ly-chuyen-nganh?action=themmoichuyennganh"
									class="btn btn-success">Thêm mới</a>
							</div>

						</div>
						<div class="row">
							<div class="col-sm-12">
								<hr />
								<table class="table table-bordered dataTable" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr role="row">
											<th class="sorting_asc" tabindex="0"
												aria-controls="dataTable" rowspan="1" colspan="1"
												aria-sort="ascending"
												aria-label="Name: activate to sort column descending"
												style="width: 161px;">Mã chuyên ngành</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Position: activate to sort column ascending"
												style="width: 246px;">Tên chuyên ngành</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 116px;">Khoa</th>
											<th class="sorting" tabindex="0" aria-controls="dataTable"
												rowspan="1" colspan="1"
												aria-label="Office: activate to sort column ascending"
												style="width: 116px;">Thao tác</th>
										</tr>
									</thead>
									
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers"
									id="dataTable_paginate">
									<ul class="pagination" id="phantrang">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <script src="<c:url value='teamplate/vendor/jquery/jquery.min.js'/>"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var x = $
			{
				page
			}
			;
			$("#" + x).attr("class", "paginate_button page-item active");
		});
		$('.xoa')
				.off('click')
				.on(
						'click',
						function(e) {
							$('#xoaModal').modal('show');
							var y = $(this).data('id');
							$('#delete')
									.attr(
											'href',
											"/quanlysinhvien_hibernate/quan-ly-chuyen-nganh?action=xoachuyennganh&machuyennganh="
													+ y);
						})
	</script> --%>
</body>
</html>