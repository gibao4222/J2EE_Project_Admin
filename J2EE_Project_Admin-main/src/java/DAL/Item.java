package DAL;

  public class Item {
    private String maHang;
    private String image;
    private String tenSanPham;
    private double gia;
    private int quantity; // Số lượng mặt hàng trong giỏ
    
    public Item(String maHang, String image, String tenSanPham, double gia, int quantity) {
        this.maHang = maHang;
        this.image = image;
        this.tenSanPham = tenSanPham;
        this.gia = gia;
        this.quantity = quantity;
    }

    public String getMaHang() {
        return maHang;
    }

    public void setMaHang(String maHang) {
        this.maHang = maHang;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public double getGia() {
        return gia;
    }

    public void setGia(double gia) {
        this.gia = gia;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

   

   
    public double getTotalPricePro() {
        return gia * quantity;
    }
}