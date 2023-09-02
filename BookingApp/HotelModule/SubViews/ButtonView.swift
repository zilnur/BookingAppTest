//
//  Button.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct ButtonView: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .frame(height: 48)
                .overlay {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
        }
        .padding(.horizontal)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "К выбору номера") {
            print("Ok")
        }
    }
}
