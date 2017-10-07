/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.vendingmachinespringmvc.controller;

import com.sg.vendingmachinespringmvc.dao.ItemListDao;
import com.sg.vendingmachinespringmvc.model.Item;
import com.sg.vendingmachinespringmvc.service.VendingMachine;
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

    VendingMachine service;
    long itemSelected;
    BigDecimal totalIn = new BigDecimal(0);
    String message = "";
    String change;

    @Inject
    public ItemController(VendingMachine service) {
        this.service = service;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String displayItems(Model model) {

        List<Item> itemList = service.getAllItems();

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
        message = "";
        change = "";

        return "redirect:/";
    }

    @RequestMapping(value = "/calculateMoney", method = RequestMethod.POST)
    public String calculateMoney(HttpServletRequest request) {
        String money = request.getParameter("money");
        totalIn = new BigDecimal(money).add(totalIn);

        return "redirect:/";
    }

    @RequestMapping(value = "/makePurchase", method = RequestMethod.GET)
    public String makePurchase() {
        if (service.checkInventory(itemSelected) == false) {
            message = "SOLD OUT";
        } else if (service.checkIfUserHasEnoughMoney(totalIn, itemSelected) == false) {
            BigDecimal amountShort = service.calculateAmountShort(totalIn, itemSelected);
            message = "Please deposit " + amountShort;
        } else {
            service.updateInventory(itemSelected);
            BigDecimal userChange = service.calculateUserChange(totalIn, itemSelected);
            change = service.getChange(userChange);
            totalIn = BigDecimal.ZERO;
            message = "Thank you!!!";
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/getMoneyBack", method = RequestMethod.GET)
    public String getMoneyBack() {
        change = service.getChange(totalIn);
        totalIn = BigDecimal.ZERO;
        message = "";

        return "redirect:/";
    }

}
