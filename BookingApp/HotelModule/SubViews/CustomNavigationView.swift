//
//  CustomNavigationView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import SwiftUI

struct CustomNavigationView: View {
    @Environment(\.dismiss) var dissmiss
    var title: String
    var isBack = true
    
    var body: some View {
        HStack {
            if isBack {
                Button {
                    dissmiss.callAsFunction()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
            Spacer()
            Text(title)
                .lineLimit(1)
                .font(.system(size: 18, weight: .medium))
            Spacer()
        }
        .padding(16)
        .background(.white)
    }
}
