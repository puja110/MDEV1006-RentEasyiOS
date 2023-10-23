//
//  HomePageViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-13.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryButton1: UIButton!
    @IBOutlet weak var categoryButton2: UIButton!
    @IBOutlet weak var categoryButton3: UIButton!
    @IBOutlet weak var categoryButton4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryButton1.layer.cornerRadius = 15
        categoryButton2.layer.cornerRadius = 15
        categoryButton3.layer.cornerRadius = 15
        categoryButton4.layer.cornerRadius = 15
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //cell
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    

}

extension HomePageViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        
        let houses = property[indexPath.row]
        
        cell.propertyName.text = houses.name
      //  cell.propertyImage.image = houses.image
        cell.propertyAmount.text = houses.amount
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status
        cell.propertySize.text = houses.size
        
        return cell
    }
    
}

//interactions
extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
