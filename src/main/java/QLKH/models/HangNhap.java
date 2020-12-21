package QLKH.models;

import javax.persistence.*;

@Entity
@Table(name = "HangNhap")
public class HangNhap {
    @EmbeddedId
    private HangNhapId hangNhapId;
    private  int SoLuong;

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
    public void setMaPhieuNhap(String maPhieuNhap){
        hangNhapId.setMP_Nhap(maPhieuNhap);
    }
    public void setMaHangNhap(String maHangNhap){
        hangNhapId.setMaHangNhap(maHangNhap);
    }

}
