package QLKH.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "HangNhap")
public class HangNhap {
    @EmbeddedId
    @GeneratedValue(strategy = GenerationType.AUTO)
    private HangNhapId hangNhapId;
    private  int SoLuong;

    @ManyToMany
    @JoinColumn(name = "MaHangNhap", referencedColumnName = "MaMatHang")
    private List<MatHang> matHangs;

    @ManyToMany
    @JoinColumn(name = "MP_Nhap", referencedColumnName = "MaPhieu")
    private List<PhieuNhapHang> phieuNhapHangs;

    public void setHangNhapId(HangNhapId hangNhapId){
        this.hangNhapId=hangNhapId;
    }
    public HangNhapId getHangNhapId(){
        return hangNhapId;
    }
    public void setSoLuong(int soLuong){
        this.SoLuong=soLuong;
    }
    public int getSoLuong(){
        return SoLuong;
    }

    public List<MatHang> getMatHangs(){
        return  matHangs;
    }
    public void setMatHangs(List<MatHang> matHangs){
        this.matHangs=matHangs;
    }

    public List<PhieuNhapHang> getPhieuNhapHangs(){
        return  phieuNhapHangs;
    }
    public void setPhieuNhapHangs(List<PhieuNhapHang> phieuNhapHangs){
        this.phieuNhapHangs=phieuNhapHangs;
    }


}
