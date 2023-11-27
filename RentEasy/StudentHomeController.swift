//
//  StudentHomeController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-21.
//

import UIKit

class StudentHomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Student Home"
        navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
}


extension StudentHomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        cell.indexPath = indexPath
        let house = property[indexPath.row]
        cell.propertyName.text = house.name
        cell.propertyImage.image = house.image
        cell.propertyAmount.text = house.amount
        cell.propertyAddress.text = house.address
        cell.rentStatus.text = house.status
        cell.propertySize.text = house.size
        //MARK: CUSTOMIZING CELL
        cell.cellStackView.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 1
        
        return cell
    }
}

extension StudentHomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedRentData = property[indexPath.row]
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

