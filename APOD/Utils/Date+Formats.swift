//
//  Date+Formats.swift
//  APOD
//
//  Created by Eduardo Andrade on 1/07/20.
//  Copyright © 2020 Eduardo Andrade. All rights reserved.
//

import Foundation

extension Date {

    // MARK: - Custom Functions
    func getDateWith(format: Format) -> String {
        let formater = DateFormatter()
        formater.timeZone = .current
        formater.locale = .current
        formater.dateFormat = format.rawValue
        let date = formater.string(from: self)
        return date
    }
}
