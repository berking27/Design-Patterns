//
//  Adapter Pattern.swift
//  
//
//  Created by Berkin Koca on 17.08.2023.
//

/*
 What is Adapter Pattern?
 
 Adapter pattern allows objects with incompatible interfaces to collaborate. For example You have a Login system that allows login with Facebook account. But later on you decide to add login with  Apple Account.But SDK of Facebook and Apple are not same. So you create a new AuthService protocol and insert the authorization method of Facebook SDK after that you write extensions for Apple SDK and implement methods of AuthService protocol.Finally write extension for Facebook SDK but you should not write any code inside because all methods already implemented by Facebook SDK. Now you have same interface for both SDKs. To conclude, Adapter Pattern lets you create a middle-layer class that serves as a translator between your code and a 3rd party class or any other class with weird interface.What are the advantages and disadvantages of adapter pattern ? it suits the Single Responsibility Principle and Open/Closed Principle. But it may increase the overall complexity due to creating new interfaces and classes.
 
 */

import Foundation
import SwiftUI
import UIKit

class AdapterRealWorld{
     
     func testAdapterRealWorld(){
          print("Starting an authorization via Facebook")
          startAuthorization(with: FacebookAuthSDK)
          
          print("Starting an authorization via Apple")
          startAuthorization(with: AppleAuthSDK)
     }
     
     func startAuthorization(with service : AuthService){
          let topViewController = UIViewController()
          
          service.presentAuthFlow(from: topViewController)
     }
}

protocol AuthService {
     func presentAuthFlow(from viewController : UIViewController)
     
}

class FacebookAuthSDK{
     func presentAuthFlow(from viewController : UIViewController){
          print("Facebook WebView has been shown")
     }
}

class AppleAuthSDK{
     func startAuthorization(with viewController : UIViewController){
          print("Apple WebView has been shown.")
     }
}

extension AppleAuthSDK : AuthService{
     //Here is an Adapter
     //Not creating another class just extend an existing one
     
     func presentAuthFlow(from viewController: UIViewController) {
          print("The Adapter is called! Redirecting to original method..")
          self.startAuthorization(with: viewController)
     }
}

extension FacebookAuthSDK : AuthService{
     //This extension tells a compiler that both SDKs have the same interface
}
