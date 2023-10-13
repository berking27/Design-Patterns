//
//  Command Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Command Pattern?
 
 Command Pattern encapsulates a client’s request(command) as an object which contains everything necessary to fullfil the request. As a result dependency between client and the object performing the request is reduced.  So it allows client to dynamically create and manage different requests. This Pattern enhances code flexibility, maintainability and extensibility. How does it works ? First you define your command interface that have execute() method init. Than create concrete command classes and  implement the command interface with concrete classes that encapsulates specific functions. Each concrete command class holds a reference to the receiver object that will perform the action that command is executed. Define your receiver which have necessary methods to carry out requested actions. Create invoker class that holds references to Command objects. Invoker is responsible for calling execute() function. Client creates and configure commands after that invoker executes the commands than command executes the requests.

 What are the advantages of Command Pattern?  Decoupling, Flexibility, extensibility, allows undo and redo actions, Logging is easier to facilitating auditing and debugging

 What are the disadvantages of Command Pattern? Increased complexity, High memory usage especially dealing with a large number of commands.
 */

import Foundation

protocol CarCommand{
     func execute()
}

//Concrete Command Classes
class TurnOnExhaustSystemCommand: CarCommand{
     private let car: Car
     
     init(car: Car) {
          self.car = car
     }
     
     func execute(){
          car.turnOnExhaustSystem()
     }
}

class TurnOffExhaustSystemCommand: CarCommand{
     private let car: Car
     
     init(car: Car) {
          self.car = car
     }
     
     func execute(){
          car.turnOffExhaustSystem()
     }
}
class IncreaseVolumeCommand: CarCommand{
     private let car: Car
     
     init(car: Car){
          self.car = car
     }
     func execute(){
          car.increaseVolume()
     }
}

class DecreaseVolumeCommand: CarCommand{
     private let car: Car
     
     init(car: Car){
          self.car = car
     }
     
     func execute(){
          car.decreaseVolume()
     }
}

class IncreaseVolumeCommand: CarCommand{
     private let car: Car
     
     init(car: Car) {
          self.car = car
     }
     
     func execute(){
          car.increaseVolume()
     }
}

//Receiver Class
class Car{
     var exhaustSystemOn = false
     var audioVolume = 5
     
     func turnOnExhaustSystem(){
          exhaustSystemOn = true
          print("exhaust System is on")
     }
     func turnOffExhaustSystem(){
          exhaustSystemOn = false
          print("exhaust System is off")
     }
     
     func increaseVolume(){
          audioVolume += 1
          print("Audio Volume increased to \(audioVolume)")
     }
     
     func decreaseVolume(){
          audioVolume -= 1
          print("Audio Volume increased to \(audioVolume)")
     }
}


//Invoker Class
class CarRemoteControl {
     private var command: CarCommand?
     
     func setCommand(command: CarCommand){
          self.command = command
     }
     
     func pressButton(){
          command?.execute()
     }
}

//Client Code
func main(){
     let car = Car()
     
     let exhaustSystemONCommand = TurnOnExhaustSystemCommand(car: car)
     let exhaustSystemOffCommand = TurnOffExhaustSystemCommand(car: car)
     let volumeIncreaseCommand = IncreaseVolumeCommand(car: car)
     let volumeDecreaseCommand = DecreaseVolumeCommand(car: car)
     
     let remote = CarRemoteControl()
     
     remote.setCommand(command: exhaustSystemONCommand)
     remote.pressButton() // Turns on Exhaust System
     
     remote.setCommand(command: exhaustSystemOffCommand)
     remote.pressButton() // Turns off Exhaust System
     
     remote.setCommand(command: volumeIncreaseCommand)
     remote.pressButton() // Increase volume
     
     remote.setCommand(command: volumeDecreaseCommand)
     remote.pressButton() // Decrease volume
}

main()
