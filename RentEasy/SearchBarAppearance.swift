//
//  SearchBarAppearance.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-04.
//

import Foundation
import UIKit


struct SearchBarAppearance {
   
    func glassAndFilterTextField(textField: UITextField) {
        // Creating magnifyingGlass
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.backgroundColor = UIColor(named: "systemGray")
        magnifyingGlassImageView.frame = CGRect(x: 100, y: 0, width: 40, height: 40)
        magnifyingGlassImageView.tintColor = UIColor.systemGray
        magnifyingGlassImageView.contentMode = .center
        textField.leftView = magnifyingGlassImageView
        textField.leftViewMode = .always

        // Filter Button
        let filterSymbol = UIImage(systemName: "slider.vertical.3")
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(filterSymbol, for: .normal)
        filterButton.frame = CGRect(x: 100, y: 0, width: 30, height: 30)
        filterButton.tintColor = UIColor.systemGray
        textField.rightView = filterButton
        textField.rightViewMode = .always
        
        textField.layer.cornerRadius = 15.0
        textField.layer.masksToBounds = true
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 2
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.9
    }
    
    
}

