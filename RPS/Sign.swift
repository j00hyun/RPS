//
//  Sign.swift
//  RPS
//
//  Created by Park JooHyun on 2022/03/10.
//

import Foundation

enum Sign {
    case rock, paper, scissiors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissiors: return "✌️"
        }
    }
    
    func compareSign(opponent: Sign) -> GameState {
        switch self {
        case .rock:
            switch opponent {
            case .rock: return .draw
            case .paper: return .lose
            case .scissiors: return .win
            }
        case .paper:
            switch opponent {
            case .rock: return .win
            case .paper: return .draw
            case .scissiors: return .lose
            }
        case .scissiors:
            switch opponent {
            case .rock: return .lose
            case .paper: return .win
            case .scissiors: return .draw
            }
        }
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissiors
    }
}
