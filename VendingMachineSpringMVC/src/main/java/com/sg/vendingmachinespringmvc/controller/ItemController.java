/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.controller;

import com.sg.vendingmachinespringmvc.dao.ItemListDao;
import com.sg.vendingmachinespringmvc.model.Item;
import java.math.BigDecimal;
import java.math.RoundingMode;
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
public class ItemController {
    
    ItemListDao dao;
    long itemSelected;
    BigDecimal totalIn = new BigDecimal(0);
    String message = "";
    String change;

    @Inject
    public ItemController(ItemListDao dao) {
        this.dao = dao;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String displayItems(Model model) {

        List<Item> itemList = dao.getAllItems();

        model.addAttribute("itemList", itemList);
        model.addAttribute("itemSelected", itemSelected);
        model.addAttribute("totalIn", totalIn.setScale(2, RoundingMode.HALF_UP));
        model.addAttribute("message", message);
        model.addAttribute("change", change);
        return "index";
    }
    
    @RequestMapping(value = "/selectItem", method = RequestMethod.POST)
    public String displaySelectedItem(HttpServletRequest request, Model model) {
        String itemId = request.getParameter("itemId");
        itemSelected = Long.parseLong(itemId);
       
        return "redirect:/";
    }
    
    @RequestMapping(value = "/calculateMoney", method = RequestMethod.POST)
    public String calculateMoney(HttpServletRequest request, Model model) {
        String money = request.getParameter("money");
        totalIn = new BigDecimal(money).add(totalIn);
       
        return "redirect:/";
    }
}
