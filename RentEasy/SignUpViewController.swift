//
//  SignUpViewController.swift
//  RentEasy
//
//  Created by CodeSomps on 2023-10-08.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var button_FieldStyle = Button_FieldStyle()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button_FieldStyle.buttonShape(signUpButton)
        button_FieldStyle.textFieldShape(firstNameTextField)
        button_FieldStyle.textFieldShape(lastNameTextField)
        button_FieldStyle.textFieldShape(emailTextField)
        button_FieldStyle.textFieldShape(phoneNumberTextField)
        button_FieldStyle.textFieldShape(passwordTextField)
        button_FieldStyle.textFieldShape(confirmPasswordTextField)
        button_FieldStyle.buttonShape(signUpButton)
       
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
