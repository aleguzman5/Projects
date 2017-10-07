/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.service;

import com.sg.vendingmachinespringmvc.dao.ItemListDao;
import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author Alejandro
 */
public class VendingMachine {
    
    ItemListDao dao;
    
    @Inject
    public VendingMachine(ItemListDao dao) {
        this.dao = dao;
    }
    
    public Item getItem(long itemNumber) {
        
        return dao.getItem(itemNumber);
    }
    
    public List<Item> getAllItems() {
        
        return dao.getAllItems();
    }
    
    public void updateInventory(long itemNumber) {
        
        dao.updateInventory(itemNumber);
    }
    
    public boolean checkInventory(long ItemSelected){
        
        if(dao.getItem(ItemSelected).getQuantity() <= 0) {
            return false;
        } else {
            return true;
        }
    }
    
    public boolean checkIfUserHasEnoughMoney(BigDecimal totalIn, long itemSelected) {
        
        if(dao.getItem(itemSelected).getPrice().compareTo(totalIn) > 0) {
            return false;
        } else {
            return true;
        }
    }
    
    public BigDecimal calculateAmountShort(BigDecimal totalIn, long itemSelected) {
        BigDecimal amountShort = dao.getItem(itemSelected).getPrice().subtract(totalIn);
        return amountShort;
    }
    
    public BigDecimal calculateUserChange(BigDecimal totalIn, long itemSelected) {
        BigDecimal userChange = totalIn.subtract(dao.getItem(itemSelected).getPrice());
        return userChange;
    }
    
    public String getChange(BigDecimal userChange) {
        String change = "";
        BigDecimal moneyLeft = userChange.multiply(new BigDecimal(100));
        BigDecimal quarters = (moneyLeft.divide(new BigDecimal(25))).setScale(0, RoundingMode.FLOOR);
        if (quarters.compareTo(BigDecimal.ZERO) > 0) {
            moneyLeft = moneyLeft.subtract(quarters.multiply(new BigDecimal(25)));
            change += quarters + " Quarter(s) ";
        }
        
        BigDecimal dimes = (moneyLeft.divide(new BigDecimal(10))).setScale(0, RoundingMode.FLOOR);
        if (dimes.compareTo(BigDecimal.ZERO) > 0) {
            moneyLeft = moneyLeft.subtract(dimes.multiply(new BigDecimal(10)));
            change += dimes + " Dime(s) ";
        }
        
        BigDecimal nickels = (moneyLeft.divide(new BigDecimal(5))).setScale(0, RoundingMode.FLOOR);
        if (nickels.compareTo(BigDecimal.ZERO) > 0) {
            moneyLeft = moneyLeft.subtract(nickels.multiply(new BigDecimal(5)));
            change += nickels + " Nickel(s) ";
        }        
        
        BigDecimal pennies = moneyLeft;
        if (pennies.compareTo(BigDecimal.ZERO) > 0) {
            change += pennies + " Pennies ";
        }        
        return change;
    }
}
