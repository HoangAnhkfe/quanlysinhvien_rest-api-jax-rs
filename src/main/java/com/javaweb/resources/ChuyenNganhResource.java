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

import com.javaweb.dao.ChuyenNganhDAO;
import com.javaweb.model.ChuyenNganh;

@Path("chuyennganh")
public class ChuyenNganhResource {
	ChuyenNganhDAO chuyenNganhDao = new ChuyenNganhDAO();
	
	@GET
	@Path("/listchuyennganh")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ChuyenNganh> GetListGiangVien(){
		return chuyenNganhDao.getAllChuyenNganh();
	}
	
	@Path("/showbypage")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<ChuyenNganh> ListChuyenNganhByPage(@QueryParam("page") int page, @QueryParam("search") String search) {
		return chuyenNganhDao.getListChuyenNganh(page, search);
	}
	
	@Path("/phantrang")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String Page(@QueryParam("search") String search){
		String res = String.valueOf(chuyenNganhDao.getCountChuyenNganh(search));
		return res;
	}
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insertKhoa(ChuyenNganh model) {
		boolean res = chuyenNganhDao.insertChuyenNganh(model);
		return res == true ? "true" : "false";
	}
	
	@GET
	@Path("/find/{machuyenganh}")
	@Produces(MediaType.APPLICATION_JSON)
	public ChuyenNganh GetKhoa(@PathParam("machuyenganh") int machuyenganh) {
		return chuyenNganhDao.getChuyenNganhByMaChuyenNganh(machuyenganh);
	}
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String UpdateKhoa(ChuyenNganh model) {
		boolean res = chuyenNganhDao.updateChuyenNganh(model);
		return res == true ? "true" : "false";
	}
	
	@DELETE
	@Path("/delete/{machuyennganh}")
	public String deleteKhoa(@PathParam("machuyennganh") int machuyennganh) {
		boolean res = chuyenNganhDao.deleteChuyenNganh(machuyennganh);
		return res == true ? "true" : "false";
	}
}
