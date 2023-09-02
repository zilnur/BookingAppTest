//
//  HoteTitleView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//

import SwiftUI

struct HotelTitleView: View {
    
    @Binding var rating: Int
    @Binding var ratingName: String
    @Binding var name: String
    @Binding var adress: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image("Icons")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .scaledToFit()
                Text(rating.formatted() + " " + ratingName)
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 1, green: 0.78, blue: 0).opacity(0.2))
            .cornerRadius(5)
            Text(name)
                .font(.system(size: 22))
            Text(adress)
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
        }
        .padding(.horizontal, 16)
    }
}

