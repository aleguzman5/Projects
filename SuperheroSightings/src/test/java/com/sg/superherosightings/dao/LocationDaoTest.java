/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.model.Location;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author Alejandro
 */
public class LocationDaoTest {

    LocationDao locationDao;

    public LocationDaoTest() {
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

        locationDao = ctx.getBean("locationDao", LocationDao.class);

        List<Location> locations = locationDao.getAllLocations();
        for (Location currentLocation : locations) {
            locationDao.deleteLocation(currentLocation.getLocationId());
        }
    }

    @After
    public void tearDown() {
    }

    /**
     * Test of addLocation method, of class LocationDao.
     */
    @Test
    public void testAddGetLocation() {
        Location loc = new Location();
        loc.setName("The Software Guild");
        loc.setDescription("Multi-Building Campus");
        loc.setAddress("526 South Main Street");
        loc.setLatitude(41.071827);
        loc.setLongitude(-81.527073);

        locationDao.addLocation(loc);

        Location fromDao = locationDao.getLocationById(loc.getLocationId());
        assertEquals(fromDao, loc);
    }

    /**
     * Test of deleteLocation method, of class LocationDao.
     */
    @Test
    public void testDeleteLocation() {
        Location loc = new Location();
        loc.setName("The Software Guild");
        loc.setDescription("Multi-Building Campus");
        loc.setAddress("526 South Main Street");
        loc.setLatitude(41.071827);
        loc.setLongitude(-81.527073);

        locationDao.addLocation(loc);

        Location fromDao = locationDao.getLocationById(loc.getLocationId());
        assertEquals(fromDao, loc);

        locationDao.deleteLocation(loc.getLocationId());
        assertNull(locationDao.getLocationById(loc.getLocationId()));
    }

    /**
     * Test of updateLocation method, of class LocationDao.
     */
    @Test
    public void testUpdateLocation() {
        Location loc = new Location();
        loc.setName("The Software Guild");
        loc.setDescription("Multi-Building Campus");
        loc.setAddress("526 South Main Street");
        loc.setLatitude(41.071827);
        loc.setLongitude(-81.527073);

        locationDao.addLocation(loc);
        
        String name = "The Software Guild";
        Location fromDao = locationDao.getLocationById(loc.getLocationId());
        assertEquals(fromDao.getName(), name);
        
        String minn = "The Software Guild Minnesota";

        fromDao.setName("The Software Guild Minnesota");
        fromDao.setDescription("Multi-Building Campus");
        fromDao.setAddress("526 South Main Street Suite, Minnesota");
        fromDao.setLatitude(41.071827);
        fromDao.setLongitude(-81.527073);
        locationDao.updateLocation(fromDao);

        Location update = locationDao.getLocationById(loc.getLocationId());
        assertEquals(update.getName(), minn);
    }

    /**
     * Test of getAllLocations method, of class LocationDao.
     */
    @Test
    public void testGetAllLocations() {
        
        Location loc = new Location();
        loc.setName("Metropolis");
        loc.setDescription("City of Superman");
        loc.setAddress("123 Metropolis Drive");
        loc.setLatitude(42.98909);
        loc.setLongitude(-81.234234);
        locationDao.addLocation(loc);

        Location loc2 = new Location();
        loc2.setName("Gotham");
        loc2.setDescription("City of The Batman");
        loc2.setAddress("456 Gotham Drive");
        loc2.setLatitude(87.9847484);
        loc2.setLongitude(-23.9898989);
        locationDao.addLocation(loc2);

        List<Location> locations = locationDao.getAllLocations();
        assertEquals(locations.size(), 2);
    }

    /**
     * Test of getAllLocationsBySuperId method, of class LocationDao.
     */
    @Test
    public void testGetAllLocationsBySuperId() {
    }

}
