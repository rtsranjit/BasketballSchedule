//
//  String+Extensions.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import Foundation

extension String {
    
    func toFormatDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" // Adjust the format to match your `gametime`
        return dateFormatter.date(from: self)
    }
    
    func toReadableDate() -> String? {
        let dateFormatter = DateFormatter()
        
        // Define the input format for the date string
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        // Parse the input string into a Date object
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        // Set the output format for the formatted string
        dateFormatter.dateFormat = "EEE MMM dd" // For "SUN APR 13"
        
        // Convert the date to the user's local time zone
        dateFormatter.timeZone = TimeZone.current
        
        // Return the formatted string
        return dateFormatter.string(from: date).uppercased()
    }
    
    func toMonthString() -> String? {
        let dateFormatter = DateFormatter()
        
        // Define the input format for the date string
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        // Parse the input string into a Date object
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        
        // Set the output format for the formatted string
        dateFormatter.dateFormat = "MMMM yyyy" // For "SUN APR 13"
        
        // Convert the date to the user's local time zone
        dateFormatter.timeZone = TimeZone.current
        
        // Return the formatted string
        return dateFormatter.string(from: date).uppercased()
    }
    
}
