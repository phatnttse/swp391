/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.cart;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import phatntt.dao.ProductsDAO;
import phatntt.dto.ProductsDTO;

/**
 *
 * @author Admin
 */
public class CartObject implements Serializable {
    
    private Map<ProductsDTO, Integer> items;
    
    public Map<ProductsDTO, Integer> getItems(){
        return items;
    }
    
    public void addItemToCart(int itemId, int quantity) throws SQLException, NamingException{
        //1. check itemId existed
        if (itemId <= 0 | quantity <= 0 ){
            return;
        }
        //2. check items existed
        if (this.items == null){
            this.items = new HashMap<>();
        }
        //3. check item existed
        ProductsDAO dao = new ProductsDAO();
        ProductsDTO dto = dao.getProductById(itemId);
        
        if (this.items.containsKey(dto)){
            quantity = quantity + this.items.get(dto);
        }// end item has already existed
        //4. put item to items
        this.items.put(dto, quantity);
        
    }
}
