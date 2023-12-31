//
//  RentData.swift
//  RentEasy
//
//  Created by CodeSOMPs on 2023-10-18.
//

import Foundation
import UIKit
import CoreData

struct RentData {
    let id: UUID
    let name: String
    let amount: String
    let address: String
    let image: UIImage
    let status: String
    let size: String
    var favorite = false
    let longitude: Double
    let latitude: Double
    var testimonies: [Testimony]

    struct Testimony {
        let name: String
        let comment: String
    }
    init(id: UUID = UUID(), name: String, amount: String, address: String, image: UIImage, status: String, size: String, longitude: Double, latitude: Double , testimonies: [Testimony]) {
        self.id = id
        self.name = name
        self.amount = amount
        self.address = address
        self.image = image
        self.status = status
        self.size = size
        self.longitude = longitude
        self.latitude = latitude
        self.testimonies = testimonies
    }
}


    var property: [RentData] = [
        RentData(name: "Two Bedroom Flat", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Two Bedroom", longitude: -79.6903, latitude: 44.3895,
                 testimonies: [
            RentData.Testimony(name: "Adam Adam", comment: "This home is a true gem! It's a beautiful and inviting space that's perfect for creating lasting memories. You won't want to miss the chance to make this your new home"),
            RentData.Testimony(name: "John Legend", comment: "A true haven for those seeking a place to call home. This rental is not just beautiful; it's a slice of paradise that you can enjoy every day. Don't let this opportunity slip away!"),
            RentData.Testimony(name: "Emily Eva", comment: "Simply stunning! This home is an embodiment of beauty and comfort, offering a wonderful place to rent and create your own slice of paradise. Don't miss out on this delightful opportunity"),
            RentData.Testimony(name: "Taylor Swift", comment: "An exquisite home available for rent! This place is a perfect blend of elegance and warmth, and it's ready to become your new sanctuary. Grab this chance to experience the beauty of this lovely home."),
            RentData.Testimony(name: "Beyonce knowless", comment: "This home is a real treasure! It's not just a place to rent; it's a space where you can truly make memories and enjoy the beauty of everyday life. Don't hesitate to seize this fantastic opportunity") ]),
        
    
        RentData(name: "DownTown Mini House", amount: "2000", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseTwo"), status: "Available", size: "Three Bedroom", longitude: -79.6687, latitude: 44.4012, testimonies: [RentData.Testimony(name: "Olasile Oladipupo", comment: "Wow, what a find! This home is an absolute beauty, offering a perfect blend of style and comfort. It's an excellent place to rent and create a warm, inviting atmosphere for yourself.")]),
    
        RentData( name: "Three Bedroom Condo", amount: "1200", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThree"), status: "Available", size: "One Bedroom", longitude: -79.6946, latitude: 44.3918, testimonies: [RentData.Testimony(name: "Puja Shresta", comment: "This home is a real treasure! It's not just a place to rent; it's a space where you can truly make memories and enjoy the beauty of everyday life. Don't hesitate to seize this fantastic opportunity")]),
    
        RentData(name: "Three bedroom Duplex", amount: "2000", address: "Orillia", image: UIImage(imageLiteralResourceName: "houseFour"), status: "Available", size: "Two Bedroom", longitude: -79.6940, latitude: 44.3807, testimonies: [RentData.Testimony(name: "Pramod Regmi", comment: "A true haven for those seeking a place to call home. This rental is not just beautiful; it's a slice of paradise that you can enjoy every day. Don't let this opportunity slip away!")]),
    
        RentData(name: "Student Shared room", amount: "1300", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseFive"), status: "Available", size: "Four Bedroom", longitude: -79.6763, latitude: 44.3872, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Shared Home", amount: "1100", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Four bedroom Duplex", longitude: -79.6931, latitude: 44.4085, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Single basement room", amount: "3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeven"), status: "Available", size: "Two Bedroom", longitude: -79.7035, latitude: 44.3910, testimonies: [RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live"), RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live"),RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Two rooms shared", amount: "3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEight"), status: "Available", size: "Two Bedroom", longitude: -79.6968, latitude: 44.3754, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Three bedroom House", amount: "900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNine"), status: "Available", size: "Two Bedroom", longitude: -79.6903, latitude: 44.3895, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Rooftop view House", amount: "800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTen"), status: "Available", size: "Two Bedroom", longitude: -79.6752, latitude: 44.4041, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Shared condo House", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEleven"), status: "Available", size: "Two Bedroom", longitude: -79.6827, latitude: 44.3949, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Four rooms Home", amount: "700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwelve"), status: "Available", size: "Two Bedroom", longitude: -79.6921, latitude: 44.3712, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Five rooms duplex", amount: "650", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThirteen"), status: "Available", size: "Two Bedroom", longitude: -79.7089, latitude: 44.3983, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "Four rooms apartment", amount: "800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFourteen"), status: "Available", size: "Two Bedroom", longitude: -79.7010, latitude: 44.3895, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData( name: "House Fifteen", amount: "700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFifteen"), status: "Available", size: "Two Bedroom", longitude: -79.6705, latitude: 44.4071, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData( name: "House Sixteen", amount: "900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSixteen"), status: "Available", size: "Two Bedroom", longitude: -79.6819, latitude: 44.3827, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Seventeen", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeventeen"), status: "Available", size: "Two Bedroom", longitude: -79.7002, latitude: 44.3996, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Eighten", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEighteen"), status: "Available", size: "Two Bedroom", longitude: -79.6804, latitude: 44.3739, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Nineteen", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNineteen"), status: "Available", size: "Two Bedroom", longitude: -79.6858, latitude: 44.3890, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Twenty", amount: "1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwenty"), status: "Available", size: "Two Bedroom", longitude: -79.6873, latitude: 44.4037, testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")])
        
]

//MARK: - CONVERTING RENTADA TO RENTDATAENTITY
extension RentData {
    static func rentdataSaveToCoreData(context: NSManagedObjectContext, rentDataObject: [RentData]) {
        for property in rentDataObject {
            if property.convertToCoreData(context: context) != nil {
                do {
                    try context.save()
                    print("saved")
                } catch {
                    print("Error saving")
                }
            }
        }
    }

    func convertToCoreData(context: NSManagedObjectContext) -> RentDataEntity? {
        let rentEntity = RentDataEntity(context: context)
        rentEntity.name = name
        rentEntity.amount = amount
        rentEntity.address = address
        rentEntity.image = image.pngData()
        rentEntity.status = status
        rentEntity.size = size
        rentEntity.isFavorite = favorite
        rentEntity.latitude = latitude
        rentEntity.longitude = longitude
        return rentEntity
        
    }
}

