//
//  SoccerMainTableViewCell.swift
//  Parimatch
//
//  Created by rs on 05.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class SoccerMainTableViewCell: UITableViewCell {

    var soccerMatch: SoccerMatch!
    
    let containerView = MatchCard()
    let bigHSeperator = UIView()

    let sportNiceLabel = UILabel()
    
    let hstackTeams = UIStackView()
    let firstTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    let secondTeamLabel = TitleLabel(alignment: .center, fontSize: 15)
    
    let vstackTime = UIStackView()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    var cardHeight: CGFloat {
        get { return 170 }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContainerView()
        configureCell()
        configureContainersSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setLabels(_ match: SoccerMatch) {
        sportNiceLabel.text = match.sportNice
        firstTeamLabel.text = match.homeTeam
        secondTeamLabel.text = match.teams.first(where: {$0 != match.homeTeam})
        
        setTimeDateLabels(match)
    }
    
    func setSoccerMatch(_ match: SoccerMatch) {
        soccerMatch = match
        setLabels(match)
    }
    
    private func setTimeDateLabels(_ match: SoccerMatch) {
        dateLabel.text = match.commenceTime.getStringDate()
        timeLabel.text = match.commenceTime.getStringTime()
       }
    
    private func configureContainerView() {
        addSubview(containerView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            containerView.heightAnchor.constraint(equalToConstant: cardHeight)
        ])
    }
    
    private func configureContainersSubviews() {
        containerView.addSubviews(sportNiceLabel, hstackTeams, bigHSeperator, vstackTime)
        
        configureSportNiceLabel()
        configureHStackTeams()
        configureBigHSeperator()
        configureVStackTime()
    }
    
    private func configureHStackTeams() {
        hstackTeams.addArrangedSubview(firstTeamLabel)
        hstackTeams.addArrangedSubview(vstackTime)
        hstackTeams.addArrangedSubview(secondTeamLabel)
        
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
    
    private func configureVStackTime() {
        vstackTime.addArrangedSubview(timeLabel)
        vstackTime.addArrangedSubview(dateLabel)
        
        vstackTime.axis = .vertical
        vstackTime.distribution = .fillEqually
        vstackTime.alignment = .center
        
        timeLabel.font = Fonts.gilroyExtraBold?.withSize(30)
        timeLabel.textColor = Colors.subGray

        dateLabel.font = Fonts.gilroyRegular?.withSize(15)
        dateLabel.textColor = Colors.subGray
    }
    
    private func configureBigHSeperator() {
        bigHSeperator.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            bigHSeperator.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bigHSeperator.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            bigHSeperator.heightAnchor.constraint(equalToConstant: 2),
            bigHSeperator.topAnchor.constraint(equalTo: hstackTeams.bottomAnchor, constant: 10)
        ])
    }
        
    private func configureSportNiceLabel() {
        sportNiceLabel.font = Fonts.pmFont?.withSize(20)
        sportNiceLabel.textColor = Colors.subGray
        
        let padding: CGFloat = 10
        
        NSLayoutConstraint.activate([
            sportNiceLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            sportNiceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            sportNiceLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            sportNiceLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureCell() {
        backgroundColor = .black
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 8)
        ])
    }

}
