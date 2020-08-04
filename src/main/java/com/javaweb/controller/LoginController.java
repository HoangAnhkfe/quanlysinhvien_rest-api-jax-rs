package com.javaweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MultivaluedMap;

import com.javaweb.dao.TaiKhoanDAO;
import com.javaweb.model.TaiKhoan;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;
@WebServlet(urlPatterns = {"/dang-nhap"})
public class LoginController extends HttpServlet {
	private TaiKhoanDAO taiKhoanDao;
	public LoginController() {
		taiKhoanDao = new TaiKhoanDAO();
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher view = req.getRequestDispatcher("/views/login.jsp");
		view.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tendangnhap = req.getParameter("tendangnhap");
		String matkhau = req.getParameter("matkhau");
		String URI = "http://localhost:8080/quanlysinhvien_jax-rs/webapi/taikhoan";
		Client client = Client.create();
		client.setFollowRedirects(Boolean.TRUE);
		WebResource resource = client.resource(URI);
		MultivaluedMap<String, String> queryParams = new MultivaluedMapImpl();
		queryParams.add("tendangnhap", tendangnhap);
		queryParams.add("matkhau", matkhau);
		//==========Login==========//
		String res = resource.path("checklogin").queryParams(queryParams).get(String.class);
		boolean result = Boolean.parseBoolean(res);
		if(!result) {
			req.setAttribute("ThongBao", "Tài khoản hoặc mật khẩu không chính xác!");
			RequestDispatcher view = req.getRequestDispatcher("/views/login.jsp");
			view.forward(req, resp);
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("Admin", tendangnhap);
			resp.sendRedirect("trang-chu");
		}
	}
	

}
