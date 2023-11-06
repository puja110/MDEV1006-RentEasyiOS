//
//  FilteredResultViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-03.
//

import UIKit

class FilteredResultViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //Registering custom cell
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
}

extension FilteredResultViewController: UITableViewDelegate {
    
}

extension FilteredResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        
        let houses = property[indexPath.row]
    
        cell.propertyName.text = houses.name
       // cell.propertyImage.image = houses.image
        cell.propertyAmount.text = houses.amount
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status
        cell.propertySize.text = houses.size
        
        
        //Setting cornerRadius for tableView Cells.
        cell.cellStackView.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 1
                
        return cell
    }
    
    
    
    
}
