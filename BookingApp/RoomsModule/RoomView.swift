//
//  oomView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct RoomView: View {
    
    @Binding var model: RoomModel
    var open: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            PhotoView(urls: $model.imageUrls)
            title()
            PriceView(price: $model.price_, priceFor: $model.pricePer)
            ButtonView(title: "Выбрать номер") {
                open()
            }
        }
    }
    
    @ViewBuilder
    func title() -> some View {
        VStack(alignment: .leading) {
            Text(model.name)
                .font(.system(size: 22, weight: .medium))
            ScrollView(.horizontal ,showsIndicators: false) {
                HStack {
                    ForEach(model.peculiarities, id: \.self) { pec in
                        Text(pec)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(red: 0.98, green: 0.98, blue: 0.99))
                            .cornerRadius(5)
                    }
                }
            }
            HStack {
                Text("Подробнее о номере")
                    .font(.system(size: 16, weight: .medium))
                Image("left")
                    
            }
            .foregroundColor(Color(red: 0.05, green: 0.45, blue: 1))
            .padding(.leading, 10)
            .padding(.trailing, 2)
            .padding(.vertical, 5)
            .background(Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1))
            .cornerRadius(5)
        }
        .padding(.horizontal, 16)
    }
}

