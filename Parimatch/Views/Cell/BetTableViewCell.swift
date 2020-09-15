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
    private var sum: Int!
    
    let betLabel = TitleLabel()
    let coeffLabel = UILabel()
    
    let yourBetLabel = TitleLabel()
    let betSum = UILabel()
    
    let possibleWinLabel = TitleLabel()
    let sumWinLabel = UILabel()
    
    override var cardHeight: CGFloat {
        get { return 250 }
    }
    
    let padding: CGFloat = 10
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSoccerBet(bet: SoccerBet) {
        setSoccerMatch(bet.soccerMatch)
        betOption = bet.betOption
        coefficient = bet.coefficient
        sum = bet.sum
        configureLabels()
    }
    
    private func setBetLabelText() {
        if betOption == SoccerBetOption.W2 {
            betLabel.text = soccerMatch.teams.first(where: { $0 != soccerMatch.homeTeam })!
        } else if betOption == SoccerBetOption.X {
            betLabel.text = "Draw"
        } else {
            betLabel.text = soccerMatch.homeTeam
        }
    }
    
    private func setLabelsText() {
        setBetLabelText()
        coeffLabel.text = String(coefficient)
        yourBetLabel.text = "Your bet:"
        betSum.text = String(sum)
        possibleWinLabel.text = "Possible win:"
        sumWinLabel.text = String(format: "%.2f", coefficient * Double(sum))
    }
    
    private func configureLabels() {
        setLabelsText()
        configureWinnerLabel()
        configureCoeffLabel()
        configureYourBetLabel()
        configureSumLabel()
        configurePossibleWinLabel()
        configurePossibleSumLabel()
    }
    
    private func configureWinnerLabel() {
        addSubview(betLabel)
        betLabel.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            betLabel.topAnchor.constraint(equalTo: bigHSeperator.bottomAnchor, constant: padding),
            betLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            betLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            betLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureCoeffLabel() {
        addSubview(coeffLabel)
        coeffLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coeffLabel.textAlignment = .right
        coeffLabel.font = Fonts.pmFont
        coeffLabel.textColor = Colors.subGray
        
        NSLayoutConstraint.activate([
            coeffLabel.topAnchor.constraint(equalTo: bigHSeperator.bottomAnchor, constant: padding),
            coeffLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            coeffLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding),
            coeffLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureYourBetLabel() {
        addSubview(yourBetLabel)
        yourBetLabel.translatesAutoresizingMaskIntoConstraints = false
        yourBetLabel.textColor = Colors.subGray
        
        NSLayoutConstraint.activate([
            yourBetLabel.topAnchor.constraint(equalTo: betLabel.bottomAnchor, constant: padding),
            yourBetLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            yourBetLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            yourBetLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureSumLabel() {
        addSubview(betSum)
        betSum.translatesAutoresizingMaskIntoConstraints = false
        
        betSum.textAlignment = .right
        betSum.font = Fonts.pmFont
        betSum.textColor = Colors.subGray
        
        NSLayoutConstraint.activate([
            betSum.topAnchor.constraint(equalTo: coeffLabel.bottomAnchor, constant: padding),
            betSum.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            betSum.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding),
            betSum.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configurePossibleWinLabel() {
        addSubview(possibleWinLabel)
        possibleWinLabel.translatesAutoresizingMaskIntoConstraints = false
        possibleWinLabel.textColor = Colors.subGray
        
        NSLayoutConstraint.activate([
            possibleWinLabel.topAnchor.constraint(equalTo: yourBetLabel.bottomAnchor, constant: padding),
            possibleWinLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            possibleWinLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            possibleWinLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configurePossibleSumLabel() {
        addSubview(sumWinLabel)
        sumWinLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sumWinLabel.textAlignment = .right
        sumWinLabel.font = Fonts.pmFont
        sumWinLabel.textColor = Colors.subGray
        
        NSLayoutConstraint.activate([
            sumWinLabel.topAnchor.constraint(equalTo: betSum.bottomAnchor, constant: padding),
            sumWinLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            sumWinLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding),
            sumWinLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
}
