//
//  SoccerTableViewCell.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class SoccerTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "soccerMatchCell"
    private var soccerMatch: SoccerMatch!
    
    let containerView = UIView()

    let sportNiceLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    let hstackTeams = UIStackView()
    let firstTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    let secondTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    
    let hstackCoeffs = UIStackView()
    let firstWinnerButton = CoefficientButton(winnerLabelText: "W1")
    let drawButton = CoefficientButton(winnerLabelText: "X")
    let secondWinnerButton = CoefficientButton(winnerLabelText: "W2")

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
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func configureContainersSubviews() {
        containerView.addSubviews(sportNiceLabel, hstackTeams, dateLabel, timeLabel, hstackCoeffs)
        configureSportNiceLabel()
        configureHStackTeams()
        configureDateLabel()
        configureTimeLabel()
        configureHStackCoeffs()
    }
    
    private func configureHStackTeams() {
        hstackTeams.axis = .horizontal
        hstackTeams.distribution = .fillEqually
        hstackTeams.alignment = .center
        hstackTeams.addArrangedSubview(secondTeamLabel)
        hstackTeams.addArrangedSubview(firstTeamLabel)
        
        NSLayoutConstraint.activate([
            hstackTeams.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor, constant: 10),
            hstackTeams.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstackTeams.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstackTeams.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func configureHStackCoeffs() {
        hstackCoeffs.axis = .horizontal
        hstackCoeffs.distribution = .fillEqually
        hstackCoeffs.alignment = .center
       
        hstackCoeffs.addArrangedSubview(firstWinnerButton)
        hstackCoeffs.addArrangedSubview(drawButton)
        hstackCoeffs.addArrangedSubview(secondWinnerButton)
        hstackCoeffs.spacing = 5
        self.firstWinnerButton.addTarget(self, action: #selector(self.firstPressed), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            hstackCoeffs.topAnchor.constraint(equalTo: hstackTeams.bottomAnchor, constant: 10),
            hstackCoeffs.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstackCoeffs.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstackCoeffs.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc func firstPressed() {
        print("pressed button")
    }
    
    private func configureDateLabel() {
        dateLabel.textAlignment = .right
        
        let padding: CGFloat = 10
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: sportNiceLabel.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant:  15)
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
    
    private func configureSportNiceLabel() {
        let padding: CGFloat = 10
        sportNiceLabel.font = .systemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            sportNiceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            sportNiceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            sportNiceLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            sportNiceLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCell() {
        backgroundColor = .systemGray2
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8)
        ])
    }
    
    private func setLabels(_ match: SoccerMatch) {
        sportNiceLabel.text = match.sportNice
        firstTeamLabel.text = match.homeTeam
        secondTeamLabel.text = match.teams.first(where: {$0 != match.homeTeam})
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateLabel.text = dateFormatter.string(from: match.commenceTime)
        dateFormatter.dateFormat = "HH:MM"
        timeLabel.text = dateFormatter.string(from: match.commenceTime)
        
        let firstTeamCoff = match.sites[0].odds["h2h"]?[0] ?? 1
        firstWinnerButton.setCoefficient(coefficient: firstTeamCoff)
        
        let drawCoff = match.sites[0].odds["h2h"]?[2] ?? 1
        drawButton.setCoefficient(coefficient: drawCoff)
        
        let secondTeamCoff = match.sites[0].odds["h2h"]?[1] ?? 1
        secondWinnerButton.setCoefficient(coefficient: secondTeamCoff)
    }
}
