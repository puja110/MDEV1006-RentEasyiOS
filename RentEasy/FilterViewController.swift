//
//  FilterViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-03.
//

import UIKit
import MapKit

class FilterViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
   
    let locationManager = CLLocationManager()
    
    //Instatiating the bottomSheet to popUp
      lazy var destinationVC: FilteredResultViewController? = {
          return UIStoryboard(name: "Main", bundle: nil)
          .instantiateViewController(withIdentifier: "FilteredResult") as?FilteredResultViewController}()
      
      override func viewDidLoad() {
          super.viewDidLoad()
         
          searchTextField.delegate = self
          textFieldShape(searchTextField)
          addGlass_filterTextField(for: searchTextField)
          locationService()
      }
        
    
        //MARK: Presenting result view
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           // Dismissing KeyBoard
           textField.resignFirstResponder()
           presentVC()
           return true
       }
    
    //Function to present Destination VC
    func presentVC() {
        if let destinationVC = destinationVC {
            destinationVC.modalPresentationStyle = .pageSheet
            // Configuring presentation
            if let bottomSheet = destinationVC.presentationController as? UISheetPresentationController {
                bottomSheet.detents = [.medium(), .large()]
                //restricting from moving when scrolling
                bottomSheet.largestUndimmedDetentIdentifier = .medium
                bottomSheet.preferredCornerRadius = 40
                bottomSheet.prefersScrollingExpandsWhenScrolledToEdge = false
                bottomSheet.prefersGrabberVisible = true
            }
     present(destinationVC, animated: true)
    }
        
    }
    
//        @IBAction func searchButtonPressed(_ sender: UIButton) {
//            if let destinationVC = destinationVC {
//                destinationVC.modalPresentationStyle = .pageSheet
//                // Configuring presentation
//                if let bottomSheet = destinationVC.presentationController as? UISheetPresentationController {
//                    bottomSheet.detents = [.medium(), .large()]
//                    //restricting from moving when scrolling
//                    bottomSheet.largestUndimmedDetentIdentifier = .medium
//                    bottomSheet.preferredCornerRadius = 40
//                    bottomSheet.prefersScrollingExpandsWhenScrolledToEdge = false
//                    bottomSheet.prefersGrabberVisible = true
//                }
//         present(destinationVC, animated: true)
//        }
//            
//    }
        
    //MARK: Location configuration
        func locationService() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            
    }
}



//MARK: Customizing SearchBar
extension FilterViewController {
    func addGlass_filterTextField(for textField: UITextField) {
        // Creating magnifyingGlass
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.tintColor = UIColor.systemGray
        magnifyingGlassImageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        magnifyingGlassImageView.contentMode = .center
        textField.leftView = magnifyingGlassImageView
        textField.leftViewMode = .always

        // Filter Button
        let filterSymbol = UIImage(systemName: "slider.vertical.3")
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(filterSymbol, for: .normal)
        filterButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        filterButton.tintColor = UIColor.systemGray
        textField.rightView = filterButton
        textField.rightViewMode = .always
    }
    
    
    func textFieldShape(_ textField: UITextField) {
        textField.layer.cornerRadius = 15.0
        textField.layer.masksToBounds = true
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 2
        textField.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        textField.layer.shadowOpacity = 0.3
       // textField.backgroundColor = UIColor.white
    }
}
