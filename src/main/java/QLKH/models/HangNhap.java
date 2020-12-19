package QLKH.models;

import javax.persistence.*;

@Entity
@Table(name = "HangNhap")
public class HangNhap {
    @EmbeddedId
    @GeneratedValue(strategy = GenerationType.AUTO)
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


}
