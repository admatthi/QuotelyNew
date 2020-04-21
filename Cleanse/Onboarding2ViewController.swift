//
//  Onboarding2ViewController.swift
//  Cleanse
//
//  Created by Alek Matthiessen on 4/20/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class Onboarding2ViewController: UIViewController {

    @IBAction func tapFour(_ sender: Any) {
        
        selectedgenre = "Exercise"
 
        self.performSegue(withIdentifier: "OnboardingToPaywall", sender: self)
        

    }
    
    @IBAction func tapThree(_ sender: Any) {
       selectedgenre = "Depression"
        
        self.performSegue(withIdentifier: "OnboardingToPaywall", sender: self)
    }
    @IBAction func tapTwo(_ sender: Any) {
        
        selectedgenre = "Relationships"
        
        self.performSegue(withIdentifier: "OnboardingToPaywall", sender: self)
    }
    @IBAction func tapOne(_ sender: Any) {
        
        selectedgenre = "Money"
        
        self.performSegue(withIdentifier: "OnboardingToPaywall", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboarding = true

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
