package DAO.impl;

import DAO.NhanVienDao;
import jdbc.JDBCConnection;
import models.NhanVien;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class NhanVienDaooImpl extends JDBCConnection implements NhanVienDao {
    @Override
    public void insert(NhanVien nhanVien) {

    }

    @Override
    public void edit(NhanVien nhanVien) {

    }

    @Override
    public void delete(String manhanvien) {

    }

    @Override
    public NhanVien get(String manhanvien) {
        return null;
    }

    @Override
    public NhanVien get(String tendangnhap, String matkhau) {
        String sql="SELECT *  FROM nhanvien WHERE TenDangNhap= ?";
        Connection con=super.getJDBCConnection();
        try{
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,tendangnhap);
            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                NhanVien nhanVien=new NhanVien();
                nhanVien.setMaNhanVien(rs.getString("MaNhanVien"));
                nhanVien.setTenDangNhap(rs.getString("TenDangNhap"));
                nhanVien.setMatKhau(rs.getString("MatKhau"));
                nhanVien.setID_Nhom(rs.getString("ID_Nhom"));
                nhanVien.setEmail(rs.getString("Email"));
                nhanVien.setNgaySinh(rs.getDate("NgaySinh"));
                nhanVien.setQueQuan(rs.getString("QueQuan"));
                nhanVien.setSDT(rs.getString("SDT"));
                nhanVien.setSo_CMND(rs.getString("So_CMND"));
                nhanVien.setTenNhanVien(rs.getString("TenNhanVien"));
                return nhanVien;
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<NhanVien> getAll() {
        return null;
    }

    @Override
    public List<NhanVien> search(String keyword) {
        return null;
    }
}
