
import SwiftUI

struct HotelInfoView: View {
    @ObservedObject var viewModel: HotelsViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                CustomNavigationView(title: "Отель", isBack: false)
                ScrollView(.vertical) {
                    VStack(spacing: 8) {
                        topView()
                        lowView()
                    }
                    .background(Color(red: 0.13, green: 0.135, blue: 0.15, opacity: 0.08))
                }
                ButtonView(title: "К выбору номера") {
                    viewModel.open()
                }
            } else {
                ProgressView()
            }
        }
        .alert(viewModel.errorString, isPresented: $viewModel.isError) {
            Button("Ok") {
                viewModel.setModel()
            }
        }
    }
    
    @ViewBuilder
    func topView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            PhotoView(urls: $viewModel.model.imageUrls)
            HotelTitleView(rating: $viewModel.model.rating,
                           ratingName: $viewModel.model.ratingName,
                           name: $viewModel.model.name,
                           adress: $viewModel.model.adress)
            PriceView(price: $viewModel.model.price, priceFor: $viewModel.model.priceForIt)
                .padding([.bottom, .leading])
        }
        .background(.white)
        .cornerRadius(15)
    }
    
    @ViewBuilder
    func lowView() -> some View {
        AboutHotelView(peculiarities: $viewModel.model.aboutTheHotel.peculiarities,
                       description: $viewModel.model.aboutTheHotel.description)
        .background(.white)
        .cornerRadius(15)
    }
}

