//
//  BuilderPattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Builder Pattern?
 
 
 Builder Pattern is actually for creating an object with specific attributes.Consider you are making a Hamburger for yourself. You have bread, cheddar, meat sauces etc. You don’t have to add all of these ingredients right. Builder Pattern is using for this problem actually. You’re going to McDonalds and you order BigMac but you are alergic to pickle. You don’t want pickles but cashier says We can not remove pickle. Same idea while you’re creating your hamburger Object if you want to be able to flex you should use a Build Pattern to avoid restrict structure. How can we implement to our code. Here is an example.
 */

import Foundation

//Here is our Builder class by . notations we add the toppings sauces and meat
public class HamburgerBuilder{
     public private(set) var meat : Meat
     public private(set) var sauces : Sauces = []
     public private(set) var toppings : Toppings = []
     
     public func addSauces(_ sauce : Sauces){
          sauces.insert(sauce)
     }
     
     public func removeSauces(_ sauce : Sauces){
          sauces.remove(sauce)
     }
     
     public func addToppings(_ topping : Toppings){
          toppings.insert(topping)
     }
     
     public func removeToppings(_ topping : Toppings){
          toppings.remove(topping)
     }
     
     public func setMeat(_ meat: Meat){
          self.meat = meat
     }
     //After build function we build our hamburger
     public func build() -> Hamburger{
          return Hamburger(meat: meat, sauce: sauces, toppings: toppings)
     }
}
 //You can build your special hamburgers
public class BurgerShop{
     public func createCheeseBurger(using builder: HamburgerBuilder) -> Hamburger{
          builder.setMeat(.beaf)
          builder.addToppings([.cheese, .lettuce])
          builder.addSauces([.barbecue,.mayonnaise,.ketchup])
          return builder.build()
     }
}
//You can build Custom Hamburgers

let myCustomBurgerBuilder = HamburgerBuilder()

myCustomBurgerBuilder.setMeat(.chicken)
myCustomBurgerBuilder.addSauces([.mayonnaise, .ketchup, .mustard])
myCustomBurgerBuilder.addToppings([.cheese, .lettuce, .onion, .pickles])

// I don't want mustard
myCustomBurgerBuilder.removeSauces(.mustard)
// I don't want onion
myCustomBurgerBuilder.removeToppings(.onion)
// I forgot tomatoes
myCustomBurgerBuilder.addToppings(.tomatoes)

let myCustomBurger = myCustomBurgerBuilder.build()
//Here as you can see we can create our Custom Hamburger Without any restriction.
