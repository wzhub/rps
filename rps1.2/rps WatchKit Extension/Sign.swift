//
//  Sign.swift
//  rps WatchKit Extension
//
//  Created by J1W on 2021/4/25.
//

import Foundation
enum Sign {
    case rock, paper, scissors
    var signEmoji: String {
        switch self {
        case .rock: return "✊"
        case .paper: return "🖐️"
        case .scissors: return "✌️"
        }
    }
    func compare(with anotherSign: Self) -> Result {
        switch self {
        case .rock:
            switch anotherSign {
            case .rock: return .draw
            case .paper: return .lose
            case .scissors: return .win
            }
        case .paper:
            switch anotherSign {
            case .rock: return .win
            case .paper: return .draw
            case .scissors: return .lose
            }
        case .scissors:
            switch anotherSign {
            case .rock: return .lose
            case .paper: return .win
            case .scissors: return .draw
            }
        }
    }
}
