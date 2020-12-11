package QLKH.models;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
public class HangNhapId implements Serializable {
    @Column(name = "MP_Nhap")
    private String MP_Nhap;
    @Column(name="MaHangNhap")
    private String MaHangNhap;

    public HangNhapId(){

    }
    public HangNhapId(String MP_Nhap,String MaHangNhap){
        this.MaHangNhap=MaHangNhap;
        this.MP_Nhap=MP_Nhap;
    }
    public String getMP_Nhap(){
        return MP_Nhap;
    }
    public String getMaHangNhap(){
        return MaHangNhap;
    }
}
