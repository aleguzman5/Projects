/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.service;

import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Alejandro
 */
public class VendingMachineTest {
    
    private VendingMachine service;
    
    public VendingMachineTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        
        ApplicationContext ctx
                = new ClassPathXmlApplicationContext("test-applicationContext.xml");
        service = ctx.getBean("service", VendingMachine.class);
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getItem method, of class VendingMachine.
     */
    @Test
    public void testGetItem() {
        Item item = service.getItem(1);
        assertNotNull(item);
        item = service.getItem(9);
        assertNull(item);
    }

    /**
     * Test of getAllItems method, of class VendingMachine.
     */
    @Test
    public void testGetAllItems() {
        assertEquals(1, service.getAllItems().size());
    }

    /**
     * Test of updateInventory method, of class VendingMachine.
     */
    @Test
    public void testUpdateInventory() {
        service.updateInventory(1);
        assertEquals(8, service.getItem(1).getQuantity());
        service.updateInventory(1);
        assertEquals(7, service.getItem(1).getQuantity());
    }

    /**
     * Test of checkInventory method, of class VendingMachine.
     */
    @Test
    public void testCheckInventory() {
        assertTrue(service.checkInventory(1));
    }

    /**
     * Test of checkIfUserHasEnoughMoney method, of class VendingMachine.
     */
    @Test
    public void testCheckIfUserHasEnoughMoney() {  
        assertFalse(service.checkIfUserHasEnoughMoney(new BigDecimal(.25), 1));
        assertTrue(service.checkIfUserHasEnoughMoney(new BigDecimal(1.25), 1));
    }

    /**
     * Test of calculateAmountShort method, of class VendingMachine.
     */
    @Test
    public void testCalculateAmountShort() {
        
        assertEquals(new BigDecimal(.25), service.calculateAmountShort(new BigDecimal(1), 1));
        assertEquals(new BigDecimal(.75), service.calculateAmountShort(new BigDecimal(.50), 1));
    }

    /**
     * Test of calculateUserChange method, of class VendingMachine.
     */
    @Test
    public void testCalculateUserChange() {
        assertEquals(new BigDecimal(.25), service.calculateUserChange(new BigDecimal(1.50), 1));
        assertEquals(new BigDecimal(1.75), service.calculateUserChange(new BigDecimal(3), 1));
    }

    /**
     * Test of getChange method, of class VendingMachine.
     */
    @Test
    public void testGetChange() {
        assertEquals("2 Quarter(s) ", service.getChange(new BigDecimal(.50)));
    }
    
}
