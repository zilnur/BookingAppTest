//
//  AboutHotelView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct AboutHotelView: View {
    
    @Binding var peculiarities: [String]
    @Binding var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Об отеле")
                .font(.system(size: 22, weight: .medium))
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                ForEach(peculiarities, id: \.self) { pec in
                    Text(pec)
                        .font(.system(size: 16, weight: .medium))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                        .cornerRadius(5)
                }
            }
            Text(description)
                .font(.system(size: 16))
            VStack {
                descriptionView(image: "emoji", title: "Удобства")
                Divider()
                descriptionView(image: "tick", title: "Что включено")
                Divider()
                descriptionView(image: "close", title: "Что не включено")
            }
            .padding(15)
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 0.13, green: 0.135, blue: 0.15, opacity: 0.03))
            }
            .cornerRadius(15)
        }
        .padding()
    }
    
    @ViewBuilder
    func descriptionView(image: String, title: String) -> some View {
        HStack(spacing: 12) {
            Image(image)
                .resizable()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16))
                Text("Самое необходимое")
                    .font(.system(size: 14))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            }
            Spacer()
            Image("left")
                .resizable()
                .frame(width: 16, height: 20)
        }
    }
}
