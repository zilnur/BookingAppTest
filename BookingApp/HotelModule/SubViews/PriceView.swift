//
//  PriceView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct PriceView: View {
    @Binding var price: String
    @Binding var priceFor: String
    var body: some View {
        HStack(alignment: .bottom) {
            Text(price + " ₽")
                .font(.system(size: 30))
            Text(priceFor)
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
        }
    }
}


