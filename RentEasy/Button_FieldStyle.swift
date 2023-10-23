//
//  Button&FieldStyle.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-20.
//

import Foundation
import UIKit


struct Button_FieldStyle {
    
    
    func buttonShape(_ button: UIButton) {
        
        button.layer.cornerRadius = 10.0
        // button.layer.masksToBounds = true
         button.layer.shadowColor = UIColor.gray.cgColor
         button.layer.shadowRadius = 5
         button.layer.shadowOffset = CGSize(width: 1, height: 1)
         button.layer.shadowOpacity = 1
       
    }
    
    func textFieldShape(_ textField: UITextField) {
       // textField.layer.cornerRadius = 10.0
      //  textField.layer.masksToBounds = true
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 2
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.3
       // textField.backgroundColor = UIColor.white
    }
}
