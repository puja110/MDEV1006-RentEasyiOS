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
        //MagnifyingGlass
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.backgroundColor = UIColor(named: "systemGray")
        magnifyingGlassImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 50)
        magnifyingGlassImageView.tintColor = UIColor.black
        magnifyingGlassImageView.contentMode = .center
        
        let paddingLeft = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        paddingLeft.addSubview(magnifyingGlassImageView)
        textField.leftView = paddingLeft
        textField.leftViewMode = .always
        
        // Filter Button
         let filterSymbol = UIImage(systemName: "slider.vertical.3")
         let filterButton = UIButton(type: .custom)
         filterButton.setImage(filterSymbol, for: .normal)
         filterButton.tintColor = UIColor.black

        filterButton.frame = CGRect(x: 0, y: 0, width: 40, height: 50)
         let paddingRight = UIView(frame: filterButton.frame)
         paddingRight.addSubview(filterButton)
         textField.rightView = paddingRight
         textField.rightViewMode = .always
        
        //Custom Radius and Shadow
        textField.layer.cornerRadius = 15.0
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 0.2
        textField.layer.shadowColor = UIColor.systemGray5.cgColor
        textField.layer.shadowRadius = 2
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.9
    }
    
    func secureEyeView(_ textField: UITextField) {
        // Filter Button
         let filterSymbol = UIImage(named: "secureEye")
         let filterButton = UIButton(type: .custom)
         filterButton.setImage(filterSymbol, for: .normal)
         filterButton.tintColor = UIColor.black

        filterButton.frame = CGRect(x: 0, y: 0, width: 40, height: 50)
         let paddingRight = UIView(frame: filterButton.frame)
         paddingRight.addSubview(filterButton)
         textField.rightView = paddingRight
         textField.rightViewMode = .always
    }
    
    
}

