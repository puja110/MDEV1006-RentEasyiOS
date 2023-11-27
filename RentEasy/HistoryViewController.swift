//
//  HistoryViewController.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-11-04.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var availableButton: UIButton!
    @IBOutlet weak var bookedButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var allHistoryData = allHistory
    var availableHistoryData = soldHistory
    var bookedHistoryData = holdHistory
    var currentDataSource: [HistoryData] = allHistory
    var searchBarAppearance = SearchBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button Appearance
        changeButtonAppearance(myButton: allButton)
        changeButtonAppearance(myButton: availableButton)
        changeButtonAppearance(myButton: bookedButton)
        tableView.reloadData()
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
    }
    
    @IBAction func allButtonPressed(_ sender: UIButton) {
        currentDataSource = allHistoryData
        historyLabel.text = "All History"
        sender.backgroundColor = UIColor.red
        tableView.reloadData()
    }
    
    
    @IBAction func availableButtonPressed(_ sender: UIButton) {
        currentDataSource = bookedHistoryData
        historyLabel.text = "Available History"
        sender.backgroundColor = UIColor.red
        tableView.reloadData()
    }
    
    @IBAction func bookedButtonPressed(_ sender: UIButton) {
        currentDataSource = availableHistoryData
        historyLabel.text = "Booked History"
        sender.backgroundColor = UIColor.red
        tableView.reloadData()
    }
}


extension HistoryViewController: UITableViewDelegate { }

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryTableViewCell
        let houses = currentDataSource[indexPath.row]
        cell.houseName.text = houses.homeName
        cell.houseAddress.text = houses.homeAddress
        cell.houseSize.text = houses.homeSize
        cell.houseAmount.text = houses.homeAmount
        cell.houseStatus.text = houses.homeStatus
        
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

//MARK: - Button Appearance
extension HistoryViewController {
    
    func changeButtonAppearance(myButton: UIButton) {
        myButton.backgroundColor = .white
        myButton.layer.borderWidth = 2.0
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.cornerRadius = 10.0
    }
    
}
