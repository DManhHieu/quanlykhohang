package QLKH.models;

import javax.persistence.*;

@Entity
@Table(name = "HangNhap")
public class HangNhap {
    @EmbeddedId
    private HangNhapId hangNhapId;
    private  int SoLuong;

    @ManyToOne
    @MapsId("MaHangNhap")
    @JoinColumn(name="MaHangNhap")
    private MatHang matHang;

    @ManyToOne
    @MapsId("MP_Nhap")
    @JoinColumn(name="MP_Nhap")
    private PhieuNhapHang phieuNhapHang;

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
    public MatHang getMatHang() {
        return matHang;
    }

    public void setMatHang(MatHang matHang) {
        this.matHang = matHang;
    }

    public PhieuNhapHang getPhieuNhapHang() {
        return phieuNhapHang;
    }

    public void setPhieuNhapHang(PhieuNhapHang phieuNhapHang) {
        this.phieuNhapHang = phieuNhapHang;
    }



}
