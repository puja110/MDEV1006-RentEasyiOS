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
    @IBOutlet weak var cellStackView: UIStackView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var indexPath: IndexPath?
    var isFavorite: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()

        propertyImage.layer.cornerRadius = 5
        rentStatus.applyRoundBorderStyle()
        propertyImage.contentMode = .scaleAspectFill

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        indexPath = nil
        favoriteButton.isSelected = false
        updateFavoriteState()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let indexPath = indexPath else {return}
        isFavorite.toggle()
        updateFavoriteState()
        
        if isFavorite {
            let rentData = property[indexPath.row]
            let rentDataEntity = rentData.convertToRentEntity(context: DataModelManager.shared.context)
            rentDataEntity?.isFavorite = isFavorite
            DataModelManager.shared.saveContext()
        } else {
            if let rentDataEntity = property[indexPath.row].convertToRentEntity(context: DataModelManager.shared.context) {
                DataModelManager.shared.deleteItem(rentDataEntity)
            }
        }
    }
    
     func updateFavoriteState() {
        let imageName = isFavorite ? "heart.fill" : "heart"
               let image = UIImage(systemName: imageName)
               favoriteButton.setImage(image, for: .normal)
               favoriteButton.setImage(image, for: .selected)
               favoriteButton.tintColor = isFavorite ? .red : .gray
    }
}

//MARK: - Status label.
extension UILabel {
    func applyRoundBorderStyle() {
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.textAlignment = .center
        self.layer.borderColor = UIColor.green.cgColor
    }
}

