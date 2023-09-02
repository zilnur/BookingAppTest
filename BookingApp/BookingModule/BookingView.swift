//
//  BookingView.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 31.08.2023.
//

import SwiftUI

struct BookingView: View {
    @ObservedObject var viewModel: BookingViewModel
    var width = UIScreen.main.bounds.width
    
    @State var phoneNumber = ""
    @State var email = ""
    
    var body: some View {
        VStack {
            if viewModel.isLoaded {
                CustomNavigationView(title: "Бронирование")
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        HotelTitleView(rating: $viewModel.model.horating,
                                       ratingName: $viewModel.model.ratingName,
                                       name: $viewModel.model.hotelName,
                                       adress: $viewModel.model.hotelAdress)
                        .padding(.vertical, 16)
                        .frame(width: width)
                        .background(.white)
                        .cornerRadius(15)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            descriptionRow(title: "Вылет из", value: viewModel.model.departure)
                            descriptionRow(title: "Страна, город", value: viewModel.model.arrivalCountry)
                            descriptionRow(title: "Даты", value: viewModel.model.tourDateStart + "-" + viewModel.model.tourDateStop)
                            descriptionRow(title: "Кол-во дней", value: String(describing: viewModel.model.numberOfNights))
                            descriptionRow(title: "Отель", value: viewModel.model.hotelName)
                            descriptionRow(title: "Номер", value: viewModel.model.room)
                            descriptionRow(title: "Питание", value: viewModel.model.nutrition)
                        }
                        .padding(.vertical, 16)
                        .background(.white)
                        .cornerRadius(15)
                        
                        buyerInfo()
                            .background(.white)
                            .cornerRadius(15)
                        
                        ForEach($viewModel.tourists) { tourist in
                            VStack {
                                touristTitle(title: viewModel.numberOfTourist(tourist: tourist.wrappedValue), buttonImage: tourist.isOpen.wrappedValue ? "up" : "down", buttonColor: Color(red: 0.05, green: 0.45, blue: 1).opacity(0.1)) {
                                    withAnimation {
                                        tourist.isOpen.wrappedValue.toggle()
                                    }
                                }
                                if tourist.wrappedValue.isOpen {
                                    VStack {
                                        textField(title: "Имя", placeHolder: "Иван", text: tourist.name)
                                        textField(title: "Фамилия", placeHolder: "Иванов", text: tourist.secondName)
                                        textField(placeHolder: "Дата рождения", text: tourist.birthDay)
                                        textField(placeHolder: "Гражданство", text: tourist.citizenship)
                                        textField(placeHolder: "Номер загранпаспорта", text: tourist.passportNumber)
                                        textField(placeHolder: "Срок действия загранпаспорта", text: tourist.passportTime)
                                    }
                                }
                            }
                            .padding(16)
                            .background(.white)
                            .cornerRadius(15)
                        }
                        
                        touristTitle(title: "Добавить туриста", buttonImage: "plus", buttonColor: Color(red: 0.05, green: 0.45, blue: 1)) {
                            withAnimation {
                                viewModel.addTourist()
                            }
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(15)
                        
                        price()
                            .padding(16)
                            .background(.white)
                            .cornerRadius(15)
                    }
                    .padding(.vertical, 8)
                    .background(Color(red: 0.13, green: 0.135, blue: 0.15, opacity: 0.08))
                    ButtonView(title: "Оплатить " + viewModel.model.totalPrice) {
                        viewModel.open()
                    }
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
    func descriptionRow(title: String, value: String) -> some View {
        HStack(alignment: .top) {
                Text(title)
                    .frame(width: width / 2 - 32, alignment: .leading)
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
                Text(value)
                    .frame(alignment: .leading)
                    .frame(width: width / 2, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .frame(width: width, alignment: .leading)
    }
    
    @ViewBuilder
    func buyerInfo() -> some View {
        VStack(alignment: .leading) {
            Text("Информация о покупателе")
                .font(.system(size: 22, weight: .medium))
            
            self.textField(title: "Номер телефона", placeHolder: "Введите номер", text: $phoneNumber)
            self.textField(title: "Почта", placeHolder: "examplemail.000@mail.ru", text: $email)
            
            Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                .font(.system(size: 14))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
        }
        .padding(16)
    }
    
    @ViewBuilder
    func textField(title: String? = nil, placeHolder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if let title {
                Text(title)
                    .font(Font.custom("SF Pro Display", size: 12))
                    .kerning(0.12)
                    .foregroundColor(Color(red: 0.66, green: 0.67, blue: 0.72))
            }
            TextField(placeHolder, text: text, axis: .horizontal)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, title != nil ? 10 : 16)
        .background(Color(red: 0.96, green: 0.96, blue: 0.98))
        .cornerRadius(10)
    }
    
    @ViewBuilder
    func touristTitle(title: String, imageColor: Color = .white, buttonImage: String, buttonColor: Color, buttonHandler: @escaping () -> Void) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 22, weight: .medium))
            Spacer()
            Button {
                buttonHandler()
            } label: {
                Image(buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                    .foregroundColor(.white)
                    .padding(7)
                    .background {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(buttonColor)
                            .scaledToFill()
                    }
            }
        }
    }
    
    @ViewBuilder
    func price() -> some View {
        VStack(spacing: 16) {
            priceRow(title: "Тур", value: String(describing: viewModel.model.tourPrice))
            priceRow(title: "Топливный сбор", value: String(describing: viewModel.model.fuelCharge))
            priceRow(title: "Сервисный сбор", value: String(describing: viewModel.model.serviceCharge))
            priceRow(title: "К оплате", value: String(describing: viewModel.model.totalPrice), color: .blue)
        }
    }
    
    @ViewBuilder
    func priceRow(title: String, value: String, color: Color = .black) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.51, green: 0.53, blue: 0.59))
            Spacer()
            Text(value + " ₽")
                .font(.system(size: 16))
                .foregroundColor(color)
        }
    }
}

