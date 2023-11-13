//
//  FavoriteTableViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-02.
//

import UIKit
import CoreData

class FavoriteTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataModelManager = DataModelManager()
    var items: [RentDataEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LOADING ITEMS
        items = DataModelManager.shared.loadItems()
        print("Items:- \(items.count)")
        self.tableView.reloadData()

        let cellNib = UINib(nibName: "RentCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
    }
}

   //MARK: -  TableView Delegate
extension FavoriteTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
    
    //DELETING
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: nil) { _, _, completion in
            let itemToDelete = self.items[indexPath.row]
            self.dataModelManager.deleteItem(itemToDelete)
            self.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completion(true)
        }
        delete.image = UIImage(systemName: "trash")
        delete.backgroundColor = UIColor.systemRed
        let deleteConfiguration = UISwipeActionsConfiguration(actions: [delete])
        return deleteConfiguration
    }
}



   //MARK: -  DataSource
extension FavoriteTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        let favoriteHouses = items[indexPath.row]
        cell.propertyName.text = favoriteHouses.name
      //cell.propertyImage.image = favoriteHouses.image
        cell.propertyAmount.text = favoriteHouses.amount
        cell.propertyAddress.text = favoriteHouses.address
        cell.rentStatus.text = favoriteHouses.status
        cell.propertySize.text = favoriteHouses.size
       
         return cell
    }
    
}
