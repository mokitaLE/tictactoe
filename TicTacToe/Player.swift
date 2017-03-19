//
//  Player.swift
//  TicTacToe
//
//  Created by Monique Brauer on 19/03/2017.
//  Copyright © 2017 MokitaLE. All rights reserved.
//

import UIKit

enum Player: Int {
    case one = 1
    case two = 2

    mutating func next() {
        switch self {
        case .one: self = .two
        case .two: self = .one
        }
    }

    var card: UIImage {
        switch self {
        case .one: return UIImage(named:"rocket")!
        case .two: return UIImage(named:"astronaut")!
        }
    }

    var cardColour: UIColor {
        switch self {
        case .one: return .red
        case .two: return .blue
        }
    }

    var name: String {
        switch self {
        case .one: return "one"
        case .two: return "two"
        }
    }
}
