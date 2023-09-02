//
//  ViewModel.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//
import Foundation
import Combine

class HotelsViewModel: ObservableObject {
    
    @Published var model: HotelsModel = .init()
    @Published var isLoaded = false
    @Published var errorString = ""
    @Published var isError = false
    
    private var networkManager: NetworkManagerProtocol
    private var subscriber = Set<AnyCancellable>()
    private var coordinator: Coordinator
    
    init(networkManager: NetworkManagerProtocol, coordinator: Coordinator) {
        self.networkManager = networkManager
        self.coordinator = coordinator
        self.setModel()
    }
    
    //Обращается к NetworkManger и наполняет модель
    func setModel() {
        networkManager.dataTaskPublisher(path: .hotels, model: HotelsModel.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] error in
                switch error {
                case .failure(let error):
                    errorString = error.localizedDescription
                    isError.toggle()
                case .finished:
                    isLoaded = true
                }
            }, receiveValue: { model in
                self.model = model
            })
            .store(in: &subscriber)
    }
    
    //Переход на следующий экран
    func open() {
        coordinator.toRoomsModule(title: model.name)
    }
}
