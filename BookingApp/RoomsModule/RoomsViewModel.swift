import Foundation
import Combine

class RoomsViewModel: ObservableObject {
    
    @Published var model = [RoomModel]()
    @Published var isLoaded = false
    var title: String
    
    let network: NetworkManagerProtocol
    var subscriber = Set<AnyCancellable>()
    var coordinator: Coordinator
    
    init(network: NetworkManagerProtocol, title: String, coordinator: Coordinator) {
        self.network = network
        self.title = title
        self.coordinator = coordinator
        if !isLoaded {
            setModel()
        }
    }
    
    func setModel() {
        network.dataTaskPublisher(path: .detail, model: RoomsModel.self)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] error in
                isLoaded = true
            }, receiveValue: { model in
                self.model = model.rooms
            })
            .store(in: &subscriber)
    }
    
    func open() {
        coordinator.toBookingModeul()
    }
}
