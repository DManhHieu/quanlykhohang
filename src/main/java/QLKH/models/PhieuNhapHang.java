package QLKH.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name="PhieuNhapHang")
public class PhieuNhapHang {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String MaPhieu;
    private String MoTa, NhapTu;
    private Date NgayNhap;

    @ManyToOne
    @JoinColumn(name = "Ma_NhanVien_Nhap", referencedColumnName = "MaNhanVien")
    private NhanVien NguoiNhap;

    @ManyToMany
    @JoinColumn(name = "MaPhieu", referencedColumnName = "MP_Nhap")
    private List<HangNhap> hangNhaps;

    public String getMaPhieu(){
        return MaPhieu;
    }
    public void setMaPhieu(String MaPhieu){
        this.MaPhieu=MaPhieu;
    }

    public String getMoTa(){
        return  MoTa;
    }
    public void setMoTa(String MoTa){
        this.MoTa=MoTa;
    }

    public String getNhapTu(){
        return  NhapTu;
    }
    public void setNhapTu(String NhapTu){
        this.NhapTu=NhapTu;
    }

    public Date getNgayNhap(){
        return  NgayNhap;
    }
    public void setNgayNhap(Date NgayNhap){
        this.NgayNhap=NgayNhap;
    }

    public NhanVien getNguoiNhap(){
        return  NguoiNhap;
    }
    public void setNguoiNhap(NhanVien nguoiNhap){
        this.NguoiNhap=nguoiNhap;
    }

    public List<HangNhap> getHangNhaps(){
        return  hangNhaps;
    }
    public void setHangNhaps(List<HangNhap> hangNhaps){
        this.hangNhaps=hangNhaps;
    }
}
