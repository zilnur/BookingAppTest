//
//  CoordinatorView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case rooms, booking, success
}

class Coordinator: ObservableObject {
    
    @Published var hotelViewModel: HotelsViewModel!
    @Published var roomsViewModel: RoomsViewModel?
    @Published var bookingViewModel: BookingViewModel?
    @Published var successViewModel: SuccessViewModel?
    let networkmanager: NetworkManagerProtocol
    @Published var path = [Route]()
    
    init() {
        self.networkmanager = NetworkManager()
        self.hotelViewModel = HotelsViewModel(networkManager: networkmanager, coordinator: self)
    }
    
    func toRoomsModule(title: String) {
        self.roomsViewModel = RoomsViewModel(network: networkmanager,title: title, coordinator: self)
        path.append(.rooms)
    }
    
    func toBookingModeul() {
        self.bookingViewModel = BookingViewModel(network: networkmanager, coordinator: self)
        path.append(.booking)
    }
    
    func toSuccessModule() {
        self.successViewModel = SuccessViewModel(coordinator: self)
        path.append(.success)
        
    }
    
    func popToRoot() {
        path.removeAll()
    }
}
