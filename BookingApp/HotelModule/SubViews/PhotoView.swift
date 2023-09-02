//
//  PhotoView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 30.08.2023.
//

import SwiftUI

struct PhotoView: View {
    
    @Binding var urls: [String]
    @State var selectedImage: Int = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedImage) {
                ForEach(0..<urls.count, id: \.description) { index in
                    image(setURL(string: urls[index]))
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            HStack {
                ForEach(0..<urls.count, id: \.description) { index in
                    Circle()
                        .fill(selectedImage == index ? .black : .gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(.white)
            }
            .padding(8)
        }
        .frame(height: 257)
    }
    
    @ViewBuilder
    func image(_ url: URL?) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .frame(height: 257)
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal, 16)
        } placeholder: {
            ProgressView()
        }
    }
    
    func setURL(string: String) -> URL? {
        URL(string: string)
    }
}

struct PhotoView_Previews: PreviewProvider {
    
    @State static var urls = ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"]
    
    static var previews: some View {
        PhotoView(urls: $urls)
            .frame(height: 257)
    }
}
