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
        if(maMatHang!=null) {
            this.MaMatHang = maMatHang.trim();
        }
        else {
            this.MaMatHang = "";
        }
    }

    public void setNhaSanXuat(String nhaSanXuat) {
        if(nhaSanXuat!=null) {
            this.NhaSanXuat = nhaSanXuat.trim();
        }
        else {
            this.NhaSanXuat = "";
        }
    }

    public void setTenMatHang(String tenMatHang) {
        if(tenMatHang!=null) {
            this.TenMatHang = tenMatHang.trim();
        }
        else {
            this.TenMatHang = "";
        }
    }

    public void setMoTa(String moTa) {
        if(moTa!=null) {
            this.MoTa = moTa.trim();
        }
        else {
            this.MoTa = "";
        }
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
