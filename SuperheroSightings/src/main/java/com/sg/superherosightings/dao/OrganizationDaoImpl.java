/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.model.Organization;
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
public class OrganizationDaoImpl implements OrganizationDao {

    private static final String SQL_INSERT_ORGANIZATION
            = "insert into organization (name, description, address, city, "
            + "zip, phone, email) values (?, ?, ?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_ORGANIZATION
            = "delete from organization where organizationId = ?";
    private static final String SQL_DELETE_SUPER_ORGANIZATIONS_ORGANIZATION/////// Is this safe?????
            = "delete from superOrganizations where organizationId = ?";
    private static final String SQL_UPDATE_ORGANIZATION
            = "update organization set name = ?, description = ?, address = ?, "
            + "city = ?, zip = ?, phone = ?, email = ? where organizationId =  ?";

    private static final String SQL_SELECT_ORGANIZATION
            = "select * from organization where organizationId = ?";

    private static final String SQL_SELECT_ALL_ORGANIZATIONS
            = "select * from organization";

    private static final String SQL_SELECT_ORGANIZATIONS_BY_SUPER_ID
            = "select o.* "
            + "from `super` s "
            + "inner join superorganizations so on s.superId = so.superId "
            + "inner join organization o on so.organizationId = o.organizationId "
            + "where s.superId = ?";

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public void addOrganization(Organization organization) {
        jdbcTemplate.update(SQL_INSERT_ORGANIZATION, 
                organization.getName(),
                organization.getDescription(),
                organization.getAddress(),
                organization.getCity(),
                organization.getZip(),
                organization.getPhone(),
                organization.getEmail());
        
        int organizationId
                = jdbcTemplate.queryForObject("select LAST_INSERT_ID()",
                        Integer.class);
        
        organization.setOrganizationId(organizationId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void deleteOrganization(int organizationId) {
        jdbcTemplate.update(SQL_DELETE_SUPER_ORGANIZATIONS_ORGANIZATION, organizationId);

        jdbcTemplate.update(SQL_DELETE_ORGANIZATION, organizationId);
    }

    @Override
    public void updateOrganization(Organization organization) {
        jdbcTemplate.update(SQL_UPDATE_ORGANIZATION,
                organization.getName(),
                organization.getDescription(),
                organization.getAddress(),
                organization.getCity(),
                organization.getZip(),
                organization.getPhone(),
                organization.getEmail(),
                organization.getOrganizationId());
    }

    @Override
    public Organization getOrganizationById(int organizationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_ORGANIZATION,
                    new LocationMapper(),
                    organizationId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Organization> getAllOrganizations() {
        return jdbcTemplate.query(SQL_SELECT_ALL_ORGANIZATIONS,
                new LocationMapper());
    }

    @Override
    public List<Organization> getAllOrganizationsBySuper(int superId) {
        return jdbcTemplate.query(SQL_SELECT_ORGANIZATIONS_BY_SUPER_ID,
                new LocationMapper(), superId);
    }

    public static final class LocationMapper implements RowMapper<Organization> {

        @Override
        public Organization mapRow(ResultSet rs, int i) throws SQLException {
            Organization organization = new Organization();
            organization.setOrganizationId(rs.getInt("organizationId"));
            organization.setName(rs.getString("name"));
            organization.setDescription(rs.getString("description"));
            organization.setAddress(rs.getString("address"));
            organization.setCity(rs.getString("city"));
            organization.setZip(rs.getInt("zip"));
            organization.setPhone(rs.getLong("phone"));
            organization.setEmail(rs.getString("email"));
            return organization;
        }

    }
}
