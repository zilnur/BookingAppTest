//
//  TouristModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 02.09.2023.
//

import Foundation

struct TouristModel: Identifiable {
    let id = UUID()
    var name: String
    var secondName: String
    var birthDay: String
    var citizenship: String
    var passportNumber: String
    var passportTime: String
    var isOpen: Bool
    
    init(name: String = "",
         secondName: String = "",
         birthDay: String = "",
         citizenship: String = "",
         passportNumber: String = "",
         passportTime: String = "",
         isOpen: Bool = false) {
        self.name = name
        self.secondName = secondName
        self.birthDay = birthDay
        self.citizenship = citizenship
        self.passportNumber = passportNumber
        self.passportTime = passportTime
        self.isOpen = isOpen
    }
}
