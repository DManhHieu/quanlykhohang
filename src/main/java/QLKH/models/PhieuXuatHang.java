package QLKH.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "PhieuXuatHang")
public class PhieuXuatHang {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String MaPhieu;
    private String MoTa;
    private Date NgayTao, NgayXuat_DuKien,NgayXuat_ThucTe;
    @ManyToOne
    @JoinColumn(name = "Ma_NhanVien_Xuat", referencedColumnName = "MaNhanVien")
    private NhanVien NguoiXuat;

    @ManyToMany
    @JoinColumn(name = "MaPhieu", referencedColumnName = "MP_Nhap")
    private List<HangNhap> hangNhaps;

    public String getMaPhieu(){
        return  MaPhieu;
    }
    public void setMaPhieu(String maPhieu){
        this.MaPhieu=maPhieu;
    }

    public String getMoTa(){
        return  MoTa;
    }
    public void setMoTa(String moTa){
        this.MoTa=moTa;
    }

    public Date getNgayTao(){
        return NgayTao;
    }
    public void setNgayTao(Date ngayTao){
        this.NgayTao=ngayTao;
    }

    public Date getNgayXuat_DuKien(){
        return NgayXuat_DuKien;
    }
    public void setNgayXuat_DuKien(Date ngayXuat_DuKien){
        this.NgayXuat_DuKien=ngayXuat_DuKien;
    }

    public Date getNgayXuat_ThucTe(){
        return NgayXuat_ThucTe;
    }
    public void setNgayXuat_ThucTe(Date ngayXuat_ThucTe){
        this.NgayXuat_ThucTe=ngayXuat_ThucTe;
    }

    public NhanVien getNguoiXuat(){
        return  NguoiXuat;
    }
    public void setNguoiXuat(NhanVien nguoiXuat){
        this.NguoiXuat=nguoiXuat;
    }

    public List<HangNhap> getHangNhaps(){
        return  hangNhaps;
    }
    public void setHangNhaps(List<HangNhap> hangNhaps){
        this.hangNhaps=hangNhaps;
    }
}
