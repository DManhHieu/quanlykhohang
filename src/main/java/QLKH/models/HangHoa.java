package QLKH.models;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table (name = "HangHoa")
public class HangHoa {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String MaHangHoa;
    private String ViTri;
    private Date Ngay_KiemKe, HanSuDung, NgaySanXuat, NgayNhapKho;
    @ManyToOne
    @JoinColumn(name = "MaMatHang", referencedColumnName = "MaMatHang")
    private MatHang matHang;

    @ManyToOne
    @JoinColumn(name = "MaNV_KiemKe", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienKiemKe;
    @ManyToOne
    @JoinColumn(name = "MaNV_NhapKho", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienNhapKho;
    @ManyToOne
    @JoinColumn(name = "MaNV_XuatKho", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienXuatKho;
    @ManyToOne
    @JoinColumn(name = "MaTinhTrang", referencedColumnName = "MaTinhTrang")
    private TinhTrang tinhTrang;
    @ManyToOne
    @JoinColumn(name = "MP_NhapHang")
    private PhieuNhapHang PhieuNhap;
    @ManyToOne
    @JoinColumn(name = "MP_XuatHang")
    private PhieuXuatHang PhieuXuat;

    public void setMaHangHoa(String maHangHoa){
        this.MaHangHoa=maHangHoa;
    }
    public String getMaHangHoa(){
        return MaHangHoa;
    }

    public void setViTri(String viTri){
        this.ViTri=viTri;
    }
    public String getViTri(){
        return ViTri;
    }

    public void setNgay_KiemKe(Date ngay_KiemKe){
        this.Ngay_KiemKe=ngay_KiemKe;
    }
    public Date getNgay_KiemKe(){
        return Ngay_KiemKe;
    }

    public void setHanSuDung(Date hanSuDung){
        this.HanSuDung=hanSuDung;
    }
    public Date getHanSuDung(){
        return HanSuDung;
    }

    public void setNgaySanXuat(Date ngaySanXuat){
        this.NgaySanXuat=ngaySanXuat;
    }
    public Date getNgaySanXuat(){
        return NgaySanXuat;
    }

    public void setNgayNhapKho(Date ngayNhapKho){
        this.NgayNhapKho=ngayNhapKho;
    }
    public Date getNgayNhapKho(){
        return NgayNhapKho;
    }

    public void setMatHang(MatHang matHang){
        this.matHang=matHang;
    }
    public MatHang getMatHang(){
        return matHang;
    }

    public void setNhanVienKiemKe(NhanVien nhanVienKiemKe){
        this.NhanVienKiemKe=nhanVienKiemKe;
    }
    public NhanVien getNhanVienKiemKe(){
        return NhanVienKiemKe;
    }

    public void setNhanVienNhapKho(NhanVien nhanVien){
        this.NhanVienNhapKho=nhanVien;
    }
    public NhanVien getNhanVienNhapKho(){
        return NhanVienNhapKho;
    }

    public void setNhanVienXuatKho(NhanVien nhanVien){
        this.NhanVienXuatKho=nhanVien;
    }
    public NhanVien getNhanVienXuatKho(){
        return NhanVienXuatKho;
    }

    public void setTinhTrang(TinhTrang tinhTrang){
        this.tinhTrang=tinhTrang;
    }
    public TinhTrang getTinhTrang(){
        return  tinhTrang;
    }

    public void setPhieuNhap(PhieuNhapHang phieuNhapHang){
        this.PhieuNhap=phieuNhapHang;
    }
    public PhieuNhapHang getPhieuNhap(){
        return  PhieuNhap;
    }

    public void setPhieuXuat(PhieuXuatHang phieuXuatHang){
        this.PhieuXuat=phieuXuatHang;
    }
    @Override
    public boolean equals(Object o) {
        if(o==this){
            return true;
        }
        if(!(o instanceof HangHoa)){
            return false;
        }
        HangHoa h=(HangHoa) o;
        if(((HangHoa) o).MaHangHoa.equals(this.MaHangHoa)){
            return true;
        }
        return false;
    }
}
