//
//  DetailPageViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-10-26.
//

import UIKit

class DetailPageViewController: UIViewController, UIViewControllerTransitioningDelegate {
      
    @IBOutlet weak var favButtonImage: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionViewMain: UICollectionView!
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var houseAddress: UIButton!
    @IBOutlet weak var houseSize: UIButton!
    @IBOutlet weak var firstStackView: UIStackView!
    @IBOutlet weak var secondStackView: UIStackView!
    @IBOutlet weak var thirdStackView: UIStackView!
    @IBOutlet weak var fourthStackView: UIStackView!
    @IBOutlet weak var fifthStackView: UIStackView!
    
    var buttonTextField = Button_FieldStyle()
    var rentDataEntityProperty: RentDataEntity?
    var selectedItem: RentDataEntity? {
          didSet {
             rentDataEntityProperty = selectedItem
              tableView?.reloadData()
          }
      }
    
    var favorite: Bool = false {
        didSet {
            favoriteButtonState()
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
     navigationController?.setNavigationBarHidden(false, animated: true)

        buttonTextField.viewLine(firstStackView)
        buttonTextField.viewLine(secondStackView)
        buttonTextField.viewLine(thirdStackView)
        buttonTextField.viewLine(fourthStackView)
        
        houseName.text = rentDataEntityProperty?.name
        houseAddress.setTitle(rentDataEntityProperty?.address, for: .normal)
        houseSize.setTitle(rentDataEntityProperty?.size, for: .normal)
        favoriteButtonState()

        tableView.register(UINib(nibName: "TestimonialTableViewCell", bundle: nil), forCellReuseIdentifier: "TestimonialCell")

        collectionViewMain.register(DetailCollectionCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionViewMain.delegate = self
        collectionViewMain.dataSource = self
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil)
        if let filterViewController = destinationVC.instantiateViewController(withIdentifier: "FilterView") as? FilterViewController {
            filterViewController.selectedProperty = selectedItem
            filterViewController.view.backgroundColor = UIColor.systemGray5
            filterViewController.searchTextField.isHidden = true
            filterViewController.mapToSafeArea.constant = 10
            if filterViewController.parent == nil {
                let navigationController = UINavigationController(rootViewController: filterViewController)
                filterViewController.title = "Property Address"
                filterViewController.sheetPresentationController?.preferredCornerRadius = 100
                let button = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(doneButton))
                filterViewController.navigationItem.rightBarButtonItem = button
                navigationController.modalPresentationStyle = .popover
                self.present(navigationController, animated: true)
            }
        }
    }
    
    @objc func doneButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func favoriteButtonState() {
        guard let image = UIImage(systemName: favorite ? "heart.fill" : "heart") else {return}
        favButtonImage?.setImage(image, for: .normal)
    }
    
    @IBAction func shareButtonPressed(_ sender: UIButton) {
        guard let propertyToShare = rentDataEntityProperty else { return }
        let name = propertyToShare.name
        let address = propertyToShare.address
        let shareMessage = "Check out this beautiful \(name ?? "nil") in \(address ?? "nil")"
        let activity = UIActivityViewController(activityItems: [shareMessage, propertyToShare.image as Any], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
    }
}

extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewMain.dequeueReusableCell(withReuseIdentifier: "ImageCells", for: indexPath) as! DetailCollectionCell
        if let rentDataEntity = rentDataEntityProperty,
           let imageData = rentDataEntity.image {
            cell.imageForCell.image = UIImage(data: imageData)
            cell.imageForCell.contentMode = .scaleAspectFill
            cell.imageForCell.clipsToBounds = true
        } else {
            cell.imageForCell.image = nil
        }
        return cell
    }
}

extension DetailPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testimonies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestimonialCell", for: indexPath)as! TestimonialTableViewCell
        let comments = testimonies[indexPath.row]
        cell.reviewersName.text = comments.name
        cell.reviewersComment.text = comments.comment
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
