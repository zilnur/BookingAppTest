//
//  SuccessView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import SwiftUI

struct SuccessView: View {
    
    @ObservedObject var viewModel: SuccessViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            CustomNavigationView(title: "Заказ оплачен")
            Spacer()
            Image("party pooper")
                .resizable()
                .scaledToFit()
                .frame(width: 69)
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22, weight: .medium))
                .padding(.top, 12)
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                .padding(.horizontal, 23)
            Spacer()
            Divider()
            ButtonView(title: "Супер") {
                viewModel.back()
            }
        }
    }
}

