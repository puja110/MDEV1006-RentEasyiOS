//
//  PostViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-10.
//

import UIKit

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var propetyNameField: UITextField!
    @IBOutlet weak var propertySizeField: UITextField!
    @IBOutlet weak var propertyAmountField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var propertyAddressField: UITextField!
    
    let imagePickerController = UIImagePickerController()
    var selectedImageData: Data?
    
    
    override func viewDidLoad() {super.viewDidLoad()}
    
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
        
        DataModelManager.shared.uploadRentDataEntity(name: name, address: address, amount: amount, size: size, newImage: selectedImageData)
        
        propetyNameField.text = ""
        propertyAddressField.text = ""
        propertyAmountField.text = ""
        propertySizeField.text = ""
    }
}
