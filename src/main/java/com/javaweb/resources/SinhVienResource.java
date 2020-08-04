package com.javaweb.resources;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.javaweb.dao.SinhVienDAO;
import com.javaweb.model.GiangVien;
import com.javaweb.model.SinhVien;

@Path("sinhvien")
public class SinhVienResource {
	SinhVienDAO sinhvienDao = new SinhVienDAO();
	
	@Path("/showbypage")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<SinhVien> ListChuyenNganhByPage(@QueryParam("page") int page, @QueryParam("search") String search) {
		return sinhvienDao.getListSinhVien(page, search);
	}

	@Path("/phantrang")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String Page(@QueryParam("search") String search) {
		String res = String.valueOf(sinhvienDao.getCountSinhVien(search));
		return res;
	}

	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insertSinhVien(SinhVien model) {
		boolean res = sinhvienDao.insertSinhVien(model);
		return res == true ? "true" : "false";
	}

	@GET
	@Path("/find/{masinhvien}")
	@Produces(MediaType.APPLICATION_JSON)
	public SinhVien GetSinhVien(@PathParam("masinhvien") int masinhvien) {
		return sinhvienDao.getSinhViennByMaSinhVien(masinhvien);
	}

	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String UpdateSinhVien(SinhVien model) {
		boolean res = sinhvienDao.updateSinhVien(model);
		return res == true ? "true" : "false";
	}

	@DELETE
	@Path("/delete/{masinhvien}")
	public String deleteSinhVien(@PathParam("masinhvien") int masinhvien) {
		boolean res = sinhvienDao.deleteSinhVien(masinhvien);
		return res == true ? "true" : "false";
	}
}
