//
//  Singelton Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Singelton Pattern?
 
 
 Singelton objects purpose is to create a object only once in application’s life time.Why we need Singelton ? We need singleton when we don’t want to change that object attributes and information inside it.That means that class has only one instance, while providing global access point to this instance. What are the disadvantages? Unit Test can be difficult. Also it can lead tightly coupled code what that mean is sometimes it is hard to make changes. And When you create object it will stored in memory so it may lead high memory usage.
 
 Let’s talk about implementation in SwiftUI. In my application I need a FirebaseManager object that is unique and only for one user. So I decided to implement Singelton Pattern to my FirebaseManager object.
 
 */

import Foundation

class FirebaseManager : NetworkManagerProtocol{
     
     static let shared = FirebaseManager()
     
     @Published var usserSession = FirebaseAuth.User?
     @Published var currentUser = User?
     
     private init(){
          self.userSession = Auth.auth().currentUser
     }
     
     func signIn(){
          //SignIn function code implementation
     }
}


class LoginViewModel : ObservableObject{
     func loginTapped(){
          //Usage of Singelton Object
          FirebaseManager.shared.signIn()
     }
}
