//
//  File.swift
//  BookingApp
//
//  Created by Ильнур Закиров on 01.09.2023.
//

import SwiftUI

extension String {
    
    //Локализация строки
    func localize() -> String {
        NSLocalizedString(self, comment: "")
    }
}
