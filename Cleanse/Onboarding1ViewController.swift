//
//  Onboarding1ViewController.swift
//  FBSDKCoreKit
//
//  Created by Alek Matthiessen on 4/20/20.
//

import UIKit
import FBSDKCoreKit

class Onboarding1ViewController: UIViewController {

    func logNotificationsSettings(referrer : String) {
        AppEvents.logEvent(AppEvents.Name(rawValue: "notifications enabled"), parameters: ["" : ""])
    }
    @IBAction func tapNext(_ sender: Any) {
        
        self.performSegue(withIdentifier: "step1tostep2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().getNotificationSettings(){ (settings) in

            switch settings.soundSetting{
            case .enabled:

                self.logNotificationsSettings(referrer: "true")

            case .disabled:

                self.logNotificationsSettings(referrer: "false")

            case .notSupported:
                
                print("something vital went wrong here")
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
