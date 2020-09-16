package website.model;

import java.util.List;

public class Cart {
    private String id;
    private List<Product> listPro;

    public Cart() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public List<Product> getListPro() {
        return listPro;
    }

    public void setListPro(List<Product> listPro) {
        this.listPro = listPro;
    }

    public double getPrice(String id) {
        double price = 0;
        for (Product product : getListPro()) {
            if (product.getId().equals(id)) {
                price = product.getPrice() * product.getAmount();
            }
        }
        return price;
    }
    public double totalPrice(){
        double result=0;
        for (Product product : getListPro()) {
            result+=getPrice(product.getId());
        }
        return  result;
    }
}
