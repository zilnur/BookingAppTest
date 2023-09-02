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
    @Published var path = [Route]()
    let networkmanager: NetworkManagerProtocol
    
    init() {
        self.networkmanager = NetworkManager()
        self.hotelViewModel = HotelsViewModel(networkManager: networkmanager, coordinator: self)
    }
    
    //Переход на модуль выбора номеров
    func toRoomsModule(title: String) {
        self.roomsViewModel = RoomsViewModel(network: networkmanager,title: title, coordinator: self)
        path.append(.rooms)
    }
    
    //Переход на модуль бронирования
    func toBookingModeul() {
        self.bookingViewModel = BookingViewModel(network: networkmanager, coordinator: self)
        path.append(.booking)
    }
    
    //Переход на модуль информирования о совершенной оплате
    func toSuccessModule() {
        self.successViewModel = SuccessViewModel(coordinator: self)
        path.append(.success)
        
    }
    
    //Возврат к корневому View
    func popToRoot() {
        path.removeAll()
    }
}
