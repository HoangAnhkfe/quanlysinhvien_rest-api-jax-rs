package com.javaweb.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/quan-ly-lop-nien-che"})
public class LopNienCheController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String INSERT = "/views/lopnienche/themmoilopnienche.jsp";
	private String EDIT = "/views/lopnienche/sualopnienche.jsp";
	private String LIST = "/views/lopnienche/quanlylopnienche.jsp";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String forward = "";
		String action = req.getParameter("action");
		if (action == null) {
			forward = LIST;
		} else {
			if (action.equalsIgnoreCase("themmoilopnienche")) {
				forward = INSERT;

			} else if (action.equalsIgnoreCase("sualopnienche")) {

				forward = EDIT;

			}
		}

		RequestDispatcher view = req.getRequestDispatcher(forward);
		view.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
