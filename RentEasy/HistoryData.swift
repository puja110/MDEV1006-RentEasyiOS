//
//  HistoryData.swift
//  RentEasy
//
//  Created by Oladipupo Olasile on 2023-11-04.
//

import Foundation
import UIKit

struct HistoryData {
    let homeName: String
    let homeAddress: String
    let homeSize: String
    let homeAmount: String
    let homeStatus: String
    
}

    let allHistory: [HistoryData] = [
    
        HistoryData(homeName: "Town House", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Available"),
        
        HistoryData(homeName: "Apartment", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$700", homeStatus: "Booked"),
        
        HistoryData(homeName: "Small frienly Apartment", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Available"),
        
        HistoryData(homeName: "Four Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Available"),
        
        HistoryData(homeName: "Two Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Booked")
    ]


let holdHistory: [HistoryData] = [

    HistoryData(homeName: "Single Room", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$600", homeStatus: ""),
    
    HistoryData(homeName: "Studio Apartment", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$600", homeStatus: "Booked"),
    
    HistoryData(homeName: "Three Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Booked"),
    
    HistoryData(homeName: "Four Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Booked"),
    
    HistoryData(homeName: "Two Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Booked")
]



let soldHistory: [HistoryData] = [

    HistoryData(homeName: "Two Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Sold"),
    
    HistoryData(homeName: "One Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Sold"),
    
    HistoryData(homeName: "Three Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Sold"),
    
    HistoryData(homeName: "Four Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Sold"),
    
    HistoryData(homeName: "Two Bedroom", homeAddress: "Barrie", homeSize: "Two Badrooms", homeAmount: "$1200", homeStatus: "Sold")
]


