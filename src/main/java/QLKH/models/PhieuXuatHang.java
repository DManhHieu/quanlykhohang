package QLKH.models;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "PhieuXuatHang")
public class PhieuXuatHang {
    @Id
    private String MaPhieu;

    private String MoTa, BenNhan;
    private Date NgayTao;
    private Date NgayXuat_DuKien;
   @Column(nullable = true)
    private Date NgayXuat_ThucTe;

    @ManyToOne
    @JoinColumn(name = "Ma_NhanVien_Xuat", referencedColumnName = "MaNhanVien")
    private NhanVien NguoiXuat;

    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "MP_XuatHang")
    private List<HangHoa> hangHoas;

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

    public String getBenNhan(){
        return  BenNhan;
    }
    public void setBenNhan(String benNhan){
        this.BenNhan=benNhan;
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

    public List<HangHoa> getHangHoas(){
        return  hangHoas;
    }
    public void setHangHoas(List<HangHoa> hangHoas){
        this.hangHoas=hangHoas;
    }
}
