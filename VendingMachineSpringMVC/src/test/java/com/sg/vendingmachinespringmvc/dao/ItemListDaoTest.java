/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.dao;

import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Alejandro
 */
public class ItemListDaoTest {

    private ItemListDao dao;
    private Map<Long, Item> items = new HashMap<>();

    public ItemListDaoTest() {
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
        dao = ctx.getBean("dao", ItemListDao.class);
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of getAllItems method, of class ItemListDao.
     */
    @Test
    public void testGetAllItems() {
        
        assertEquals(9, dao.getAllItems().size());
    }

    /**
     * Test of getItem method, of class ItemListDao.
     */
    @Test
    public void testGetItem() {
        assertEquals("Pringles", dao.getItem(3).getName());
        assertEquals("Trident", dao.getItem(9).getName());
    }

    /**
     * Test of updateInventory method, of class ItemListDao.
     */
    @Test
    public void testUpdateInventory() {
        
        dao.updateInventory(1);
        assertEquals(8, dao.getItem(1).getQuantity());
    }

}
