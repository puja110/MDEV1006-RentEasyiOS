//
//  RentCell.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-17.
//

import UIKit

class RentCell: UITableViewCell {

    @IBOutlet weak var rentCustomCell: UIView!
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var rentStatus: UILabel!
    @IBOutlet weak var propertyAddress: UILabel!
    @IBOutlet weak var propertySize: UILabel!
    @IBOutlet weak var propertyAmount: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        propertyImage.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
