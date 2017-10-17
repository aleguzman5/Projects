/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.dao;

import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Alejandro
 */
public class ItemListDaoDbImpl implements ItemListDao {
    
    private static final String SQL_SELECT_ALL_ITEMS
            = "select * from items";
    
    private static final String SQL_GET_ITEM
            = "select * from items where item_id = ?";
    
    private static final String SQL_UPDATE_INVENTORY
            = "update items set quantity = ? "
            + "where item_id = ?";
    
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Item> getAllItems() {
        return jdbcTemplate.query(SQL_SELECT_ALL_ITEMS, new ItemMapper());
    }

    @Override
    public Item getItem(long itemNumber) {
        try {
            return jdbcTemplate.queryForObject(SQL_GET_ITEM, new ItemMapper(), itemNumber);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void updateInventory(long itemNumber) {
        Item item = getItem(itemNumber);
        item.setQuantity(item.getQuantity()-1);
        jdbcTemplate.update(SQL_UPDATE_INVENTORY,
                item.getQuantity(),
                item.getItemNumber());
    }
    
    private static final class ItemMapper implements RowMapper<Item> {
        
        public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
            Item item = new Item();
            item.setItemNumber(rs.getInt("item_id"));
            item.setName(rs.getString("name"));
            item.setPrice((rs.getBigDecimal("price")));
            item.setQuantity(rs.getInt("quantity"));
            return item;
        }
    }
}
