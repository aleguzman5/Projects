/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.model.SuperPower;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Alejandro
 */
public class SuperPowerDaoImpl implements SuperPowerDao{
private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private static final String SQL_INSERT_SUPERPOWER
            = "insert into superPowers (name) "
            + "values (?)";
    private static final String SQL_DELETE_SUPERPOWER
            = "delete from superPowers where superPowerId = ?";
    private static final String SQL_DELETE_SUPERPOWER_SUPER/////// Is this safe?????
            = "delete from super where superPowerId = ?";
    private static final String SQL_UPDATE_SUPERPOWER
            = "update superPowers set name = ? "
            + "where superPowerId =  ?";
    private static final String SQL_SELECT_SUPERPOWER
            = "select * from superPowers where superPowerId = ?";
    private static final String SQL_SELECT_ALL_SUPERPOWERS
            = "select * from superPowers";
    private static final String SQL_SELECT_SP_BY_SUPERID
            = "select * from superPowers where superPowerId = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addSuperPower(SuperPower superPower) {
        jdbcTemplate.update(SQL_INSERT_SUPERPOWER,
                superPower.getName());
        
        int superPowerId
                = jdbcTemplate.queryForObject("select LAST_INSERT_ID()",
                        Integer.class);
        
        superPower.setSuperPowerId(superPowerId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteSuperPower(int superPowerId) {
        jdbcTemplate.update(SQL_DELETE_SUPERPOWER, superPowerId);
        
        jdbcTemplate.update(SQL_DELETE_SUPERPOWER_SUPER, superPowerId);
    }

    @Override
    public void updateSuperPower(SuperPower superPower) {
        jdbcTemplate.update(SQL_UPDATE_SUPERPOWER, 
                superPower.getName(),
                superPower.getSuperPowerId());
    }

    @Override
    public SuperPower getSuperPowerById(int superPowerId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SUPERPOWER,
                    new SuperPowerMapper(),
                    superPowerId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<SuperPower> getAllSuperPowers() {
        return jdbcTemplate.query(SQL_SELECT_ALL_SUPERPOWERS,
                new SuperPowerMapper());
    }

    @Override
    public SuperPower getSuperPowerBySuperId(Integer superId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_SP_BY_SUPERID,
                    new SuperPowerMapper(),
                    superId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }
    
    public static final class SuperPowerMapper implements RowMapper<SuperPower> {

        @Override
        public SuperPower mapRow(ResultSet rs, int i) throws SQLException {
            SuperPower superPower = new SuperPower();
            superPower.setSuperPowerId(rs.getInt("superPowerId"));
            superPower.setName(rs.getString("name"));
            return superPower;
        }

    }
}
