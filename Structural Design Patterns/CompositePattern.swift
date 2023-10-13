//
//  CompositePattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Composite Pattern?
 Composite Pattern allows you to compose objects into tree structures to represent part-whole hierarchies. It lets client treat individual objects and compositions of objects uniformly. There are key participants of Composite Pattern

 Component→ Base interface or abstract class that defines the common operations for both leaf(individual) objects and composite (group) objects. Component provides a unified way to interact both types of objects.

 Leaf → These are the individual objects that have no children.

 Composite→ These are objects that contain leaf objects or/and  other composite objects.
 
 */

import Foundation

//Component -> Both individual car parts and composite car assemblies

protocol CarComponent{
     var name: String { get }
     func assemble()
}

//Leaf -> Individual Parts

class Engine: CarComponent{
     let name: String
     
     init(name: String) {
          self.name = name
     }
     
     func assemble() {
          print("Assembling engine: \(name)")
     }
}

class Wheel: CarComponent{
     let name: String
     
     init(name: String) {
          self.name = name
     }
     func assemble() {
          print("Assembling wheel: \(name)")
     }
}

//Composite -> composite car assembly that contain both individual and other subassemblies

class CarAssembly: CarComponent{
     let name: String
     var components: [CarComponent] = []
     
     init(name: String) {
          self.name = name
     }
     
     func addComponent(_ component: CarComponent){
          components.append(component)
     }
     func assemble() {
          print("Assembling car assembly: \(name)")
          print("Adding components:")
          for component in components{
               component.assemble()
          }
     }
}

let engine = Engine(name: "4.0 Flat Six")
let wheelFrontLeft = Wheel(name: "Front Left")
let wheelFrontRight = Wheel(name: "Front Right")
let wheelRearLeft = Wheel(name: "Rear Left")
let wheelRearRight = Wheel(name: "Rear Right")


let frontWheels = CarAssembly(name: "Front Wheels")
frontWheels.addComponent(wheelFrontLeft)
frontWheels.addComponent(wheelFrontRight)

let rearWheels = CarAssembly(name: "Rear Wheels")
rearWheels.addComponent(wheelRearLeft)
rearWheels.addComponent(wheelRearRight)

let car = CarAssembly(name: "Porsche 911 GT3")
car.addComponent(engine)
car.addComponent(frontWheels)
car.addComponent(rearWheels)

car.assemble()


