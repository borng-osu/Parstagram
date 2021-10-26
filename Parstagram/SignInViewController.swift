//
//  SignInViewController.swift
//  Parstagram
//
//  Created by Born4Film on 10/24/21.
//

import UIKit
import Parse

class SignInViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var pwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username:String = userField.text!
        let password:String = pwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        user.username = userField.text
        user.password = pwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "signinSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
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
