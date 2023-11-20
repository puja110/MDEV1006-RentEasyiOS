//
//  FilterViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-03.
//

import UIKit
import MapKit
import CoreLocation

class FilterViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
 
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapToSafeArea: NSLayoutConstraint!
    
    var searchBarAppearance = SearchBarAppearance()
    let locationManager = CLLocationManager()
    var searchedDataResult: [RentData] = []
    var destinationVC: FilteredResultViewController?

    var detailData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationVC = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "FilteredResult") as? FilteredResultViewController
        
        navigationItem.title = "Search"
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        searchTextField.delegate = self
        searchBarAppearance.glassAndFilterTextField(textField: searchTextField)
        locationService()
    }

    
    //MARK: - Location configuration
    func locationService() {
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            presentLocation(location)
        }
    }
    
    func presentLocation(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
    //MARK: - SEARCH IMPLEMENTATION
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchedData = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        searchedDataResult = filteredResults(for: searchedData)
        destinationVC?.filteredRentData = searchedDataResult
        return true
    }
    
    func reloadTableView() {
        destinationVC?.tableView.reloadData()
    }
    
    func filteredResults(for searchedData: String) -> [RentData] {
        let resultData = property.filter { result in
            return result.name.localizedCaseInsensitiveContains(searchedData)
        }
        print("Count: \(resultData.count)")
        return resultData
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           presentVC()
           return true
       }
    
    //MARK: - BOTTOM SHEET
    func presentVC() {
        if let destinationVC = destinationVC {
            let searchedData = searchTextField.text
            print("Searched Data \(searchedData ?? "")")
            let results = searchedDataResult
            print("Results Count \(results.count)")
            destinationVC.filteredRentData = results
            destinationVC.modalPresentationStyle = .automatic

            if let bottomSheet = destinationVC.presentationController as? UISheetPresentationController {
                bottomSheet.detents = [.medium(), .large()]
                bottomSheet.largestUndimmedDetentIdentifier = .medium
                bottomSheet.preferredCornerRadius = 40
                bottomSheet.prefersScrollingExpandsWhenScrolledToEdge = false
                bottomSheet.prefersGrabberVisible = true
            }
            present(destinationVC, animated: true)
        }
        
    }
    

}
