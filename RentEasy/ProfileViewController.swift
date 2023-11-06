//
//  ProfileViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        if let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginPage") {
            loginVC.modalPresentationStyle = .fullScreen
              present(loginVC, animated: true, completion: nil)
          }
    }

}
