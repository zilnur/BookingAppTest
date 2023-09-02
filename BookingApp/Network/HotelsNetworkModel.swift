//
//  HotelsNetworkModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//

import Foundation

struct HotelsModel: Codable, Identifiable {
    var id: Int
    var name: String
    var adress: String
    var minimalPrice: Int
    var priceForIt: String
    var rating: Int
    var ratingName: String
    var imageUrls: [String]
    var aboutTheHotel: AboutTheHotel
    var price: String {
        get { "от " + minimalPrice.formatted() }
        set {}
    }
    
    init(id: Int = 0, name: String = "", adress: String = "", minimalPrice: Int = 0, priceForIt: String = "", rating: Int = 0, ratingName: String = "", imageUrls: [String] = [], aboutTheHotel: AboutTheHotel = .init()) {
        self.id = id
        self.name = name
        self.adress = adress
        self.minimalPrice = minimalPrice
        self.priceForIt = priceForIt
        self.rating = rating
        self.ratingName = ratingName
        self.imageUrls = imageUrls
        self.aboutTheHotel = aboutTheHotel
    }
}

struct AboutTheHotel: Codable {
    var description: String
    var peculiarities: [String]
    
    init(description: String = "", peculiarities: [String] = []) {
        self.description = description
        self.peculiarities = peculiarities
    }
}
