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
        // Create a magnifying glass SF Symbol and set it as the left view
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20) // Adjust the frame as needed
        magnifyingGlassImageView.contentMode = .center
        textField.leftView = magnifyingGlassImageView
        textField.leftViewMode = .always

        // Create a filter button SF Symbol and set it as the right view
        let filterSymbol = UIImage(systemName: "slider.horizontal.3")
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(filterSymbol, for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // Adjust the frame as needed
        textField.rightView = filterButton
        textField.rightViewMode = .always
    }
    
    
   
}
