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

import com.javaweb.dao.KhoaDAO;
import com.javaweb.model.Khoa;

@Path("khoa")
public class KhoaResource {
	KhoaDAO khoaDao = new KhoaDAO();
	
	@GET
	@Path("/listkhoa")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Khoa> GetListKhoa(){
		return khoaDao.getAllKhoa();
	}
	
	@Path("/showbypage")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Khoa> ListKhoaByPage(@QueryParam("page") String page, @QueryParam("search") String search){
		return khoaDao.getListKhoa(Integer.parseInt(page), search);
	}
	
	@Path("/phantrang")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String Page(@QueryParam("search") String search){
		String res = String.valueOf(khoaDao.getCountKhoa(search));
		return res;
	}
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insertKhoa(Khoa model) {
		boolean res = khoaDao.insertKhoa(model);
		return res == true ? "true" : "false";
	}
	
	@GET
	@Path("/find/{makhoa}")
	@Produces(MediaType.APPLICATION_JSON)
	public Khoa GetKhoa(@PathParam("makhoa") int makhoa) {
		return khoaDao.getKhoaByMaKhoa(makhoa);
	}
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String UpdateKhoa(Khoa model) {
		boolean res = khoaDao.updateKhoa(model);
		return res == true ? "true" : "false";
	}
	
	@DELETE
	@Path("/delete/{makhoa}")
	public String deleteKhoa(@PathParam("makhoa") int makhoa) {
		boolean res = khoaDao.deleteKhoa(makhoa);
		return res == true ? "true" : "false";
	}
}
