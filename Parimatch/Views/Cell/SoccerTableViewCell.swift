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
    let hstack = UIStackView()
    let sportNiceLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let firstTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    let secondTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    
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
        containerView.addSubviews(sportNiceLabel, hstack, dateLabel, timeLabel)
        configureSportNiceLabel()
        configureHStack()
        configureDateLabel()
        configureTimeLabel()
    }
    
    private func configureHStack() {
        hstack.axis = .horizontal
        hstack.distribution = .fillEqually
        hstack.alignment = .center
        hstack.addArrangedSubview(secondTeamLabel)
        hstack.addArrangedSubview(firstTeamLabel)
        
        
        NSLayoutConstraint.activate([
            hstack.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor, constant: 10),
            hstack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            hstack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            hstack.heightAnchor.constraint(equalToConstant: 50),
        ])
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
    }
    
}
