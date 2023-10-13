//
//  FactoryMethod Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Factory Method 
 
 Factory Method provides an interface for creating objects in superclass but allow different sub-classes to use the  methods by their own styles. For example Let’s think about shipping company. You make deliveries by Truck, Plane and Ship.They all inherited from Logistic Class. But all types have their own transportation style. So we can not define a same class same functionality class inside our Logistic Class. Instead of doing that we create our Logistic class as a protocol and then our other classes will inherited from Logistic class. Then define empty methods inside protocol class. After that for our all sub-classes we define same method which is createTransport() to each one by their own functions init. Now we avoid coupling between classes. And we can add new types of sub-classes without any change to our main code. What is the disadvantage of using factory method is it may be lead more complicated code since we need more sub-classes and methods inside it.Let me explain it inside code.

 What is Abstract Factory Method
 
 Also there is a Abstract Factory Method but there is no code Sample here. Abstract Factory method is similar to Factory Method. Main differences between them is that factory method is a single method, an an abstract factory is an object. Factory Method is just a method it can be overridden in a subclass whereas the abstract factory is an object that has multiple factory methods on it.
 
 */

import Foundation

protocol LogisticsProtocol{
     func createTransport() ->String
}

struct ShipLogistic : LogisticsProtocol{
     func createTransport() -> String {
          return "Ship on the way!!"
     }
}


struct TruckLogistic : LogisticsProtocol{
     func createTransport() -> String{
          return "Truck on the Way!!"
     }
}

struct PlaneLogistic : LogisticsProtocol{
     func createTransport() -> String {
          return "Plane on the Way!!"
     }
}

class Client {
     static func someClientCode(logisticsProtocol : LogisticsProtocol){
          print("Products are ready" + logisticsProtocol.createTransport())
     }
}

class FactoryMethod{
     func testFactoryMethod() {
          print("Delivery by ship ")
          Client.someClientCode(logisticsProtocol: ShipLogistic())

             print("Delivery by Truck ")
          Client.someClientCode(logisticsProtocol: TruckLogistic())

          print("Delivery by Plane ")
          Client.someClientCode(logisticsProtocol: PlaneLogistic())
     }
}
