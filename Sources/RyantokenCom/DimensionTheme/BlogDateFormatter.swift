//
//  BlogDateFormatter.swift
//  
//
//  Created by Ryan Token on 03/22/2020.
//

import Foundation

extension DateFormatter {
    static var blog: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
}
