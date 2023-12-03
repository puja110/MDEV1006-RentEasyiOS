//
//  PostViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-11-10.
//

import UIKit
import MapKit

struct AddressItem: Identifiable {
    var id = UUID()
    let longitude: String
    let latitude: String
}

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var propetyNameField: UITextField!
    @IBOutlet weak var propertySizeField: UITextField!
    @IBOutlet weak var propertyAmountField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var propertyAddressField: UITextField!
    
    @IBOutlet weak var suggestionButton: UIButton!
    
    @IBAction func onTouchSuggestion(_ sender: UIButton) {
            propertyAddressField.text = suggestionButton.titleLabel?.text
            suggestionButton.isHidden = true
        
    }
    @IBAction func onSearchAddress(_ sender: UITextField) {
        if(sender.text! == ""){
            suggestionButton.isHidden = true
            return
            
        }
        searchAddress(sender.text!)
        suggestionButton.isHidden = false
    }
    
    let imagePickerController = UIImagePickerController()
    var selectedImageData: Data?
    private lazy var localSearchCompleter: MKLocalSearchCompleter = {
            let completer = MKLocalSearchCompleter()
            completer.delegate = self
            return completer
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionButton.setTitle("Search Suggestion Here", for: .normal)
        suggestionButton.isHidden = true
    }
    
    func searchAddress(_ searchableText: String) {
        guard searchableText.isEmpty == false else { return }
        localSearchCompleter.queryFragment = searchableText
    }
    
    func uploadNewPicture() {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self

        let action = UIAlertController(title: "Upload Image", message: nil, preferredStyle: .actionSheet)
        
        let cameraOpt = UIAlertAction(title: "Camera", style: .default) { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true)
            } else {
                print("Enable camera access!")
            }
        }
        let galleryOpt = UIAlertAction(title: "Gallery", style: .default) { _ in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        action.addAction(cameraOpt)
        action.addAction(galleryOpt)
        action.addAction(cancelButton)
        present(action, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        selectedImageData = image.jpegData(compressionQuality: 0.8)
        dismiss(animated: true)
    }
    
    func getImageDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    @IBAction func uploadButtonPressed(_ sender: UIButton) {
        uploadNewPicture()
    }
    
    
    @IBAction func sumbitButtonPressed(_ sender: UIButton) {
        guard let name = propetyNameField.text,
              let address = propertyAddressField.text,
              let size = propertySizeField.text,
              let amount = propertyAmountField.text
        else
        {return}
        
        Task {
            let places = await getPlace(from: address)
            DataModelManager.shared.uploadRentDataEntity(name: name, address: address, longitude: places.coordinate.longitude, latitude: places.coordinate.latitude, amount: amount, size: size, newImage: selectedImageData)
        }
        
        
        propetyNameField.text = ""
        propertyAddressField.text = ""
        propertyAmountField.text = ""
        propertySizeField.text = ""
    }
}


extension PostViewController: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        Task { @MainActor in
            let topResult = completer.results[0]
            suggestionButton.setTitle(topResult.title + ", " + topResult.subtitle, for: .normal)
        }
    }
    
    func completer(_ completer: MKLocalSearchCompleter, didFailWithError error: Error) {
        print(error)
    }
    
    func getPlace(from address: String) async -> MKPlacemark  {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = address
        
        do {
            let response = try await MKLocalSearch(request: request).start()
            return response.mapItems.first!.placemark
        } catch {
            // Handle errors appropriately
            fatalError("Error in MKLocalSearch: \(error)")
        }
    }
}

