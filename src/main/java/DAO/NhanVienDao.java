package DAO;

import models.NhanVien;

import java.util.List;

public interface NhanVienDao {
    void insert(NhanVien nhanVien);
    void edit(NhanVien nhanVien);
    void delete(String manhanvien);
    NhanVien get(String manhanvien);
    NhanVien get(String tendangnhap,String matkhau);
    List<NhanVien> getAll();
    List<NhanVien> search(String keyword);
}
