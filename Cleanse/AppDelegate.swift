//
//  AppDelegate.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 10/26/19.
//  Copyright © 2019 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher
import FirebaseDatabase
import FirebaseStorage
import Purchases
import FBSDKCoreKit
import AppsFlyerLib

var entereddiscount = String()

var actualdiscount = String()

var monthdate = String()

var dayweek = String()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, AppsFlyerTrackerDelegate {
    func onConversionDataSuccess(_ conversionInfo: [AnyHashable : Any]) {
        print("success")
    }
    
    
    
    
    func onConversionDataFail(_ error: Error) {
        print("\(error)")

    }
    
    @objc func sendLaunch(app:Any) {
        AppsFlyerTracker.shared().trackAppLaunch()
    }
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        AppEvents.activateApp()
        
        AppsFlyerTracker.shared().appsFlyerDevKey = "GSfLvX3FDxH58hR3yDZzZe"
        AppsFlyerTracker.shared().appleAppID = "1486018778"
        AppsFlyerTracker.shared().delegate = self
        AppsFlyerTracker.shared().isDebug = true

        NotificationCenter.default.addObserver(self,
        selector: #selector(sendLaunch),
        // For Swift version < 4.2 replace name argument with the commented out code
        name: UIApplication.didBecomeActiveNotification, //.UIApplicationDidBecomeActive for Swift < 4.2
        object: nil)
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        
        Purchases.debugLogsEnabled = true
        Purchases.configure(withAPIKey: "paCLaBYrGELMfdxuMQqbROxMfgDbcGGn", appUserID: nil)

        refer = "On Open"
     
        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarBuyer : UITabBarController = mainStoryboardIpad.instantiateViewController(withIdentifier: "HomeTab") as! UITabBarController
        
        uid = UIDevice.current.identifierForVendor?.uuidString ?? "x"

        let date = Date()
                          let dateFormatter = DateFormatter()
                          dateFormatter.dateFormat = "MMM d"
           var result = dateFormatter.string(from: date)

                          dateformat = result
           
           monthdate = dateformat
           
           dateFormatter.dateFormat = "yyyy-MM-dd"

           result = dateFormatter.string(from: date)
           var weekday = (Date().dayOfWeek()!)
        
               
           dayweek = String(weekday)
        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = tabBarBuyer
//
//        self.window?.makeKeyAndVisible()
        
//        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
//          
//          if launchedBefore {
//              
//              tabBarBuyer.selectedIndex = 0
//              
//          } else {
//              
//              tabBarBuyer.selectedIndex = 1
//              
//              UserDefaults.standard.set(true, forKey: "launchedBefore")
//              
//          }
        
        queryforpaywall()
        
        
   

        return true
    }
    


    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
        
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

            print("i am not available in simulator \(error)")
    }
    
    func queryforpaywall() {
                
        ref?.child("Users").observeSingleEvent(of: .value, with: { (snapshot) in
            
            let value = snapshot.value as? NSDictionary
            
     
            
            if let slimey = value?["Slimey"] as? String {

                slimeybool = true
                
            } else {
                
                slimeybool = false

            }
            
            if let discountcode = value?["DiscountCode"] as? String {
                
               actualdiscount = discountcode
                
            } else {
                
                
            }
        })
        
    }
    
    

    // MARK: UISceneSession Lifecycle




}




