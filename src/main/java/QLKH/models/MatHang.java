package QLKH.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "MatHang")
public class MatHang {
    @Id
    private String MaMatHang;
    private String NhaSanXuat, TenMatHang, MoTa;
    private double GiaTri;

    @ManyToOne
    @JoinColumn(name = "NV_Tao", referencedColumnName = "MaNhanVien")
    private NhanVien NguoiNhap;

    @OneToMany
    @JoinColumn(name = "MaMatHang", referencedColumnName = "MaMatHang")
    private List<HangHoa> HangHoas;

    @OneToMany(mappedBy = "matHang", fetch = FetchType.LAZY)
    private List<HangNhap> hangNhaps;

    public String getMaMatHang() {
        return MaMatHang;
    }

    public String getNhaSanXuat() {
        return NhaSanXuat;
    }

    public String getTenMatHang() {
        return TenMatHang;
    }

    public String getMoTa() {
        return MoTa;
    }

    public double getGiaTri() {
        return GiaTri;
    }

    public NhanVien getNguoiNhap() {
        return NguoiNhap;
    }

    public void setMaMatHang(String maMatHang) {
        this.MaMatHang =  maMatHang.trim();
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        this.NhaSanXuat = nhaSanXuat.trim();
    }

    public void setTenMatHang(String tenMatHang) {
        this.TenMatHang = tenMatHang.trim();
    }

    public void setMoTa(String moTa) {
        this.MoTa = moTa.trim();
    }

    public void setGiaTri(double giaTri) {
        this.GiaTri = giaTri;
    }

    public void setNguoiNhap(NhanVien NguoiNhap) {
        this.NguoiNhap = NguoiNhap;
    }

    public List<HangHoa> getHangHoas() {
        return HangHoas;
    }

    public void setHangHoas(List<HangHoa> hangHoas) {
        this.HangHoas = hangHoas;
    }

    public List<HangNhap> getHangNhaps() {
        return hangNhaps;
    }

    public void setHangNhaps(List<HangNhap> hangNhaps) {
        this.hangNhaps = hangNhaps;
    }

}
