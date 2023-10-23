//
//  DetailPageViewController.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-26.
//

import UIKit

class DetailPageViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images: [String] = ["houseOne", "houseTwo", "houseThree" ]
    
    var selectedItem: RentData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let customBackButton = UIBarButtonItem()
            customBackButton.title = "Back" 
            navigationItem.backBarButtonItem = customBackButton
    }
    

    //scrolling disabled, interaction disabled and also hidden.. collectionView
    
    
    
}


extension DetailPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? DetailCollectionViewCell
        
        cell?.detailImages.image = UIImage(named: images[indexPath.row] )
        
        return cell!
    }
}
