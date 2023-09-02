//
//  RoomsView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct RoomsView: View {
    @ObservedObject var viewModel: RoomsViewModel
    
    var body: some View {
        if viewModel.isLoaded {
            VStack {
                CustomNavigationView(title: viewModel.title)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach($viewModel.model, id: \.imageUrls) { model in
                            RoomView(model: model, open: viewModel.open)
                                .padding(.vertical, 16)
                                .background(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.vertical, 8)
                    .background(Color(red: 0.13, green: 0.135, blue: 0.15, opacity: 0.08))
                }
            }
        } else {
            ProgressView()
        }
    }
}

