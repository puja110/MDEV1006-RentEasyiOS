//
//  SignUpViewController.swift
//  RentEasy
//
//  Created by CodeSomps on 2023-10-08.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var button_FieldStyle = Button_FieldStyle()
    let dataModelManager = DataModelManager.shared
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        button_FieldStyle.buttonShape(signUpButton)
        button_FieldStyle.textFieldShape(firstNameTextField)
        button_FieldStyle.textFieldShape(lastNameTextField)
        button_FieldStyle.textFieldShape(emailTextField)
        button_FieldStyle.textFieldShape(phoneNumberTextField)
        button_FieldStyle.textFieldShape(passwordTextField)
        button_FieldStyle.textFieldShape(confirmPasswordTextField)
        button_FieldStyle.buttonShape(signUpButton)
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
      
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let phoneNumber = phoneNumberTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextField.text,
              let confirmPassword = confirmPasswordTextField.text
        else {return}
            
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty, !phoneNumber.isEmpty, !firstName.isEmpty, !lastName.isEmpty else {
            print("All fields must be filled")
         showAlert(message: "All fields must be filled.")
            return
            }
            
            guard password == confirmPassword else {
                showAlert(message: "Password do not match")
                return
            }
        
            // Registration successful
        dataModelManager.userRegistration(email: email,
                                          password: password,
                                          firstName: firstName,
                                          lastName: lastName,
                                          phoneNumber: phoneNumber,
                                          context: context)
            
         
        let alertController = UIAlertController(title: "Successful", message: "Go to Login Page", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            self.singUpComplete()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        }
        

        func singUpComplete() {
            guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginPage") else {
                return
            }
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
        
}
