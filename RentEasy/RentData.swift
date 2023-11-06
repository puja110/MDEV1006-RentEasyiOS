//
//  RentData.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-18.
//

import Foundation
import UIKit

struct RentData {
    let name: String
    let amount: String
    let address: String
    let image: UIImage
    let status: String
    let size: String
    var isFavorite = false
    var testimonies: [Testimony] 

       
    
    
    struct Testimony {
            let name: String
            let comment: String
        }
}


    let property: [RentData] = [
        RentData(name: "House One", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Two Bedroom", 
                 testimonies: [
            RentData.Testimony(name: "Manushi Khadka", comment: "This home is a true gem! It's a beautiful and inviting space that's perfect for creating lasting memories. You won't want to miss the chance to make this your new home"),
            RentData.Testimony(name: "Pramog Regmi", comment: "A true haven for those seeking a place to call home. This rental is not just beautiful; it's a slice of paradise that you can enjoy every day. Don't let this opportunity slip away!"),
            RentData.Testimony(name: "Suyog Shresta", comment: "Simply stunning! This home is an embodiment of beauty and comfort, offering a wonderful place to rent and create your own slice of paradise. Don't miss out on this delightful opportunity"),
            RentData.Testimony(name: "Olasile Oladipupo", comment: "An exquisite home available for rent! This place is a perfect blend of elegance and warmth, and it's ready to become your new sanctuary. Grab this chance to experience the beauty of this lovely home."),
            RentData.Testimony(name: "Puja Shresta", comment: "This home is a real treasure! It's not just a place to rent; it's a space where you can truly make memories and enjoy the beauty of everyday life. Don't hesitate to seize this fantastic opportunity") ]),
        
    
        RentData(name: "House Two", amount: "$2000", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseTwo"), status: "Available", size: "Three Bedroom", testimonies: [RentData.Testimony(name: "Olasile Oladipupo", comment: "Wow, what a find! This home is an absolute beauty, offering a perfect blend of style and comfort. It's an excellent place to rent and create a warm, inviting atmosphere for yourself.")]),
    
        RentData( name: "House Three", amount: "$1200", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThree"), status: "Available", size: "One Bedroom", testimonies: [RentData.Testimony(name: "Puja Shresta", comment: "This home is a real treasure! It's not just a place to rent; it's a space where you can truly make memories and enjoy the beauty of everyday life. Don't hesitate to seize this fantastic opportunity")]),
    
        RentData(name: "House Four", amount: "$2000", address: "Orillia", image: UIImage(imageLiteralResourceName: "houseFour"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Pramod Regmi", comment: "A true haven for those seeking a place to call home. This rental is not just beautiful; it's a slice of paradise that you can enjoy every day. Don't let this opportunity slip away!")]),
    
        RentData(name: "House Five", amount: "$1300", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseFive"), status: "Available", size: "Four Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Six", amount: "$1100", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Four bedroom Duplex", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Seven", amount: "$3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeven"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live"), RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live"),RentData.Testimony(name: "Name Name", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Eight", amount: "$3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEight"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Nine", amount: "$900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNine"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Ten", amount: "$800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Eleven", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEleven"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Twelve", amount: "$700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwelve"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Thirteen", amount: "$650", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThirteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Fourteen", amount: "$800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFourteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData( name: "House Fifteen", amount: "$700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFifteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData( name: "House Sixteen", amount: "$900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSixteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Seventeen", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeventeen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Eighten", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEighteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Nineteen", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNineteen"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")]),
    
    RentData(name: "House Twenty", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwenty"), status: "Available", size: "Two Bedroom", testimonies: [RentData.Testimony(name: "Manushi Khadka", comment: "Beautiful Home. Nice Place to live")])


]

