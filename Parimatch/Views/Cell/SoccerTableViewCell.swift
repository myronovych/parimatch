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

class SoccerTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "soccerMatchCell"
    
    private var soccerMatch: SoccerMatch!
    var betDelegate: MatchBetDelegate!
    
    let containerView = MatchCard()
    let bigHSeperator = UIView()

    let sportNiceLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    let hstackTeams = UIStackView()
    let firstTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    let secondTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    
    let hstackCoeffs = UIStackView()
    let firstWinnerButton = CoefficientButton(betOption: SoccerBetOption.W1)
    let drawButton = CoefficientButton(betOption: SoccerBetOption.X)
    let secondWinnerButton = CoefficientButton(betOption: SoccerBetOption.W2)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureContainerView()
        configureCell()
        configureContainersSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSoccerMatch(_ match: SoccerMatch) {
        self.soccerMatch = match
        setLabels(match)
    }
    
    // MARK: - layout
    
    private func configureContainerView() {
        addSubview(containerView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            containerView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    private func configureContainersSubviews() {
        containerView.addSubviews(sportNiceLabel, hstackTeams, dateLabel, timeLabel, hstackCoeffs, bigHSeperator)
        
        configureSportNiceLabel()
        configureHStackTeams()
        configureBigHSeperator()
        configureDateLabel()
        configureTimeLabel()
        configureHStackCoeffs()
    }
    
    private func configureHStackTeams() {
        hstackTeams.addArrangedSubview(secondTeamLabel)
        hstackTeams.addArrangedSubview(firstTeamLabel)
        
        hstackTeams.axis = .horizontal
        hstackTeams.distribution = .fillEqually
        hstackTeams.alignment = .center
        
        NSLayoutConstraint.activate([
            hstackTeams.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor, constant: 10),
            hstackTeams.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstackTeams.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstackTeams.heightAnchor.constraint(equalToConstant: 50),
        ])
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
            hstackCoeffs.topAnchor.constraint(equalTo: bigHSeperator.bottomAnchor, constant: 10),
            hstackCoeffs.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstackCoeffs.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstackCoeffs.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func coeffPressed(_ sender: CoefficientButton!) {
        betDelegate.didSelectBet(soccerMatch: soccerMatch, sender: sender)
    }
    
    private func configureDateLabel() {
        dateLabel.textAlignment = .right
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: sportNiceLabel.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant:  20)
        ])
    }
    
    private func configureTimeLabel() {
        timeLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            timeLabel.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor),
            timeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureBigHSeperator() {
        bigHSeperator.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            bigHSeperator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bigHSeperator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bigHSeperator.heightAnchor.constraint(equalToConstant: 2),
            bigHSeperator.topAnchor.constraint(equalTo: hstackTeams.bottomAnchor)
        ])
    }
    
    
    
    private func configureSportNiceLabel() {
        sportNiceLabel.font = Fonts.pmFont
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            sportNiceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            sportNiceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            sportNiceLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            sportNiceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCell() {
        backgroundColor = .black
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8)
        ])
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
