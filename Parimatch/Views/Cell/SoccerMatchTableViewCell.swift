//
//  SoccerTableViewCell.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

protocol MatchBetDelegate {
    func didSelectBet(soccerMatch: SoccerMatch, sender: CoefficientButton)
}

class SoccerMatchTableViewCell: SoccerMainTableViewCell {
    
    static let reuseIdentifier = "soccerMatchCell"
    
    var betDelegate: MatchBetDelegate!
    
    let hstackCoeffs = UIStackView()
    let firstWinnerButton = CoefficientButton(betOption: SoccerBetOption.W1)
    let drawButton = CoefficientButton(betOption: SoccerBetOption.X)
    let secondWinnerButton = CoefficientButton(betOption: SoccerBetOption.W2)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureContainersSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSoccerMatch(_ match: SoccerMatch) {
        soccerMatch = match
        setLabels(match)
    }
    
    // MARK: - layout
    
    private func configureContainersSubviews() {
        containerView.addSubviews(hstackCoeffs)
        
        configureHStackCoeffs()
    }
    
    private func configureHStackCoeffs() {
        hstackCoeffs.axis = .horizontal
        hstackCoeffs.distribution = .equalSpacing
        hstackCoeffs.alignment = .center
        hstackCoeffs.spacing = 5
        
        let buttons = [firstWinnerButton, drawButton, secondWinnerButton]
        
        for (index, button) in buttons.enumerated() {
            hstackCoeffs.addArrangedSubview(button)
            if index != buttons.count - 1 {
                hstackCoeffs.addArrangedSubview(SmallVSeperator())
            }
            button.addTarget(self, action: #selector(self.coeffPressed(_:)), for: .touchUpInside)
        }
        
        NSLayoutConstraint.activate([
            hstackCoeffs.topAnchor.constraint(equalTo: bigHSeperator.bottomAnchor, constant: 5),
            hstackCoeffs.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstackCoeffs.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstackCoeffs.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func coeffPressed(_ sender: CoefficientButton!) {
        betDelegate.didSelectBet(soccerMatch: soccerMatch, sender: sender)
    }
    
    private func setLabels(_ match: SoccerMatch) {
        sportNiceLabel.text = match.sportNice
        firstTeamLabel.text = match.homeTeam
        secondTeamLabel.text = match.teams.first(where: {$0 != match.homeTeam})
        
        setTimeDateLabels(match)
        setButtonsCoeffsLabels(match)
    }
    
    private func setTimeDateLabels(_ match: SoccerMatch) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateLabel.text = dateFormatter.string(from: match.commenceTime)
        dateFormatter.dateFormat = "HH:MM"
        timeLabel.text = dateFormatter.string(from: match.commenceTime)
    }
    
    private func setButtonsCoeffsLabels(_ match: SoccerMatch) {
        let firstTeamCoff = match.sites[0].odds["h2h"]?[0] ?? 1
        firstWinnerButton.setCoefficient(coefficient: firstTeamCoff)
        
        let drawCoff = match.sites[0].odds["h2h"]?[2] ?? 1
        drawButton.setCoefficient(coefficient: drawCoff)
        
        let secondTeamCoff = match.sites[0].odds["h2h"]?[1] ?? 1
        secondWinnerButton.setCoefficient(coefficient: secondTeamCoff)
    }
}
