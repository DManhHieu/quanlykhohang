package models;

import java.io.Serializable;
import java.util.Date;

public class NhanVien implements Serializable {
    private String MaNhanVien;
    private String ID_Nhom;
    private String TenNhanVien;
    private String QueQuan;
    private String TenDangNhap;
    private Date NgaySinh;
    private  String MatKhau;
    private String So_CMND;
    private String Email;
    protected  String SDT;
    public NhanVien(){
        super();
    }
    public NhanVien(String tenDangNhap, String matKhau, String maNhanVien){
        super();
        this.TenDangNhap=tenDangNhap;
        this.MatKhau=matKhau;
        this.MaNhanVien=maNhanVien;
    }
    public NhanVien(String tenDangNhap,String matKhau,String maNhanVien, String ID_Nhom){
        super();
        this.TenDangNhap=tenDangNhap;
        this.MatKhau=matKhau;
        this.MaNhanVien=maNhanVien;
        this.ID_Nhom=ID_Nhom;
    }
    public String getMaNhanVien(){
        return MaNhanVien;
    }
    public void setMaNhanVien(String maNhanVien){
        this.MaNhanVien=maNhanVien;
    }
    public String getTenDangNhap(){
        return TenDangNhap;
    }
    public void setTenDangNhap(String tenDangNhap){
        this.TenDangNhap=tenDangNhap;
    }
    public String getMatKhau(){
        return  MatKhau;
    }
    public void setMatKhau(String matKhau) {
        this.MatKhau = matKhau;
    }
    public String getID_Nhom(){
        return ID_Nhom;
    }
    public void setID_Nhom(String id_nhom){
        this.ID_Nhom=id_nhom;
    }
    public String getTenNhanVien(){
        return TenNhanVien;
    }
    public void setTenNhanVien(String tenNhanVien){
        this.TenDangNhap=tenNhanVien;
    }
    public String getQueQuan(){
        return QueQuan;
    }
    public void setQueQuan(String queQuan){
        this.QueQuan=queQuan;
    }
    public Date getNgaySinh(){
        return NgaySinh;
    }
    public void setNgaySinh(Date ngaySinh){
        this.NgaySinh=ngaySinh;
    }
    public String getSo_CMND(){
        return So_CMND;
    }
    public void setSo_CMND(String so_CMND){
        this.So_CMND=so_CMND;
    }
    public String getEmail(){
        return Email;
    }
    public void setEmail(String email){
        this.Email=email;
    }
    public String getSDT(){
        return SDT;
    }
    public void setSDT(String SDT){
        this.SDT=SDT;
    }
}
