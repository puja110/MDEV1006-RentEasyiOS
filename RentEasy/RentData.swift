//
//  RentData.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-10-18.
//

import Foundation
import UIKit

struct RentData {
    let id: UUID
    let name: String
    let amount: String
    let address: String
    let image: UIImage
    let status: String
    let size: String
}


    let property: [RentData] = [
        RentData(id: UUID(), name: "House One", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Two", amount: "$2000", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseTwo"), status: "Available", size: "Three Bedroom"),
    
    RentData(id: UUID(), name: "House Three", amount: "$1200", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThree"), status: "Available", size: "One Bedroom"),
    
    RentData(id: UUID(), name: "House Four", amount: "$2000", address: "Orillia", image: UIImage(imageLiteralResourceName: "houseFour"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Five", amount: "$1300", address: "Alliston", image: UIImage(imageLiteralResourceName: "houseFive"), status: "Available", size: "Four Bedroom"),
    
    RentData(id: UUID(), name: "House Six", amount: "$1100", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseOne"), status: "Available", size: "Four bedroom Duplex"),
    
    RentData(id: UUID(), name: "House Seven", amount: "$3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeven"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Eight", amount: "$3000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEight"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Nine", amount: "$900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNine"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Ten", amount: "$800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Eleven", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEleven"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Twelve", amount: "$700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwelve"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Thirteen", amount: "$650", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseThirteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Fourteen", amount: "$800", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFourteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Fifteen", amount: "$700", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseFifteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Sixteen", amount: "$900", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSixteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Seventeen", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseSeventeen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Eighten", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseEighteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Nineteen", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseNineteen"), status: "Available", size: "Two Bedroom"),
    
    RentData(id: UUID(), name: "House Twenty", amount: "$1000", address: "Barrie", image: UIImage(imageLiteralResourceName: "houseTwenty"), status: "Available", size: "Two Bedroom")


]

