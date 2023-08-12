//
//  String+exts.swift
//  MovieApp
//
//  Created by k1d_dev on 12/08/23.
//

import Foundation

extension String {
    func formatToHumanReadableDate(inputFormat: String, outputStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        if let date = dateFormatter.date(from: self) {
            let humanReadableFormatter = DateFormatter()
            humanReadableFormatter.dateStyle = outputStyle
            return humanReadableFormatter.string(from: date)
        } else {
            return "Invalid date format"
        }
    }
}
