//
//  HistoryViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-04.
//

import UIKit

class HistoryViewController: UIViewController {

    
    
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var holdButton: UIButton!
    @IBOutlet weak var soldButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var allHistoryData = allHistory
    var soldHistoryData = soldHistory
    var holdHistoryData = holdHistory
    var currentDataSource: [HistoryData] = allHistory
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button Appearance
        changeButtonAppearance(myButton: allButton)
        changeButtonAppearance(myButton: holdButton)
        changeButtonAppearance(myButton: soldButton)
        
        //SearchBarAppearance
        searchFieldApperance(searchBarTextField)
        glassFilterTextField(textField: searchBarTextField)
       
        
        tableView.reloadData()
        
        //Custom Cell
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
    }
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        currentDataSource = allHistoryData
        historyLabel.text = "All History"
        tableView.reloadData()
    }
    
    
    @IBAction func holdButtonPressed(_ sender: UIButton) {
        currentDataSource = holdHistoryData
        historyLabel.text = "Hold History"
        tableView.reloadData()
    }
    
    @IBAction func soldButtonPressed(_ sender: UIButton) {
        currentDataSource = soldHistoryData
        historyLabel.text = "Sold History"
        tableView.reloadData()
    }
    
}


extension HistoryViewController: UITableViewDelegate {
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTableViewCell

        let houses = currentDataSource[indexPath.row]
        
        cell.houseName.text = houses.homeName
        cell.houseAddress.text = houses.homeAddress
        cell.houseSize.text = houses.homeSize
        cell.houseAmount.text = houses.homeAmount
        cell.houseStatus.text = houses.homeStatus
        
        //Setting cornerRadius for tableView Cells.
        cell.cellStackView.layer.cornerRadius = 5
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 2
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 1
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   
        return 170
    }
    
}

//MARK: Button Appearance
extension HistoryViewController {
    
    func changeButtonAppearance(myButton: UIButton) {
        
        myButton.backgroundColor = .white
       // myButton.setTitleColor(.black, for: .normal)
        myButton.layer.borderWidth = 2.0
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.cornerRadius = 10.0
    }
    
}


//MARK: Customizing SearchBar
extension HistoryViewController {
    func glassFilterTextField(textField: UITextField) {
        // Creating magnifyingGlass
        let magnifyingGlassSymbol = UIImage(systemName: "magnifyingglass")
        let magnifyingGlassImageView = UIImageView(image: magnifyingGlassSymbol)
        magnifyingGlassImageView.backgroundColor = UIColor(named: "systemGray")
        magnifyingGlassImageView.frame = CGRect(x: 100, y: 0, width: 40, height: 40)
        magnifyingGlassImageView.tintColor = UIColor.systemGray
        magnifyingGlassImageView.contentMode = .center
        textField.leftView = magnifyingGlassImageView
        textField.leftViewMode = .always

        // Filter Button
        let filterSymbol = UIImage(systemName: "slider.vertical.3")
        let filterButton = UIButton(type: .custom)
        filterButton.setImage(filterSymbol, for: .normal)
        filterButton.frame = CGRect(x: 100, y: 0, width: 30, height: 30)
        filterButton.tintColor = UIColor.systemGray
        textField.rightView = filterButton
        textField.rightViewMode = .always
    }
    
    
    func searchFieldApperance(_ textField: UITextField) {
        textField.layer.cornerRadius = 15.0
        textField.layer.masksToBounds = true
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowRadius = 2
        textField.layer.shadowOffset = CGSize(width: 2, height: 2)
        textField.layer.shadowOpacity = 0.9
    }
}
