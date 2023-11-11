//
//  ProfileViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var settingView: UIView!
    
    @IBOutlet weak var paymentDetailsView: UIView!
    
    var buttonFieldStyle = Button_FieldStyle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        profilePicture.layer.cornerRadius = profilePicture.frame.size.width / 2
        buttonFieldStyle.customButtonShape(settingView)
        buttonFieldStyle.customButtonShape(paymentDetailsView)
        buttonFieldStyle.buttonShape(logoutButton)
    }
    
    
    @IBAction func settingsButton(_ sender: UIButton) {
        print("Settings Pressed")
    }
    
    
    @IBAction func paymentDetailsButton(_ sender: UIButton) {
        print("PaymentButtonPressed")
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        
        let yes = UIAlertAction(title: "Yes", style: .destructive) { _ in
            self.logOut()
        }
        
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
        alertController.addAction(yes)
        alertController.addAction(no)
        present(alertController, animated: true, completion: nil)
    }
    
    func logOut() {
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginPage") {
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        }
    }
}
