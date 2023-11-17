package DAL;


import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import model.OrderDetail;
import model.ProductModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author trinh
 */
public class ShoppingCart {
   private List<Item> items = new ArrayList<>();

    public void addItem(Item item) {
        boolean itemExists = false;

        for (Item cartItem : items) {
            if (cartItem.getMaHang().equals(item.getMaHang())) {
                cartItem.setQuantity(cartItem.getQuantity() + 1);
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            item.setQuantity(1);
            items.add(item);
        }
    }
public int addItemToData(  String idOrder, String date){
       int kq = 0 ;
        for (Item cartItem1 : items) {
            productDAL p = new productDAL();
            ProductModel pro = new ProductModel();
            pro = p.findProduct(cartItem1.getMaHang());
            int quantPro = pro.getQuantity();
            int quant = cartItem1.getQuantity();
            if (quantPro<quant){
                 kq = 1;
                break;
        }}
            if(kq==0){
                
                kq=0;
                 for (Item cartItem : items) {
                
             Random random = new Random();
             int idOrderdetail = random.nextInt(10000) + 1;
             productDAL p1 = new productDAL();
             p1.trusoluong(cartItem.getQuantity(), cartItem.getMaHang());
             OrderDetailDAL oo = new OrderDetailDAL();
         OrderDetail o = new OrderDetail();
            o.setPrice(String.valueOf(cartItem.getGia()));
            o.setIdProduct(cartItem.getMaHang());
            o.setQuantity(String.valueOf(cartItem.getQuantity()));
            double total = cartItem.getTotalPricePro();
            o.setTotal(String.valueOf(total));
           
            o.setDateCreated(date);
            o.setIdOrder(idOrder);
            o.setIdOrderDetail(String.valueOf(idOrderdetail));
            o.setIdSale("1");
           
            oo.addOrderDetail(o);
                
        }
             clearCart();
            }
       return kq;
            
       
    } 

    public void removeItem(String maHang) {
        Item itemToRemove = null;

        for (Item cartItem : items) {
            if (cartItem.getMaHang().equals(maHang)) {
                if (cartItem.getQuantity() > 1) {
                    cartItem.setQuantity(cartItem.getQuantity() - 1);
                } else {
                    itemToRemove = cartItem;
                }
                break;
            }
        }

        if (itemToRemove != null) {
            items.remove(itemToRemove);
        }
    }

    public void updateQuantity(String maHang, int quantity) {
        for (Item cartItem : items) {
            if (cartItem.getMaHang().equals(maHang)) {
                cartItem.setQuantity(quantity);
                break;
            }
        }
    }

    public void clearCart() {
        items.clear();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getTotalQuantity() {
        int total = 0;
        for (Item item : items) {
            total += item.getQuantity();
        }
        return total;
    }

    public double getTotalPrice() {
        double totalPrice = 0;
        for (Item item : items) {
            totalPrice += item.getTotalPricePro();
        }
        return totalPrice;
    }
     
   
    }
