//
//  PostViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-11-10.
//

import UIKit

class PostViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var propetyNameField: UITextField!
    @IBOutlet weak var propertySizeField: UITextField!
    @IBOutlet weak var propertyAmountField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var propertyAddressField: UITextField!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    var selectedImageData: Data?
    var imageViews: [UIImageView] = []
    var myImageIndex = 0
    
    override func viewDidLoad(){
        super.viewDidLoad()
        imageViews = [imageOne, imageTwo, imageThree]
        imageOne.layer.cornerRadius = 15
        imageTwo.layer.cornerRadius = 15
        imageThree.layer.cornerRadius = 15
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
        guard myImageIndex < imageViews.count else {return}
        imageViews[myImageIndex].image = image
        myImageIndex += 1
        dismiss(animated: true)
    }
    
    func resetImages() {
        for images in imageViews {
            images.image = nil
        }
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
              let amount = propertyAmountField.text,
              let description = descriptionField.text
        else
        {return}
        
        DataModelManager.shared.uploadRentDataEntity(name: name, address: address, amount: amount, size: size, newImage: selectedImageData, description: description)
        propetyNameField.text = ""
        propertyAddressField.text = ""
        propertyAmountField.text = ""
        propertySizeField.text = ""
        descriptionField.text = ""
        resetImages()
        successfulAlert()
    }
    
    func successfulAlert() {
        let alertController = UIAlertController(title: "Upload Successful", message: nil, preferredStyle: .alert)
        let oK = UIAlertAction(title: "OK", style: .destructive)
        alertController.addAction(oK)
        present(alertController, animated: true, completion: nil)
    }
}
