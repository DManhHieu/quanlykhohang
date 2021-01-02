package QLKH.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "TinhTrang")
public class TinhTrang {
    @Id
    private int MaTinhTrang;
    private String TenTinhTrang;
    @OneToMany
    @JoinColumn(name = "MaTinhTrang", referencedColumnName = "MaTinhTrang")
    private List<HangHoa> HangHoas;

    public int getMaTinhTrang() {
        return MaTinhTrang;
    }

    public void setMaTinhTrang(int maTinhTrang) {
        this.MaTinhTrang = maTinhTrang;
    }

    public String getTenTinhTrang() {
        return TenTinhTrang;
    }

    public void setTenTinhTrang(String tenTinhTrang) {
        this.TenTinhTrang = tenTinhTrang;
    }

    public List<HangHoa> getHangHoas() {
        return HangHoas;
    }

    public void setHangHoas(List<HangHoa> hangHoas) {
        this.HangHoas = hangHoas;
    }

}
