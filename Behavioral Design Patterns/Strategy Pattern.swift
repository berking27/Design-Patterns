//
//  Strategy Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Strategy Pattern ?
 
Strategy Pattern allow you to define a family of interchangeable algorithms, encapsulate each one of them and make it interchangeable. This pattern allow Client to choose an algorithm from a family of algorithms and choose which one client wants at runtime. Let me give an example, You have a Map application that gives you directions such as by car, by public transportation etc. Every algorithm is different. By adding Strategy Pattern you can make your application more flexible, maintainable and testable. Strategy Pattern also suit Single Responsibility principle and Open/Closed principle.(SOLID Principles). Disadvantages of Strategy Pattern is Runtime overhead, Increased Number of classes, Client awareness which means client may confused when choosing a strategy if there are lots of strategies.
 */

import Foundation

//Strategy Protocol

protocol PaymentStrategy{
     func processPayment(amount: Double)
}

//Concrete Strategies
class CreditCardPayment: PaymentStrategy{
     private let cardNumber: String
     private let expirationDate: String
     
     init(cardNumber: String, expirationDate: String) {
          self.cardNumber = cardNumber
          self.expirationDate = expirationDate
     }
     
     func processPayment(amount: Double){
          print("Credit Card Payment of $\(amount) processed with card ending in \(cardNumber.suffix(4))")
     }
}

class BitcoinPayment {
     private let bitcoinAddress: String
     
     init(bitcoinAddress: String){
          self.bitcoinAddress = bitcoinAddress
     }
     
     func processPayment(amount: Double){
          print("Bitcoin Payment of $\(amount) processed with address: \(bitcoinAddress)")
     }
}

//Context

class ShoppingCart{
     private let paymentStrategy: PaymentStrategy
     private var totalAmount: Double = 0.0
     
     init(paymentStrategy: PaymentStrategy, totalAmount: Double) {
          self.paymentStrategy = paymentStrategy
          self.totalAmount = totalAmount
     }
     
     func addItemPrice(price: Double){
          totalAmount += price
     }
     
     func checkOut(){
          paymentStrategy.processPayment(amount: totalAmount)
     }
}

//Client Code
func main(){
     let creditCardPayment = CreditCardPayment(cardNumber: "1234-1234-1234-1234", expirationDate: "09/27")
     let bitCoinPayment = BitcoinPayment (bitcoinAddress: "ABCS123GASW12")
     
     let shoppingCart1 = ShoppingCart(paymentStrategy: creditCardPayment)
     shoppingCart1.addItemPrice(price: 250.00)
     shoppingCart1.addItemPrice(price: 30.00)
     shoppingCart1.checkOut()
     
     let shoppingCart2 = ShoppingCart(paymentStrategy: bitCoinPayment)
     shoppingCart2.addItemPrice(price: 75.00)
     shoppingCart2.checkOut()
}
main()
