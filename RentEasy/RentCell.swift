//
//  RentCell.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-17.
//

import UIKit

//Implementing protocol to serve as listener in HomePageViewController
protocol RentCellDelegate {
    //Delegate function
    func didTapFavoriteButton(_ cell: RentCell)
}

class RentCell: UITableViewCell {
    
    //Creating delegate property
    var delegate: RentCellDelegate?
    
    
    
    @IBOutlet weak var rentCustomCell: UIView!
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var rentStatus: UILabel!
    @IBOutlet weak var propertyAddress: UILabel!
    @IBOutlet weak var propertySize: UILabel!
    @IBOutlet weak var propertyAmount: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var cellStackView: UIStackView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        propertyImage.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        //setting delegate
        delegate?.didTapFavoriteButton(self)
        
        //Changing favorite button
        if sender.currentImage == UIImage(systemName: "heart.fill") {
            sender.setImage(UIImage(systemName: "heart"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
    }
    
}
