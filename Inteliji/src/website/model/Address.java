package website.model;

public class Address {
    private int id;
    private String shopName;
    private String address;
    private String phone;
    private int city;

    public Address(){
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }
}
