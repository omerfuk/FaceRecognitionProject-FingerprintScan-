//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Ömer Faruk Kılıçaslan on 29.06.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func scanButtonClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) { // error object awaits pointer type "error" so put "&"
 
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it You?") { success, error in
                
                if success == true {
                    //successfull auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toDetailVC", sender: nil)

                    }
                }
                else {
                    DispatchQueue.main.async {
                        self.errorLabel.text = "Error"
                    }
                }
            }
            
        }
        
    }
    
}

