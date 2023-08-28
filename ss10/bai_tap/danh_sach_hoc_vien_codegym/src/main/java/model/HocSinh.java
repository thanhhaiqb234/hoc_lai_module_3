package model;

public class HocSinh {
    private String maHocVien ;
    private String tenHocVien ;
    private boolean gioiTinh ;
    private double diem ;

    public HocSinh() {
    }

    public HocSinh(String maHocVien, String tenHocVien, boolean gioiTinh, double diem) {
        this.maHocVien = maHocVien;
        this.tenHocVien = tenHocVien;
        this.gioiTinh = gioiTinh;
        this.diem = diem;
    }

    public String getMaHocVien() {
        return maHocVien;
    }

    public void setMaHocVien(String maHocVien) {
        this.maHocVien = maHocVien;
    }

    public String getTenHocVien() {
        return tenHocVien;
    }

    public void setTenHocVien(String tenHocVien) {
        this.tenHocVien = tenHocVien;
    }

    public boolean isGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public double getDiem() {
        return diem;
    }

    public void setDiem(double diem) {
        this.diem = diem;
    }
}
