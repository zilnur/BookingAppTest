//
//  CoordinatorView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import SwiftUI

struct CoordinatorView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HotelInfoView(viewModel: coordinator.hotelViewModel)
                .toolbar(.hidden)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .rooms:
                        RoomsView(viewModel: coordinator.roomsViewModel!)
                            .toolbar(.hidden)
                    case .booking:
                        BookingView(viewModel: coordinator.bookingViewModel!)
                            .toolbar(.hidden)
                    case .success:
                        SuccessView(viewModel: coordinator.successViewModel!)
                            .toolbar(.hidden)
                    }
                }
        }
    }
}
