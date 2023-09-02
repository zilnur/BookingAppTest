//
//  BookingViewModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import Foundation
import Combine

class BookingViewModel: ObservableObject {
    
    @Published var model: BookingModel = .init()
    @Published var isLoaded = false
    @Published var tourists = [TouristModel(isOpen: true), TouristModel()]
    
    var network: NetworkManagerProtocol
    var subscriber = Set<AnyCancellable>()
    var coordinator: Coordinator
    
    init(network: NetworkManagerProtocol, coordinator: Coordinator) {
        self.network = network
        self.coordinator = coordinator
        if !isLoaded {
            setModel()
        }
    }
    
    func addTourist() {
        guard tourists.count < 6 else { return }
        tourists.append(TouristModel())
    }
    
    func numberOfTourist(tourist: TouristModel) -> String {
        guard let index = tourists.firstIndex(where: {$0.id == tourist.id}) else { return ""}
        return index.description.localize() + " турист"
    }
    
    func setModel() {
        network.dataTaskPublisher(path: .booking, model: BookingModel.self)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] error in
                isLoaded = true
            } receiveValue: { model in
                self.model = model
            }
            .store(in: &subscriber)
    }
    
    func open() {
        coordinator.toSuccessModule()
    }
}
