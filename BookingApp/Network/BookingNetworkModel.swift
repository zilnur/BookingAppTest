//
//  BookingNetworkModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import Foundation

struct BookingModel: Codable, Identifiable {
    var id: Int
    var hotelName: String
    var hotelAdress: String
    var horating: Int
    var ratingName: String
    var departure: String
    var arrivalCountry: String
    var tourDateStart: String
    var tourDateStop: String
    var numberOfNights: Int
    var room: String
    var nutrition: String
    var tourPrice: Int
    var fuelCharge: Int
    var serviceCharge: Int
    var totalPrice: String {
        get { String(describing: tourPrice + fuelCharge + serviceCharge)}
        set {}
    }
    
    init(id: Int = 0,
         hotelName: String = "",
         hotelAdress: String = "",
         horating: Int = 0,
         ratingName: String = "",
         departure: String = "",
         arrivarCountry: String = "",
         tourDateStart: String = "",
         tourDataStop: String = "",
         numberOfNights: Int = 0,
         room: String = "",
         nutrition: String = "",
         tourPrice: Int = 0,
         fuelCharge: Int = 0,
         serviceCharge: Int = 0) {
        self.id = id
        self.hotelName = hotelName
        self.hotelAdress = hotelAdress
        self.horating = horating
        self.ratingName = ratingName
        self.departure = departure
        self.arrivalCountry = arrivarCountry
        self.tourDateStart = tourDateStart
        self.tourDateStop = tourDataStop
        self.numberOfNights = numberOfNights
        self.room = room
        self.nutrition = nutrition
        self.tourPrice = tourPrice
        self.fuelCharge = fuelCharge
        self.serviceCharge = serviceCharge
    }
}
