//
//  FavoriteTableViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-02.
//

import UIKit

class FavoriteTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

   //MARK: TableView Delegate
extension FavoriteTableViewController: UITableViewDelegate {
    
}



   //MARK: DataSource
extension FavoriteTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesManager.favorites.favoritedItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Registering Custom Cell
        let cellNib = UINib(nibName: "RentCell", bundle: nil)
           tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
        

        //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        
        let houses = FavoritesManager.favorites.favoritedItems[indexPath.row]
        
        cell.propertyName.text = houses.name
       // cell.propertyImage.image = houses.image
        cell.propertyAmount.text = houses.amount
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status
        cell.propertySize.text = houses.size
       
        return cell
        
    }
   
   
    
}
