//
//  SoccerBet.swift
//  Parimatch
//
//  Created by rs on 04.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct SoccerBet: Codable {
    let id = UUID().uuidString
    let soccerMatch: SoccerMatch
    let betOption: SoccerBetOption
    let coefficient: Double
    let sum: Int
}
