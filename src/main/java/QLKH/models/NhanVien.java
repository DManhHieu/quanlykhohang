package QLKH.models;

import java.sql.Date;

public class NhanVien {
    private int MaNhanVien;
    private String TenNhanVien;
    private  String TenDangNhap;
    private  String MatKhau;
    private int id_nhom;
    private String QueQuan;
    private Date NgaySinh;
    private String So_CMND;
    private String Email;
    private String SDT;
    private String Phai;
    public int getMaNhanVien(){
        return MaNhanVien;
    }

    public String getTenNhanVien(){
        return TenNhanVien;
    }
    public String getTenDangNhap(){
        return  TenDangNhap;
    }
    public String getMatKhau(){
        return MatKhau;
    }
    public int getId_nhom(){
        return  id_nhom;
    }
    public String getQueQuan(){
        return  QueQuan;
    }
    public String getSo_CMND(){
        return So_CMND;
    }
    public String getEmail(){
        return  Email;
    }
    public String getSDT(){
        return SDT;
    }
    public String getPhai(){
        return Phai;
    }
    public Date getNgaySinh(){
        return NgaySinh;
    }
    public void setTenNhanVien(String tenNhanVien){
        this.TenNhanVien=tenNhanVien;
    }
    public void setMaNhanVien(int maNhanVien){
        this.MaNhanVien=maNhanVien;
    }
    public void setTenDangNhap(String tenDangNhap){
        this.TenDangNhap=tenDangNhap;
    }
    public void setMatKhau(String matKhau){
        this.MatKhau=matKhau;
    }
    public void setId_nhom(int id_nhom){
        this.id_nhom=id_nhom;
    }
    public void setQueQuan(String queQuan){
        this.QueQuan=queQuan;
    }
    public void setNgaySinh(Date ngaySinh){
        this.NgaySinh=ngaySinh;
    }
    public void setSo_CMND(String so_CMND){
        this.So_CMND=so_CMND;
    }
    public void setEmail(String email){
        this.Email=email;
    }
    public void setSDT(String SDT){
        this.SDT=SDT;
    }
    public void setPhai(String phai){
        this.Phai=phai;
    }

}
