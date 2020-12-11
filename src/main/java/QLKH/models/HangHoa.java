package QLKH.models;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table (name = "HangHoa")
public class HangHoa {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private String MaHangHoa;
    private String ViTri;
    private Date Ngay_KiemKe, HanSuDung, NgaySanXuat, NgayNhapKho;
    @ManyToOne
    @JoinColumn(name = "MaMatHang", referencedColumnName = "MaMatHang")
    private MatHang matHang;

    @ManyToOne
    @JoinColumn(name = "MaNV_KiemKe", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienKiemKe;
    @ManyToOne
    @JoinColumn(name = "MaNV_NhapKho", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienNhapKho;
    @ManyToOne
    @JoinColumn(name = "MaNV_XuatKho", referencedColumnName = "MaNhanVien")
    private NhanVien NhanVienXuatKho;
    @ManyToOne
    @JoinColumn(name = "MaTinhTrang", referencedColumnName = "MaTinhTrang")
    private TinhTrang tinhTrang;
    @ManyToOne
    @JoinColumn(name = "MP_NhapHang",referencedColumnName = "MaPhieu")
    private PhieuNhapHang PhieuNhap;
    @ManyToOne
    @JoinColumn(name = "MP_XuatHang",referencedColumnName = "MaPhieu")
    private PhieuNhapHang PhieuXuat;

}
