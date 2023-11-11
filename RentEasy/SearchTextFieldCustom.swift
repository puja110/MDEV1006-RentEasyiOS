//
//  SearchTextFieldCustom.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-03.
//

import Foundation
import UIKit

struct SearchTextFieldCustom {
    
    func setupSearchTextField(for textField: UITextField) {
        
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        magnifyingGlassImageView.contentMode = .center
        textField.leftView = magnifyingGlassImageView
        textField.leftViewMode = .always

       
        let filterSymbol = UIImage(systemName: "slider.horizontal.3")
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(filterSymbol, for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.rightView = filterButton
        textField.rightViewMode = .always
    }
    
    
   
}
