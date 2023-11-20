//
//  CondoViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-18.
//

import UIKit

class CondoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
    }
}


//MARK: - TABLEVIEW
extension CondoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let selectedRentData = property[indexPath.row]
           if let destinationVC = storyboard?.instantiateViewController(withIdentifier: "DetailPageID") as? DetailPageViewController {
               destinationVC.selectedItem = selectedRentData
               navigationController?.pushViewController(destinationVC, animated: true)
           } else {
               print("Failed destinationVC.")
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


extension CondoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        cell.indexPath = indexPath
        let condos = property[indexPath.row]
        cell.propertyName.text = condos.name
        cell.propertyImage.image = condos.image
        cell.propertyAmount.text = condos.amount
        cell.propertyAddress.text = condos.address
        cell.rentStatus.text = condos.status
        cell.propertySize.text = condos.size
        //MARK: CUSTOMIZING CELL
        cell.cellStackView.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 1
        
        return cell
    }
}
