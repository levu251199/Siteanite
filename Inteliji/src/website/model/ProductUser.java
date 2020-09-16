package website.model;

public class ProductUser {
    private String maSanPham;
    private String tenSanPham;
    private   String moTaSanPham;
    private double giaNho;
    private double giaVua;
    private double giaLon;
    private String loaiSanPham;
    private String img;

    public ProductUser() {
    }

    public String getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(String maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getMoTaSanPham() {
        return moTaSanPham;
    }

    public void setMoTaSanPham(String moTaSanPham) {
        this.moTaSanPham = moTaSanPham;
    }

    public double getGiaNho() {
        return giaNho;
    }

    public void setGiaNho(double giaNho) {
        this.giaNho = giaNho;
    }

    public double getGiaVua() {
        return giaVua;
    }

    public void setGiaVua(double giaVua) {
        this.giaVua = giaVua;
    }

    public double getGiaLon() {
        return giaLon;
    }

    public void setGiaLon(double giaLon) {
        this.giaLon = giaLon;
    }

    public String getLoaiSanPham() {
        return loaiSanPham;
    }

    public void setLoaiSanPham(String loaiSanPham) {
        this.loaiSanPham = loaiSanPham;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
