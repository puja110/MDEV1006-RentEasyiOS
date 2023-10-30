//
//  ViewController.swift
//  RentEasy
//
//  Created by CodeSomps on 2023-10-06.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   // @IBOutlet weak var loginLogo: UILabel!
    
    @IBOutlet weak var loginLogoImg: UIImageView!
    
    
    //Button and textField styling
    var button_FieldStyle = Button_FieldStyle()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Login Animation
               loginLogoImg.alpha = 0
               loginLogoImg.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
               UIView.animate(withDuration: 1.0, delay: 0.5,
                              usingSpringWithDamping: 0.7,
                              initialSpringVelocity: 0,
                              options: [],
                              animations: {
                   self.loginLogoImg.alpha = 1
                   self.loginLogoImg.transform = .identity
               }, completion: nil)
//        
        //Button and TextField Styling
        button_FieldStyle.buttonShape(loginButton)
        button_FieldStyle.buttonShape(createAccountButton)
        button_FieldStyle.textFieldShape(usernameTextField)
        button_FieldStyle.textFieldShape(passwordTextField)
     
    }
    
   

}

