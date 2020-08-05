//
//  BetTableViewCell.swift
//  Parimatch
//
//  Created by rs on 05.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class BetTableViewCell: SoccerMainTableViewCell {

    static let reuseIdentifier = "betCell"
    private var betOption: SoccerBetOption!
    private var coefficient: Double!
    
    func setSoccerBet(bet: SoccerBet) {
        setSoccerMatch(bet.soccerMatch)
        betOption = bet.betOption
        coefficient = bet.coefficient
    }
}
