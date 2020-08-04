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

import com.javaweb.dao.LopNienCheDAO;
import com.javaweb.model.LopNienChe;

@Path("lopnienche")
public class LopNienCheResource {
	LopNienCheDAO lopNienCheDao = new LopNienCheDAO();

	@GET
	@Path("/listlopnienche")
	@Produces(MediaType.APPLICATION_JSON)
	public List<LopNienChe> GetListGiangVien(){
		return lopNienCheDao.getAllLopNienChe();
	}
	
	@Path("/showbypage")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<LopNienChe> ListLopNienCheByPage(@QueryParam("page") int page, @QueryParam("search") String search) {
		return lopNienCheDao.getListLopNienChe(page, search);
	}

	@Path("/phantrang")
	@GET
	@Produces(MediaType.TEXT_PLAIN)
	public String Page(@QueryParam("search") String search) {
		String res = String.valueOf(lopNienCheDao.getCountLopNienChe(search));
		return res;
	}

	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String insertLopNienChe(LopNienChe model) {
		boolean res = lopNienCheDao.insertLopNienChe(model);
		return res == true ? "true" : "false";
	}

	@GET
	@Path("/find/{malopnienche}")
	@Produces(MediaType.APPLICATION_JSON)
	public LopNienChe GetLopNienChe(@PathParam("malopnienche") int malopnienche) {
		return lopNienCheDao.getLopNienCheByMaLopNienChe(malopnienche);
	}

	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public String UpdateLopNienChe(LopNienChe model) {
		boolean res = lopNienCheDao.updateLopNienChe(model);
		return res == true ? "true" : "false";
	}

	@DELETE
	@Path("/delete/{malopnienche}")
	public String deleteLopNienChe(@PathParam("malopnienche") int malopnienche) {
		boolean res = lopNienCheDao.deleteLopNienChe(malopnienche);
		return res == true ? "true" : "false";
	}
}
