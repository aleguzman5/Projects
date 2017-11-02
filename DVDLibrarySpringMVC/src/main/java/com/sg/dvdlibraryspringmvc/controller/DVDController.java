/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.dvdlibraryspringmvc.controller;

import com.sg.dvdlibraryspringmvc.dao.DVDListDao;
import com.sg.dvdlibraryspringmvc.model.DVD;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Alejandro
 */
@Controller
public class DVDController {

    DVDListDao dao;

//    @Inject
//    public DVDController(DVDListDao dao) {
//        this.dao = dao;
//    }


//
//    @RequestMapping(value = "/displayContactDetails", method = RequestMethod.GET)
//    public String displayContactDetails(HttpServletRequest request, Model model) {
//        String contactIdParameter = request.getParameter("contactId");
//        int contactId = Integer.parseInt(contactIdParameter);
//
//        Contact contact = dao.getContactById(contactId);
//
//        model.addAttribute("contact", contact);
//
//        return "contactDetails";
//    }
//
//    @RequestMapping(value = "/deleteContact", method = RequestMethod.GET)
//    public String deleteContact(HttpServletRequest request) {
//        String contactIdParameter = request.getParameter("contactId");
//        long contactId = Long.parseLong(contactIdParameter);
//        dao.removeContact(contactId);
//        return "redirect:displayContactsPage";
//    }
//
//    @RequestMapping(value = "/displayEditContactForm", method = RequestMethod.GET)
//    public String displayEditContactForm(HttpServletRequest request, Model model) {
//        String contactIdParameter = request.getParameter("contactId");
//        long contactId = Long.parseLong(contactIdParameter);
//        Contact contact = dao.getContactById(contactId);
//        model.addAttribute("contact", contact);
//        return "editContactForm";
//    }
//
//    @RequestMapping(value = "/editContact", method = RequestMethod.POST)
//    public String editContact(@Valid @ModelAttribute("contact") Contact contact, BindingResult result) {
//
//        if(result.hasErrors()) {
//            return "editContactForm";
//        }
//        
//        dao.updateContact(contact);
//
//        return "redirect:displayContactsPage";
//    }
    //    @RequestMapping(value = "/displayContactsPage", method = RequestMethod.GET)
//    public String displayContactPage(Model model) {
//
//        List<Contact> contactList = dao.getAllContacts();
//
//        model.addAttribute("contactList", contactList);
//
//        return "contacts";
//    }
//
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String displayDvdsPage(Model model) {
        
//        List<DVD> dvdList = dao.getAllDVDs();
//        
//        model.addAttribute("dvdList", dvdList);
        
        return "index";
    }

    @RequestMapping(value = "/returnToIndex", method = RequestMethod.POST)
    public String displayDvds() {
        return "index";
    }

    //    @RequestMapping(value = "/createContact", method = RequestMethod.POST)
//    public String createContact(HttpServletRequest request) {
//        // grab the incoming values from the form and create a new Contact
//        // object
//        Contact contact = new Contact();
//        contact.setFirstName(request.getParameter("firstName"));
//        contact.setLastName(request.getParameter("lastName"));
//        contact.setCompany(request.getParameter("company"));
//        contact.setPhone(request.getParameter("phone"));
//        contact.setEmail(request.getParameter("email"));
//
//        // persist the new Contact
//        dao.addContact(contact);
//
//        // we don't want to forward to a View component - we want to
//        // redirect to the endpoint that displays the Contacts Page
//        // so it can display the new Contact in the table.
//        return "redirect:displayContactsPage";
//    }
    @RequestMapping(value = "/displayCreateDvdPage", method = RequestMethod.POST)
    public String displayCreateDvdForm() {
        return "createDvdForm";
    }
    
//    @RequestMapping(value = "/displayCreateDvdPage", method = RequestMethod.POST)
//    public String displayCreateDvdForm(HttpServletRequest request) {
//        
//        DVD dvd = new DVD();
//        dvd.setTitle(request.getParameter("title"));
//        dvd.setReleaseYear(request.getParameter("releaseYear"));
//        return "createDvdForm";
//    }
}
