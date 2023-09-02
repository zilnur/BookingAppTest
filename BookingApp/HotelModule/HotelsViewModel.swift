//
//  ViewModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//
import Foundation
import Combine

protocol HotelsViewModelProtocol {
    var model: HotelsModel { get set }
    var isLoaded: Bool { get set }
    func open()
}

class HotelsViewModel: HotelsViewModelProtocol, ObservableObject {
    
    @Published var model: HotelsModel = .init()
    @Published var isLoaded = false
    
    private var networkManager: NetworkManagerProtocol
    private var subscriber = Set<AnyCancellable>()
    private var coordinator: Coordinator
    
    init(networkManager: NetworkManagerProtocol, coordinator: Coordinator) {
        self.networkManager = networkManager
        self.coordinator = coordinator
        if !isLoaded {
            self.setModel()
        }
    }
    
    func setModel() {
        networkManager.dataTaskPublisher(path: .hotels, model: HotelsModel.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] error in
                isLoaded = true
            }, receiveValue: { model in
                self.model = model
            })
            .store(in: &subscriber)
    }
    
    func open() {
        coordinator.toRoomsModule(title: model.name)
    }
}
