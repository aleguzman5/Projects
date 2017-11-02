/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.dvdlibraryspringmvc.dao;

import com.sg.dvdlibraryspringmvc.model.DVD;
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

//    @Override
//    public List<Contact> searchContacts(Map<SearchTerm, String> criteria) {
//        if (criteria.isEmpty()) {
//            return getAllContacts();
//        } else {
//            // build a prepared statement based on the user's search
//            // terms
//            StringBuilder sQuery = new StringBuilder("select * from contacts where ");
//            // build the where clause
//            int numParams = criteria.size();
//            int paramPosition = 0;
//            // we'll put the positional parameters into an array, the 
//            // order of the parameters will match the order in which we 
//            // get the search criteria from the map
//            String[] paramVals = new String[numParams];
//            Set<SearchTerm> keySet = criteria.keySet();
//            Iterator<SearchTerm> iter = keySet.iterator();
//            // build up the where clause based on the key/value pairs in 
//            // the map build where clause and positional parameter array
//            while (iter.hasNext()) {
//                SearchTerm currentKey = iter.next();
//                // if we are not the first one in, we must add an AND to 
//                // the where clause
//                if (paramPosition > 0) {
//                    sQuery.append(" and ");
//                }
//                // now append our criteria name
//                sQuery.append(currentKey);
//                sQuery.append(" = ? ");
//                // grab the value for this search criteria and put it into 
//                // the paramVals array
//                paramVals[paramPosition] = criteria.get(currentKey);
//                paramPosition++;
//            }
//
//            return jdbcTemplate.query(sQuery.toString(), new ContactMapper(), paramVals);
//        }
//    }
//
//    }
public class DVDListDaoDbImpl implements DVDListDao {

    private JdbcTemplate jdbcTemplate;

    public void setjdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

//    private static final String SQL_SELECT_CONTACTS_BY_LAST_NAME
//            = "select * from contacts where last_name = ?";
//    private static final String SQL_SELECT_CONTACTS_BY_COMPANY
//            = "select * from contacts where company = ?";
    private static final String SQL_INSERT_DVD
            = "insert into dvds "
            + "(title, releaseYear, director, rating, notes) "
            + "values (?, ?, ?, ?, ?)";
    private static final String SQL_DELETE_DVD
            = "delete from dvds where dvdId = ?";
    private static final String SQL_SELECT_DVD
            = "select * from dvds where dvdId = ?";
    private static final String SQL_UPDATE_DVD
            = "update dvds set "
            + "title = ?, releaseYear = ?, director = ?, "
            + "rating = ?, notes = ? "
            + "where dvdId = ?";
    private static final String SQL_SELECT_ALL_DVDS
            = "select * from dvds";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public DVD addDVD(DVD dvd) {
        jdbcTemplate.update(SQL_INSERT_DVD,
                dvd.getTitle(),
                dvd.getReleaseYear(),
                dvd.getDirector(),
                dvd.getRating(),
                dvd.getNotes());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);

        dvd.setDvdId(newId);
        return dvd;
    }

    @Override
    public void removeDVD(DVD dvd) {
        int dvdId = dvd.getDvdId();
        jdbcTemplate.update(SQL_DELETE_DVD, dvdId);
    }

    @Override
    public void updateDVD(DVD dvd) {
        jdbcTemplate.update(SQL_UPDATE_DVD,
                dvd.getTitle(),
                dvd.getReleaseYear(),
                dvd.getDirector(),
                dvd.getRating(),
                dvd.getNotes(),
                dvd.getDvdId());
    }

    @Override
    public List<DVD> getAllDVDs() {
        return jdbcTemplate.query(SQL_SELECT_ALL_DVDS, new DvdMapper());
    }

    @Override
    public DVD getDvdById(int dvdId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_DVD, new DvdMapper(), dvdId);
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    private static final class DvdMapper implements RowMapper<DVD> {

        public DVD mapRow(ResultSet rs, int rowNum) throws SQLException {
            DVD dvd = new DVD();
            dvd.setDvdId(rs.getInt("dvdId"));
            dvd.setTitle(rs.getString("title"));
            dvd.setReleaseYear(rs.getInt("releaseYear"));
            dvd.setDirector(rs.getString("director"));
            dvd.setRating(rs.getString("rating"));
            dvd.setNotes(rs.getString("notes"));
            return dvd;
        }
    }
}
