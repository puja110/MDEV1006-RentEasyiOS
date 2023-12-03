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
    @IBOutlet weak var loginLogoImg: UIImageView!
    
    let dataModelManager = DataModelManager.shared
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var button_FieldStyle = Button_FieldStyle()
    var searchBarAppearance = SearchBarAppearance()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Animation
               loginLogoImg.alpha = 0
               loginLogoImg.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
               UIView.animate(withDuration: 1.0, delay: 0.5,
                              usingSpringWithDamping: 0.7,
                              initialSpringVelocity: 0,
                              animations: {
                   self.loginLogoImg.alpha = 1
                   self.loginLogoImg.transform = .identity
               }, completion: nil)
        
        //Button and TextField Styling
        button_FieldStyle.buttonShape(loginButton)
        button_FieldStyle.buttonShape(createAccountButton)
        button_FieldStyle.textFieldShape(usernameTextField)
        button_FieldStyle.textFieldShape(passwordTextField)
        searchBarAppearance.secureEyeView(passwordTextField)
        
        usernameTextField.text = "suyog@re.com"
        passwordTextField.text = "test123"
    }
    
   
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        guard let username = usernameTextField.text, let password = passwordTextField.text else {return}
          guard !username.isEmpty, !password.isEmpty else {return}
        if dataModelManager.userLogin(emailAddress: username, password: password) {
                performTabBarSegue()
            } else {
                let alertController = UIAlertController(title: "Failed", message: "Try again", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
            }
    }
    
    func performTabBarSegue() {
        if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "MyTabBar") {
            tabBarVC.modalPresentationStyle = .fullScreen
            present(tabBarVC, animated: true, completion: nil)
        }
    }

}

