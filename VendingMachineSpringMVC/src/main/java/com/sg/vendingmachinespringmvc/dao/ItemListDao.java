/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.dao;

import com.sg.vendingmachinespringmvc.model.Item;
import java.util.List;

/**
 *
 * @author Alejandro
 */
public interface ItemListDao {
    
    List<Item> getAllItems(); 
    
    Item getItem(long itemNumber);
    
    void updateInventory(long itemNumber);
}
