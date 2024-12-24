//
//  GameStatus.swift
//  BasketballScheduleApp
//
//  Created by Ranjit on 21/12/24.
//

import Foundation

enum GameStatus: Int {
    case future = 1
    case live = 2
    case past = 3
    
    var description: String {
        switch self {
        case .future:
            return "Future Game"
        case .live:
            return "Live Game"
        case .past:
            return "Past Game"
        }
    }
}
