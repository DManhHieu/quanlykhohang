package QLKH.models;

public class NhanVien {
    private int id;
    private String TenNhanVien;
    private  String TenDangNhap;
    private  String MatKhau;
    private int id_nhom;
    public int getId(){
        return id;
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
    public void setTenNhanVien(String tenNhanVien){
        this.TenNhanVien=tenNhanVien;
    }
    public void setId(int id){
        this.id=id;
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
}
