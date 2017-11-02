/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.dvdlibraryspringmvc.dao;

import com.sg.dvdlibraryspringmvc.model.DVD;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alejandro
 */
public interface DVDListDao {

    public DVD addDVD(DVD dvd);

    public void removeDVD(DVD dvd);

    public void updateDVD(DVD dvd);

    public List<DVD> getAllDVDs();

    public DVD getDvdById(int dvdId);
    
    //    public List<DVD> searchDvds(Map<SearchTerm, String> criteria)
}
