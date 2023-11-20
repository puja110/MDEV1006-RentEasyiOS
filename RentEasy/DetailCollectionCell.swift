//
//  DetailCollectionCell.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-19.
//

import UIKit

class DetailCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imageForCell: UIImageView!
    
    override func awakeFromNib() {
          super.awakeFromNib()
        imageForCell.contentMode = .scaleAspectFit
      }
}
