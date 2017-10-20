/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.model.Location;
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
public class LocationDaoImpl implements LocationDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final String SQL_INSERT_LOCATION
            = "insert into location (name, description, address, latitude, "
            + "longitude) values (?, ?, ?, ?, ?)";

    private static final String SQL_DELETE_LOCATION
            = "delete from location where locationId = ?";
    private static final String SQL_DELETE_SIGHTING_LOCATION/////// Is this safe?????
            = "delete from sighting where locationId = ?";
    private static final String SQL_UPDATE_LOCATION
            = "update location set name = ?, description = ?, address = ?, "
            + "latitude = ?, longitude = ? where locationId =  ?";

    private static final String SQL_SELECT_LOCATION
            = "select * from location where locationId = ?";

    private static final String SQL_SELECT_ALL_LOCATIONS
            = "select * from location";

    private static final String SQL_SELECT_LOCATIONS_BY_SUPER_ID
            = "select l.* "
            + "from location l "
            + "inner join sighting si on l.locationId = si.locationId "
            + "inner join supersighting ss on si.sightingId = ss.sightingId "
            + "inner join `super` s on ss.superId = s.superId "
            + "where s.superId = ?";
    private static final String SQL_SELECT_ALL_SUPER_BY_LOCATIONID
            = "select s.* "
            + "from super s "
            + "inner join supersighting ss on s.superId = ss.superId "
            + "inner join sighting si on ss.sightingId = si.sightingId "
            + "inner join location l on si.locationId = l.locationId "
            + "where l.locationId = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addLocation(Location location) {
        jdbcTemplate.update(SQL_INSERT_LOCATION,
                location.getName(),
                location.getDescription(),
                location.getAddress(),
                location.getLatitude(),
                location.getLongitude());

        int locationId
                = jdbcTemplate.queryForObject("select LAST_INSERT_ID()",
                        Integer.class);

        location.setLocationId(locationId);
    }

    @Override
    public void deleteLocation(int locationId) {
        jdbcTemplate.update(SQL_DELETE_SIGHTING_LOCATION, locationId);

        jdbcTemplate.update(SQL_DELETE_LOCATION, locationId);
    }

    @Override
    public void updateLocation(Location location) {
        jdbcTemplate.update(SQL_UPDATE_LOCATION,
                location.getName(),
                location.getDescription(),
                location.getAddress(),
                location.getLatitude(),
                location.getLongitude(),
                location.getLocationId());
    }

    @Override
    public Location getLocationById(int locationId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_LOCATION,
                    new LocationMapper(),
                    locationId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    @Override
    public List<Location> getAllLocations() {
        return jdbcTemplate.query(SQL_SELECT_ALL_LOCATIONS,
                new LocationMapper());
    }

    @Override
    public List<Location> getAllLocationsBySuperId(int superId) {
        return jdbcTemplate.query(SQL_SELECT_LOCATIONS_BY_SUPER_ID,
                new LocationMapper(), superId);
    }

    public static final class LocationMapper implements RowMapper<Location> {

        @Override
        public Location mapRow(ResultSet rs, int i) throws SQLException {
            Location location = new Location();
            location.setLocationId(rs.getInt("locationId"));
            location.setName(rs.getString("name"));
            location.setDescription(rs.getString("description"));
            location.setAddress(rs.getString("address"));
            location.setLatitude(rs.getDouble("latitude"));
            location.setLongitude(rs.getDouble("longitude"));
            return location;
        }

    }
}
