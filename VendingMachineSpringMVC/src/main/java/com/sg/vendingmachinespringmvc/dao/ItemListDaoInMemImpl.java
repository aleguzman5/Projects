/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.dao;

import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Alejandro
 */
public class ItemListDaoInMemImpl implements ItemListDao{
    
    private Map<Long, Item> items = new HashMap<>();
    
    public ItemListDaoInMemImpl () {
        
        Item item = new Item();
        item.setItemNumber(1);
        item.setName("Snickers");
        item.setPrice(new BigDecimal ("1.25"));
        item.setQuantity(9);
        items.put(item.getItemNumber(), item);
        
        Item item2 = new Item();
        item2.setItemNumber(2);
        item2.setName("M & Ms");
        item2.setPrice(new BigDecimal ("1.50"));
        item2.setQuantity(2);
        items.put(item2.getItemNumber(), item2);
        
        Item item3 = new Item();
        item3.setItemNumber(3);
        item3.setName("Pringles");
        item3.setPrice(new BigDecimal ("2.10"));
        item3.setQuantity(5);
        items.put(item3.getItemNumber(), item3);
        
        Item item4 = new Item();
        item4.setItemNumber(4);
        item4.setName("Reese's");
        item4.setPrice(new BigDecimal ("1.85"));
        item4.setQuantity(4);
        items.put(item4.getItemNumber(), item4);
        
        Item item5 = new Item();
        item5.setItemNumber(5);
        item5.setName("Pretzels");
        item5.setPrice(new BigDecimal ("1.25"));
        item5.setQuantity(9);
        items.put(item5.getItemNumber(), item5);
        
        Item item6 = new Item();
        item6.setItemNumber(6);
        item6.setName("Twinkies");
        item6.setPrice(new BigDecimal ("1.95"));
        item6.setQuantity(9);
        items.put(item6.getItemNumber(), item6);
        
        Item item7 = new Item();
        item7.setItemNumber(7);
        item7.setName("Doritos");
        item7.setPrice(new BigDecimal ("1.75"));
        item7.setQuantity(11);
        items.put(item7.getItemNumber(), item7);
        
        Item item8 = new Item();
        item8.setItemNumber(8);
        item8.setName("Almond Joy");
        item8.setPrice(new BigDecimal ("1.85"));
        item8.setQuantity(1);
        items.put(item8.getItemNumber(), item8);
        
        Item item9 = new Item();
        item9.setItemNumber(9);
        item9.setName("Trident");
        item9.setPrice(new BigDecimal ("1.95"));
        item9.setQuantity(6);
        items.put(item9.getItemNumber(), item9);
    }

    @Override
    public List<Item> getAllItems() {
        return new ArrayList<Item>(items.values());
    }

    @Override
    public Item getItem(long itemNumber) {
        return items.get(itemNumber);
    }

    @Override
    public void updateInventory(long itemNumber) {
        items.get(itemNumber).setQuantity(items.get(itemNumber).getQuantity()-1);
    }
    
}
