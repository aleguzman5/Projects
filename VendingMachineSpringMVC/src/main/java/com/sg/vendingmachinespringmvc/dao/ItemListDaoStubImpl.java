/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.dao;

import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alejandro
 */
public class ItemListDaoStubImpl implements ItemListDao {
    
    Item item;
    Item item2;
    List<Item> itemList = new ArrayList<>();
    
    public ItemListDaoStubImpl () {
        
        item = new Item();
        item.setItemNumber(1);
        item.setName("Snickers");
        item.setPrice(new BigDecimal ("1.25"));
        item.setQuantity(9);
        itemList.add(item);
        
//        item2 = new Item();
//        item2.setItemNumber(2);
//        item2.setName("M & Ms");
//        item2.setPrice(new BigDecimal ("1.50"));
//        item2.setQuantity(2);
//        itemList.add(item2);
    }

    @Override
    public List<Item> getAllItems() {
        return itemList;
    }

    @Override
    public Item getItem(long itemNumber) {
        if (itemNumber == item.getItemNumber()) {
            return item;
        } else {
            return null;
        }
    }

    @Override
    public void updateInventory(long itemNumber) {
        item.setQuantity(item.getQuantity() - 1);
    }
    
}
