//
//  DetailPageViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-10-26.
//

import UIKit

class DetailPageViewController: UIViewController, UIViewControllerTransitioningDelegate {
        
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
    var rentData: RentData?
    var selectedItem: RentData? {
          didSet {
             rentData = selectedItem
              tableView?.reloadData()
          }
      }
   
    override func viewDidLoad() {
        super.viewDidLoad()
     navigationController?.setNavigationBarHidden(false, animated: true)

        buttonTextField.viewLine(firstStackView)
        buttonTextField.viewLine(secondStackView)
        buttonTextField.viewLine(thirdStackView)
        buttonTextField.viewLine(fourthStackView)
        buttonTextField.viewLine(fifthStackView)
        
        houseName.text = rentData?.name
        houseAddress.setTitle(rentData?.address, for: .normal)
        houseSize.setTitle(rentData?.size, for: .normal)
        
        //Custom Cell
        tableView.register(UINib(nibName: "TestimonialTableViewCell", bundle: nil), forCellReuseIdentifier: "TestimonialCell")

        collectionViewMain.register(DetailCollectionCell.self, forCellWithReuseIdentifier: "ImageCell")
        collectionViewMain.delegate = self
        collectionViewMain.dataSource = self

    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil)
        if let filterViewController = destinationVC.instantiateViewController(withIdentifier: "FilterView") as? FilterViewController {
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
            } else {
               // DO NOTHING
            }
        }
    }
    
    @objc func doneButton() {
        dismiss(animated: true, completion: nil)
    }
}


extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewMain.dequeueReusableCell(withReuseIdentifier: "ImageCells", for: indexPath) as! DetailCollectionCell
        if let rentData = rentData {
            cell.imageForCell.image = rentData.image
            cell.imageForCell.layer.cornerRadius = 5
           }
        return cell
    }
}

extension DetailPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let testimonies = rentData?.testimonies {
               return testimonies.count
           } else {
               return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestimonialCell", for: indexPath)as! TestimonialTableViewCell
        let comments = rentData?.testimonies[indexPath.row]
        cell.reviewersName.text = comments?.name
        cell.reviewersComment.text = comments?.comment
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}


