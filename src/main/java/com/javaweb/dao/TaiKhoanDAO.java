package com.javaweb.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.javaweb.connection.HibernateUtil;
import com.javaweb.model.TaiKhoan;

public class TaiKhoanDAO {
	private static SessionFactory factory;

	public TaiKhoanDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	public boolean dangNhap(String tendangnhap, String matkhau) {
		boolean result = false;
		if (tendangnhap != null && matkhau != null) {
			Session session = factory.openSession();
			Transaction tx = null;
			TaiKhoan tk = null;
			try {
				tx = session.beginTransaction();
				String hql = "SELECT TK FROM TaiKhoan TK WHERE TK.tendangnhap = :tendangnhap AND TK.matkhau = :matkhau";
				Query query = session.createQuery(hql);
				query.setParameter("tendangnhap", tendangnhap);
				query.setParameter("matkhau", matkhau);
				tk = (TaiKhoan) query.uniqueResult();
				if(tk!=null) {
					result = true;
				}
			} catch (HibernateException e) {
				result = false;
				if (tx != null)
					tx.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
		}
		return result;
	}
}
