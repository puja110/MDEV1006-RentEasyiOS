//
//  ContemporaryController.swift
//  RentEasy
//
//  Created by CodeSomps on 2023-11-21.
//

import UIKit

class ContemporaryController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataModelManager = DataModelManager()
    var rentDataEntityProperty: [RentDataEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contemporary Houses"
        navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        rentDataEntityProperty = dataModelManager.loadAllItems()
    }
}

extension ContemporaryController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rentDataEntityProperty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        let houses = rentDataEntityProperty[indexPath.row]
        cell.houses = houses
        cell.indexPath = indexPath
        cell.propertyName.text = houses.name
        if let imageData = houses.image, let image = UIImage(data: imageData) {
            cell.propertyImage.image = image
        } else {
            cell.propertyImage.image = nil
        }
        cell.propertyAmount.text = "$\(houses.amount ?? "1000") /month"
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status ?? "Available"
        cell.propertySize.text = houses.size
        cell.favoriteButton.isSelected = houses.isFavorite
        cell.updateButtonImage(isFavorite: houses.isFavorite)
        cell.cellStackView.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 1
        return cell

    }
}

extension ContemporaryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedRentData = rentDataEntityProperty[indexPath.row]
           if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetailPageID") as? DetailPageViewController {
               destinationVC.selectedItem = selectedRentData
               navigationController?.pushViewController(destinationVC, animated: true)
           } else {
               print("Failed.")
           }
           tableView.deselectRow(at: indexPath, animated: true)
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

