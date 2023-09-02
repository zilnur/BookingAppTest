import Foundation
import Combine

class RoomsViewModel: ObservableObject {
    
    @Published var model = [RoomModel]()
    @Published var isLoaded = false
    @Published var errorString = ""
    @Published var isError = false
    var title: String
    
    let network: NetworkManagerProtocol
    var subscriber = Set<AnyCancellable>()
    var coordinator: Coordinator
    
    init(network: NetworkManagerProtocol, title: String, coordinator: Coordinator) {
        self.network = network
        self.title = title
        self.coordinator = coordinator
        setModel()
    }
    
    //Обращается к NetworkManger и наполняет модель
    func setModel() {
        network.dataTaskPublisher(path: .detail, model: RoomsModel.self)
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
                self.model = model.rooms
            })
            .store(in: &subscriber)
    }
    
    //Переход на следующий экран
    func open() {
        coordinator.toBookingModeul()
    }
}
