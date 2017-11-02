/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.fibonacci;

import java.util.Scanner;

/**
 *
 * @author Alejandro
 */
public class Fibonacci {

    public static void main(String[] args) {

        int number = 4000000;
        
        int sum = 0;
        int fibo1 = 1, fibo2 = 1, fibonacci = 1;
        for (int i = 1; fibo2 < number; i++) {
            fibonacci = fibo1 + fibo2;
            if(fibonacci % 2 == 0) {
                sum += fibonacci;
            }
            fibo1 = fibo2;
            fibo2 = fibonacci;
        }
        System.out.println("Sum: " + sum);
        
        sum = 0;
        fibo1 = 1;
        fibo2 = 1; 
        fibonacci = 1;
        boolean check;
        for (int i = 1; fibo2 < number; i++) {
            fibonacci = fibo1 + fibo2;
            if(fibo1 >= 2){
                check = isPrime(fibo1);
                if (check == true) {
                    sum+= fibo1;
                }
            }
            if(fibo2 >= 2){
                check = isPrime(fibo2);
                if (check == true) {
                    sum+= fibo1;
                }
            }
            fibo1 = fibo2;
            fibo2 = fibonacci;
        }
        System.out.println("Sum: " + sum);
    }
    
    public static boolean isPrime(int number) {
        
        int check = 0;
        for(int i = 1; i< number; i++){
            if (i % 2 == 0) {
                check++;
            }
        }       
        if (check > 2) {
            return false;
        } else {
            return true;
        }
    }
}

