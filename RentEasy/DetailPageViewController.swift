//
//  DetailPageViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-26.
//

import UIKit

class DetailPageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var rentData: RentData?
    //Initializing control to DetailPage with segue
    var selectedItem: RentData? {
          didSet {
             rentData = selectedItem
              tableView?.reloadData()
          }
      }
    
    //Displayed Images
    let images: [String] = ["houseOne", "houseTwo", "houseThree" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if tableView != nil {
              print("connected")
          } else {
              print("tableView is not connected.")
          }
        
        //Custom Cell
        tableView.register(UINib(nibName: "TestimonialTableViewCell", bundle: nil), forCellReuseIdentifier: "TestimonialCell")

    }
}


extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? DetailCollectionViewCell
        
        cell?.detailImages.image = UIImage(named: images[indexPath.row] )
        cell?.detailImages.layer.cornerRadius = 5
        return cell!
    }
}

//MARK: Table View
extension DetailPageViewController: UITableViewDelegate {
    
}

extension DetailPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let testimonies = rentData?.testimonies {
               return testimonies.count
           } else {
               return 0
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //cast RentCell in cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestimonialCell", for: indexPath)as! TestimonialTableViewCell
        
        let comments = rentData?.testimonies[indexPath.row]
        
        cell.reviewersName.text = comments?.name
        cell.reviewersComment.text = comments?.comment
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
