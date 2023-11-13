//
//  HomePageViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-13.
//

import UIKit

class HomePageViewController: UIViewController, UITextFieldDelegate {
 
//MARK: - IBOUTLETS
    
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
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
    
    var dataModelManager = DataModelManager()
    var searchBarAppearance = SearchBarAppearance()
    //Height constant for Category view
    let categoryViewHeight: CGFloat = 120
    
 
    //MARK: - VIEWDID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataModelManager.saveContext()
        
        //MARK: CUSTOMIZATION
        searchTextField.delegate = self
        searchBarAppearance.glassAndFilterTextField(textField: searchTextField)

        searchTextField.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapSearchBar(_:)))
        searchTextField.addGestureRecognizer(tapGesture)

        //customizing tableVIew
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        //Customizing category
        categoryButton1.layer.cornerRadius = 15
        categoryButton2.layer.cornerRadius = 15
        categoryButton3.layer.cornerRadius = 15
        categoryButton4.layer.cornerRadius = 15
        
        //Implementing delegates
        tableView.delegate = self
        tableView.dataSource = self
        hScrollView.delegate = self
        
        //Custom Cell
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    
    //MARK: - Navigating to FilterViewController
    @objc func tapSearchBar(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "FavoriteView", sender: self)
    }
    
    //Setting Searchbar to edit.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }

//MARK: - Preparing Segue to Detail Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPage" {
                if let destinationVC = segue.destination as? DetailPageViewController {
                    if let selectedItem = sender as? RentData {
                        destinationVC.selectedItem = selectedItem
                    } else {
                        print("Not RentData object")
                    }
                } else {
                    print("DestinationVC ID can't be found.")
                }
            }
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    //MARK: - Hiding Category View
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            // Calculating when to hide hScrollView
            let hide: CGFloat = categoryViewHeight
            // Getting lowerstackview height
            let lowerStackHeight = tableView.contentOffset.y
            // Setting category view contraints
            if lowerStackHeight >= hide {
                hScrollView.isHidden = true
                navigationController?.setNavigationBarHidden(true, animated: false)
                categoryLabel.isHidden = true
                seeMoreButton.isHidden = true
                //lowerStack Constraining to view with
                lowerAndUpperStackConstraints.constant = 10
            } else {
               //  Displaying category
                hScrollView.isHidden = false
                //returning the lowerStack contraint to it's initial value
                categoryLabel.isHidden = false
                lowerAndUpperStackConstraints.constant = 165.67
                navigationController?.setNavigationBarHidden(false, animated: true)
                seeMoreButton.isHidden = false
            }
            //animation
            UIView.animate(withDuration: 0.3) {self.view.layoutIfNeeded()}
        }
    }
    
}

//MARK: - TableView dataSource
extension HomePageViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return property.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! RentCell
        //setting delegate as self for favoriting
        cell.delegate = self
        let houses = property[indexPath.row]
        cell.propertyName.text = houses.name
      //cell.propertyImage.image = houses.image
        cell.propertyAmount.text = houses.amount
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status
        cell.propertySize.text = houses.size
        DispatchQueue.main.async {
            cell.favoriteButton.isSelected = houses.isFavorite
           }
        
        //MARK: CUSTOMIZING CELL
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
     
        let selectedRentData = property[indexPath.row]
        performSegue(withIdentifier: "DetailPage", sender: selectedRentData)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Implementing delgate method from RentCell for favorite button
extension HomePageViewController: RentCellDelegate {

        func didTapFavoriteButton(_ cell: RentCell) {
            if let indexPath = tableView.indexPath(for: cell) {
                let rentData = property[indexPath.row]
                // Converting RentData to RentDataEntity
                let rentDataEntity = rentData.convertToRentEntity(context: DataModelManager.shared.context)
                rentDataEntity.isFavorite.toggle()
                dataModelManager.saveContext()
                tableView.reloadData()
            }
    }
}
