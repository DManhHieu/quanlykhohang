package QLKH.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "NhomNhanVien")
public class NhomNhanVien {
    @Id
    private int ID;

    private String TenNhom;
    @OneToMany
    @JoinColumn(name = "ID_Nhom")
    private List<NhanVien> NhanViens;

    public int getID() {
        return ID;
    }

    public void setID(int id) {
        this.ID = id;
    }

    public void setTenNhom(String tenNhom) {
        this.TenNhom = tenNhom;
    }

    public String getTenNhom() {
        return TenNhom;
    }

    public List<NhanVien> getNhanViens() {
        return NhanViens;
    }

    public void setNhanViens(List<NhanVien> nhanViens) {
        this.NhanViens = NhanViens;
    }
}
