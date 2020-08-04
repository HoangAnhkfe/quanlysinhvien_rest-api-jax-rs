package com.javaweb.resources;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.javaweb.dao.TaiKhoanDAO;

@Path("taikhoan")
public class TaiKhoanResource {
	TaiKhoanDAO taiKhoanDao = new TaiKhoanDAO();
	
	@Path("/checklogin")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public String CheckLogin(@QueryParam("tendangnhap") String tendangnhap, @QueryParam("matkhau") String matkhau) {
		boolean result = taiKhoanDao.dangNhap(tendangnhap, matkhau);
		return result == true ? "true" : "false";
	}
}
