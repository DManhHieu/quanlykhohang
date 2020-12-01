package service.impl;

import DAO.NhanVienDao;
import DAO.impl.NhanVienDaooImpl;
import models.NhanVien;
import service.NhanVienService;

import java.util.List;

public class NhanVienServiceImpl  implements NhanVienService {
    NhanVienDao nhanVienDao=new NhanVienDaooImpl();
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

        return nhanVienDao.get(tendangnhap,matkhau);
    }

    @Override
    public NhanVien login(String tendangnhap, String matkhau) {
        NhanVien nhanVien=this.get(tendangnhap,matkhau);
        if(nhanVien!=null && matkhau.equals(nhanVien.getMatKhau())){
            return  nhanVien;
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
