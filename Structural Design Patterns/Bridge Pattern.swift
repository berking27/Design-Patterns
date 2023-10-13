//
//  Bridge Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Bridge Pattern?
 
 Bridge Pattern allows you to split set of closely related classes into two separate hierarchies.Let me give an example, you have Car class and you have SedanCars and CoupeCars. You want to extend this classes and add some Features such as BasicModel and AdvancedModel. Instead of Creating new 2 class.
 This will lead a problem because we’re trying to extend the Cars classes into two independent dimensions by it’s Model and Features. By using bridge pattern we can handle this problem but how? By switching inheritance to the object composition.So Original class will reference an object of the new hierarchy instead of having all its state and behaviour within one class.
 How can we implement it inside Code?
 What are the advantages of Bridge Patterns? You can create platform-independent classes or apps.Client code works with high-level abstractions. It isn’t exposed to the platform details.Also it suits open/Closed Principle and Single Responsibility Principle.(SOLID Principles).
 Disadvantage of Bridge Pattern is that your code may become more complicated.
 
 */


import Foundation

class Car{
     var carFeature: CarFeature
     
     init(carFeature: CarFeature) {
          self.carFeature = carFeature
     }
     
     func assemble(){
          fatalError("Subclasses must implement this method")
     }
}

protocol CarFeature{
     func addFeature()
}

class BasicFeatures: CarFeature{
     func addFeature() {
          print("Basic Features added.")
     }
}
class AdvancedFeatures: CarFeature{
     func addFeature() {
          print("Advanced Features added.")
     }
}

class Sedan: Car{
     override func assemble() {
          print("Assembling a Sedan Car")
          carFeature.addFeature()
     }
}

class Coupe: Car{
     override func assemble() {
          print("Assembling a Coupe Car")
          carFeature.addFeature()
     }
}

let basicFeature = BasicFeatures()
let advancedFeature = AdvancedFeatures()

let sedanWithBasic = Sedan(carFeature: basicFeature)
let coupeWithAdvanced = Coupe(carFeature: advancedFeature)

sedanWithBasic.assemble()
coupeWithAdvanced.assemble()
