package QLKH.models.View;

import QLKH.models.HangHoa;

import java.sql.Date;

public class HangHoaView {
    private String MaHangHoa;
    private String ViTri;
    private String TenMatHang;
    private Date Ngay_KiemKe, HanSuDung, NgaySanXuat, NgayNhapKho;
    private String TinhTrang;

    public HangHoaView(HangHoa hangHoa) {
        this.MaHangHoa = hangHoa.getMaHangHoa();
        this.ViTri = hangHoa.getViTri();
        this.TenMatHang = hangHoa.getMatHang().getTenMatHang();
        this.Ngay_KiemKe = hangHoa.getNgay_KiemKe();
        this.HanSuDung = hangHoa.getHanSuDung();
        this.NgaySanXuat = hangHoa.getNgaySanXuat();
        this.NgayNhapKho = hangHoa.getNgayNhapKho();
        this.TinhTrang = hangHoa.getTinhTrang().getTenTinhTrang();
    }
}
