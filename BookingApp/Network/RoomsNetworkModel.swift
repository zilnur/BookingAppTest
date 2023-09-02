//
//  RoomsNetworkModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import Foundation

struct RoomsModel: Codable {
    let rooms: [RoomModel]
}

struct RoomModel: Codable, Identifiable {
    var id: Int
    var name: String
    var price: Int
    var pricePer: String
    var peculiarities: [String]
    var imageUrls: [String]
    var price_: String {
        get { price.formatted() }
        set{}
    }
}
