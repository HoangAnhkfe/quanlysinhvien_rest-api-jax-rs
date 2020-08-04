package com.javaweb.model;

import java.sql.Date;

public class SinhVien {
	private int masinhvien;
	private String hoten;
	private Date ngaysinh;
	private byte gioitinh;
	private String diachi;
	private String email;
	private String sodienthoai;
	public SinhVien() {
		super();
	}
	public SinhVien(String hoten, Date ngaysinh, byte gioitinh, String diachi, String email, String sodienthoai) {
		super();
		this.hoten = hoten;
		this.ngaysinh = ngaysinh;
		this.gioitinh = gioitinh;
		this.diachi = diachi;
		this.email = email;
		this.sodienthoai = sodienthoai;
	}
	public int getMasinhvien() {
		return masinhvien;
	}
	public void setMasinhvien(int masinhvien) {
		this.masinhvien = masinhvien;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public Date getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(Date ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public byte getGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(byte gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSodienthoai() {
		return sodienthoai;
	}
	public void setSodienthoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	
}
