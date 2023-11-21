//
//  HomePageViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-10-13.
//

import UIKit

class HomePageViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var categoryBackgroundStack3: UIStackView!
    @IBOutlet weak var categoryBackgroundStack1: UIStackView!
    @IBOutlet weak var categoryBackgroundStack2: UIStackView!
    @IBOutlet weak var categoryBackgroundStack: UIStackView!
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
    @IBOutlet weak var welcomeToRentEasy: UILabel!
    @IBOutlet weak var topSeeMore: UIButton!
    
    //MARK: - Declared Variables & Constants
    var dataModelManager = DataModelManager()
    var searchBarAppearance = SearchBarAppearance()
    var buttonTextField = Button_FieldStyle()
    let categoryViewHeight: CGFloat = 160
    
    
    //MARK: - CYCLE
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataModelManager.saveContext()
        //MARK: CUSTOMIZATION
        searchTextField.delegate = self
        searchBarAppearance.glassAndFilterTextField(textField: searchTextField)
        searchTextField.becomeFirstResponder()
        //customizing tableVIew
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        categoryButton1.topCornerRadius(radius: 10)
        categoryButton2.topCornerRadius(radius: 10)
        categoryButton3.topCornerRadius(radius: 10)
        categoryButton4.topCornerRadius(radius: 10)
        buttonTextField.categoryStackAppearance(categoryBackgroundStack)
        buttonTextField.categoryStackAppearance(categoryBackgroundStack2)
        buttonTextField.categoryStackAppearance(categoryBackgroundStack1)
        buttonTextField.categoryStackAppearance(categoryBackgroundStack3)
        
        //MARK: - Gestures
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapSearchBar(_:)))
        searchTextField.addGestureRecognizer(tapGesture)
        
        let categoryOneGesture = UITapGestureRecognizer(target: self, action: #selector(stackOneViewTapped))
        categoryBackgroundStack1.addGestureRecognizer(categoryOneGesture)
        
        let categoryTwoGesture = UITapGestureRecognizer(target: self, action: #selector(stackTwoViewTapped))
        categoryBackgroundStack2.addGestureRecognizer(categoryTwoGesture)
        
        tableView.delegate = self
        tableView.dataSource = self
        hScrollView.delegate = self
        
        //Custom Cell
        tableView.register(UINib(nibName: "RentCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
    
    
    //MARK: - Category Gestures
    @objc func stackOneViewTapped() {
        performSegue(withIdentifier: "CondoView", sender: self)
    }
    
    @objc func stackTwoViewTapped() {
        performSegue(withIdentifier: "FamilyHome", sender: self)
    }
    
    //MARK: - Navigating to FilterViewController
    @objc func tapSearchBar(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "FavoriteView", sender: self)
    }
    
    //Searchbar edit.
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    //MARK: - Navigation to Detail Page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailPage" {
            if let destinationVC = segue.destination as? DetailPageViewController {
                if let selectedItem = sender as? RentData {
                    destinationVC.selectedItem = selectedItem
                } else {
                    print("Not RentData object")
                }
            } else {
                print("DestinationVC not found.")
            }
        }
    }
    
    //MARK: - HOMEPAGE ANIMATION
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            let hide: CGFloat = categoryViewHeight
            // Getting lowerstackview height
            let lowerStackHeight = tableView.contentOffset.y
            if lowerStackHeight >= hide {
                hScrollView.isHidden = true
                welcomeToRentEasy.isHidden = true
                categoryLabel.isHidden = true
                seeMoreButton.isHidden = true
                topSeeMore.isHidden = true
                lowerAndUpperStackConstraints.constant = 10
            } else {
                hScrollView.isHidden = false
                welcomeToRentEasy.isHidden = false
                topSeeMore.isHidden = false
                categoryLabel.isHidden = false
                lowerAndUpperStackConstraints.constant = 180
                seeMoreButton.isHidden = false
            }
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
        cell.indexPath = indexPath
        let houses = property[indexPath.row]
        cell.propertyName.text = houses.name
        cell.propertyImage.image = houses.image
        cell.propertyAmount.text = houses.amount
        cell.propertyAddress.text = houses.address
        cell.rentStatus.text = houses.status
        cell.propertySize.text = houses.size
        cell.favoriteButton.isSelected = houses.isFavorite
        
        cell.isFavorite = houses.isFavorite
        cell.updateButtonImage()
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


//MARK: - ButtonExtension
extension UIButton {
    func topCornerRadius(radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let masking = CAShapeLayer()
        masking.path = path.cgPath
        layer.mask = masking
    }
}
