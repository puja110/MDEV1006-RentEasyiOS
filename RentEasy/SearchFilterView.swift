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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sliderPriceRange: UISlider!
    
    var sliderResults: [RentDataEntity] = []
    var destinationVC: FilteredResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FilteredResult") as? FilteredResultViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popBackgroundView.layer.cornerRadius = 40
        popUpStack.layer.cornerRadius = 40
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderButton(_ sender: UISlider) {
        let currentAmount = Int(sender.value)
               priceLabel.text = "$\(currentAmount) /month"
    }
    
    @IBAction func showButtonPressed(_ sender: UIButton) {
        let dataModelManager = DataModelManager.shared
        let amountToSearch = Int(sliderPriceRange.value)
        sliderResults = dataModelManager.sliderAmountSearch(sliderAmount: amountToSearch)
        print(sliderResults)
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "FilteredResult") as? FilteredResultViewController {
            destinationVC.filteredRentData = sliderResults
            destinationVC.modalPresentationStyle = .pageSheet
            if let bottomSheet = destinationVC.presentationController as? UISheetPresentationController {
                bottomSheet.detents = [.medium(), .large()]
                bottomSheet.largestUndimmedDetentIdentifier = .medium
                bottomSheet.preferredCornerRadius = 40
                bottomSheet.prefersScrollingExpandsWhenScrolledToEdge = false
                bottomSheet.prefersGrabberVisible = true
            }
            present(destinationVC, animated: true)
        } else {
            print("Failed")
        }
    }
}
