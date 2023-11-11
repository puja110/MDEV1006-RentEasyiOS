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
   
    var searchBarAppearance = SearchBarAppearance()
    
    let locationManager = CLLocationManager()
    
    //Instatiating the bottomSheet to popUp
      lazy var destinationVC: FilteredResultViewController? = {
          return UIStoryboard(name: "Main", bundle: nil)
          .instantiateViewController(withIdentifier: "FilteredResult") as?FilteredResultViewController}()
      
      override func viewDidLoad() {
          super.viewDidLoad()
         
          searchTextField.delegate = self
          searchBarAppearance.glassAndFilterTextField(textField: searchTextField)
          
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
    
    
    //MARK: Location configuration
        func locationService() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            
    }
}
