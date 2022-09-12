//
//  Date+Local.swift
//  Zell
//
//  Created by Boris Klykavka on 04.09.2022.
//

import Foundation

extension Date {

    func getFormattedDate(format: LocalDateFormats) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format.rawValue
        dateFormat.locale = Locale(identifier: "en_US")
        return dateFormat.string(from: self)
    }

}
