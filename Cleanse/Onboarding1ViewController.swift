//
//  Onboarding1ViewController.swift
//  FBSDKCoreKit
//
//  Created by Alek Matthiessen on 4/20/20.
//

import UIKit
import FBSDKCoreKit

class Onboarding1ViewController: UIViewController {

    @IBAction func tapNext(_ sender: Any) {
        
        self.performSegue(withIdentifier: "step1tostep2", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
