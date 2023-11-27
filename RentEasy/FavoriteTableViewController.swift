//
//  FavoriteTableViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-11-02.
//

import UIKit
import CoreData



class FavoriteTableViewController: UIViewController, DataModelManagerDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    var dataModelManager = DataModelManager()
    var items: [RentDataEntity] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
         
    
        
        items = DataModelManager.shared.loadFavouriteItems()
        print("Items: \(items.count)")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = DataModelManager.shared.loadFavouriteItems()
        DataModelManager.shared.delegate = self
        let cellNib = UINib(nibName: "RentCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
    }
    
    func didSaveItem() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: -  TableView Delegate
extension FavoriteTableViewController: UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
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
        
        if let imageData = favoriteHouses.image {
            if let image = UIImage(data: imageData) {
                cell.propertyImage.image = image
            }
        }       
       
        cell.propertyAmount.text = favoriteHouses.amount
        cell.propertyAddress.text = favoriteHouses.address
        cell.rentStatus.text = favoriteHouses.status
        cell.propertySize.text = favoriteHouses.size
        let image = UIImage(systemName: "heart.fill")
        cell.favoriteButton.setImage(image, for: .normal)
        
        return cell
    }
    
}

