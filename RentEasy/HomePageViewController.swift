//
//  HomePageViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-13.
//

import UIKit

class HomePageViewController: UIViewController, UITextFieldDelegate {
    

    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var lowerAndUpperStackConstraints: NSLayoutConstraint!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var hScrollView: UIScrollView!
    @IBOutlet weak var lowerStackView: UIStackView!
    @IBOutlet weak var innerStack: UIStackView!
    @IBOutlet weak var hScrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryButton1: UIButton!
    @IBOutlet weak var categoryButton2: UIButton!
    @IBOutlet weak var categoryButton3: UIButton!
    @IBOutlet weak var categoryButton4: UIButton!
    
    var searchBarAppearance = SearchBarAppearance()
    
    //Height constant for Category view
    let cetegoryViewHeight: CGFloat = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchTextField.delegate = self
        searchBarAppearance.glassAndFilterTextField(textField: searchTextField)

        searchTextField.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTextViewTap(_:)))
        searchTextField.addGestureRecognizer(tapGesture)

        
        //customizing tableVIew
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        
        //Customizing category
        categoryButton1.layer.cornerRadius = 15
        categoryButton2.layer.cornerRadius = 15
        categoryButton3.layer.cornerRadius = 15
        categoryButton4.layer.cornerRadius = 15
        
        //Implementing delegate for table view and horizontal ScrollView
        tableView.delegate = self
        tableView.dataSource = self
        hScrollView.delegate = self
        
        //Custom Cell
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    //MARK: - Filter Button on Search Bar Action
    @objc func handleTextViewTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "FavoriteView", sender: self)
    }

//MARK: - Preparing Segue to Detail Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPage" {
                if let destinationVC = segue.destination as? DetailPageViewController {
                    if let selectedItem = sender as? RentData {
                        destinationVC.selectedItem = selectedItem
                    } else {
                        print("Sender is not of type RentData")
                    }
                } else {
                    print("Destination view controller is not of type DetailPageViewController")
                }
            }
    }
    
    
    //MARK: - Hiding Category View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            // Calculating when to hide hScrollView
            let hide: CGFloat = cetegoryViewHeight
            
            // Getting lowerstackview height
            let lowerStackHeight = tableView.contentOffset.y
            // Setting category view contraints
            if lowerStackHeight >= hide {
                hScrollView.isHidden = true
                //lowerStack Constraining to the first stack view above with 10points
                lowerAndUpperStackConstraints.constant = 10
            } else {
               //  Displaying category
                hScrollView.isHidden = false
                //returning the lowerStack contraint to it's initial value
                lowerAndUpperStackConstraints.constant = 165.67
            }
            // Updating the constraint change with animation presentation
            UIView.animate(withDuration: 0.3) {self.view.layoutIfNeeded()}
        }
    }
    
    //Setting Searchbar to edit as false
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
}

//MARK: - TableView dataSource
extension HomePageViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        //setting delegate as self
        cell.delegate = self
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

//MARK: -  TableView Deletage
extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(indexPath.row)
        let selectedRentData = property[indexPath.row]
        performSegue(withIdentifier: "DetailPage", sender: selectedRentData)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: Implementing delgate method from RentCell for favorite button
extension HomePageViewController: RencCellDelegate {
   
    func didTapFavoriteButton(_ cell: RentCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            var item = property[indexPath.row]
            tableView.reloadData()
            item.isFavorite.toggle()
            
            print(item)
            
            if item.isFavorite {
                FavoritesManager.favorites.favoritedItems.append(item)
            } else {
//                if let index = favoritedItems.firstIndex(of: item) {
//                   favoritedItems.remove(at: index)
//              }
            }
        }
        
    }
}


//MARK: Sharing data accross the classes using Singleton
class FavoritesManager {
    
    static let favorites = FavoritesManager()

    var favoritedItems: [RentData] = []
}

