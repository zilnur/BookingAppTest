//
//  NetworkManager.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//

import Foundation
import Combine

protocol NetworkManagerProtocol {
    func dataTaskPublisher<T: Decodable>(path: Paths, model: T.Type) -> AnyPublisher<T, Error>
}

enum Paths: String {
    case hotels = "/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    case detail = "/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
    case booking = "/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"
}

class NetworkManager: NetworkManagerProtocol {
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    private func url(path: Paths) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = path.rawValue
        return components.url
    }
    
    func dataTaskPublisher<T: Decodable>(path: Paths, model: T.Type) -> AnyPublisher<T, Error> {
        URLSession.shared.dataTaskPublisher(for: url(path: path)!)
            .map {$0.data}
            .decode(type: model.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
