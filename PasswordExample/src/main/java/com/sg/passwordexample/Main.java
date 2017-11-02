/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.passwordexample;

import java.io.Console;

/**
 *
 * @author Alejandro
 */
public class Main {

    public void passwordExample() {
        Console console = System.console();
        if (console == null) {
            System.out.println("Couldn't get Console instance");
            System.exit(0);
        }

        console.printf("Testing password%n");
        char passwordArray[] = console.readPassword("Enter your secret password: ");
        console.printf("Password entered was: %s%n", new String(passwordArray));

    }

    public static void main(String[] args) {
        new Main().passwordExample();
    }
}
