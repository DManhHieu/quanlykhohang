package QLKH.models.View;

import QLKH.models.MatHang;

public class MatHangView {
    private String MaMatHang;
    private String TenMatHang;
    private double GiaTri;
    private int Soluong;

    public MatHangView() {
    }

    public MatHangView(MatHang matHang, int Soluong) {
        MaMatHang = matHang.getMaMatHang();
        TenMatHang = matHang.getTenMatHang();
        this.Soluong = Soluong;
        GiaTri = matHang.getGiaTri() * Soluong;
    }

    public String getMaMatHang() {
        return MaMatHang;
    }

    public String getTenMatHang() {
        return TenMatHang;
    }

    public double getGiaTri() {
        return GiaTri;
    }

    public int getSoluong() {
        return Soluong;
    }
}
