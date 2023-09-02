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
    @Published var errorString = ""
    @Published var isError = false
    
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
    
    //Добавляет туриста
    func addTourist() {
        guard tourists.count < 6 else { return }
        tourists.append(TouristModel())
    }
    
    //Возвращает строку с номером, добавленного туриста
    func numberOfTourist(tourist: TouristModel) -> String {
        guard let index = tourists.firstIndex(where: {$0.id == tourist.id}) else { return ""}
        return index.description.localize() + " турист"
    }
    
    //Обращается к NetworkManger и наполняет модель
    func setModel() {
        network.dataTaskPublisher(path: .booking, model: BookingModel.self)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] error in
                switch error {
                case .failure(let error):
                    errorString = error.localizedDescription
                    isError.toggle()
                case .finished:
                    isLoaded = true
                }
            } receiveValue: { model in
                self.model = model
            }
            .store(in: &subscriber)
    }
    
    //Переход на следующий экран
    func open() {
        coordinator.toSuccessModule()
    }
}
