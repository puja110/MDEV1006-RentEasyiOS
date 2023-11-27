//
//  SearchFilterView.swift
//  RentEasy
//
//  Created by CodeSomps on 2023-11-21.
//

import UIKit

class SearchFilterView: UIViewController {

    @IBOutlet weak var popUpStack: UIStackView!
    @IBOutlet weak var popBackgroundView: UIView!
    @IBOutlet weak var bathroomsButton: UIButton!
    @IBOutlet weak var bedroomButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popBackgroundView.layer.cornerRadius = 40
        popUpStack.layer.cornerRadius = 40
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
