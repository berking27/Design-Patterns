//
//  Observer Pattern.swift
//
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Observer Pattern?
 
 Observer pattern lets you defines a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing. It defines one to many dependency between objects. When one object change its state all the dependent objects (observers) are automatically notified and updated.

 Advantages of Observer Pattern → Decoupling, Flexibility, Extensibility, Reusability and Reduced Dependency this reduce the risk of code changes affecting other parts of system.

 Disadvantages of Observer Pattern → Update Overhead if a subject has many observers and frequent updates notifying all of the observers can lead a performance overhead. Complexity, Debugging and Testing can be challenged. Also may occur memory leaks.
 
 */

import Foundation
//Observer Protocol

protocol CarBuyerObserver {
     func carModelAvailable(model: String)
}

//Subject (Observable)
class CarDealership{
     private var observers: [CarBuyerObserver ] = []
     private var availableCarModels: [String] = []
     
     func addObserver(observer: CarBuyerObserver ){
          observers.append(observer)
     }
     func removeObserver(observer: CarBuyerObserver){
          observers.removeAll(where: $0 === observer)
     }
     
     func addCarModel(model: String){
          availableCarModels.append(model)
          notifyObservers(model: model)
     }
     
     private func notifyObservers(model: String){
          for observer in observers {
               observer.carModelAvailable(model: model)
          }
     }
}
//Concrete Observers
class CarBuyer: CarBuyerObserver{
     private let name: String
     
     init(name: String){
          self.name = name
     }
     
     func carModelAvailable(model: String) {
          print("\(name) Exiting News! \(model) is now available in our Dealership")
     }
}

//Client Code

func main(){
     let dealership = CarDealership()
     
     let berkin = CarBuyer(name: "Berkin")
     let ipek = CarBuyer(name: "İbek")
     
     dealership.addCarModel(model: "Porsche GT3")
     dealership.addCarModel(model: "Panamera GTS")
}
main()
