//
//  SuccessViewModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import Foundation

class SuccessViewModel: ObservableObject {
    
    var coordinator : Coordinator
    
    init(coordinator : Coordinator) {
        self.coordinator = coordinator
    }
    
    func back() {
        coordinator.popToRoot()
    }
}
