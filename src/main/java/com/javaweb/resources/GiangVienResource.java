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

import com.javaweb.dao.GiangVienDAO;
import com.javaweb.model.GiangVien;

@Path("giangvien")
public class GiangVienResource {
	GiangVienDAO giangVienDao = new GiangVienDAO();
	
	@GET
	@Path("/listgiangvien")
	@Produces(MediaType.APPLICATION_JSON)
	public List<GiangVien> GetListGiangVien(){
		return giangVienDao.getAllGiangVien();
	}
	
	@Path("/showbypage")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<GiangVien> ListChuyenNganhByPage(@QueryParam("page") int page, @QueryParam("search") String search) {
		return giangVienDao.getListGiangVien(page, search);
	}
	
	@Path("/phantrang")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String Page(@QueryParam("search") String search){
		String res = String.valueOf(giangVienDao.getCountGiangVien(search));
		return res;
	}
	
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insertGiangVien(GiangVien model) {
		boolean res = giangVienDao.insertGiangVien(model);
		return res == true ? "true" : "false";
	}
	
	@GET
	@Path("/find/{magiangvien}")
	@Produces(MediaType.APPLICATION_JSON)
	public GiangVien GetKhoa(@PathParam("magiangvien") int magiangvien) {
		return giangVienDao.getGiangVienByMaGiangVien(magiangvien);
	}
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String UpdateGiangVien(GiangVien model) {
		boolean res = giangVienDao.updateGiangVien(model);
		return res == true ? "true" : "false";
	}
	
	@DELETE
	@Path("/delete/{magiangvien}")
	public String deleteKhoa(@PathParam("magiangvien") int magiangvien) {
		boolean res = giangVienDao.deleteGiangVien(magiangvien);
		return res == true ? "true" : "false";
	}
}
