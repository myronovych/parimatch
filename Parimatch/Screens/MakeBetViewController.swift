//
//  MakeBetViewController.swift
//  Parimatch
//
//  Created by rs on 05.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class MakeBetViewController: UIViewController {
    
    var bet: SoccerBet!
    
    let sportNiceLabel = UILabel()
    let timeLabel = UILabel()
    let dateLabel = UILabel()
    
    let homeTeamBackground = UIImageView(image: UIImage(named: "homeTeamBackground"))
    let homeTeamLabel = UILabel()
    let guestTeamBackground = UIImageView(image: UIImage(named: "guestTeamBackground"))
    let guestTeamLabel = UILabel()
    
    let enterAmountView = AmountTextField()
    
    let placeBetButton = PlaceBetButton()
    
    let padding: CGFloat = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureElements()
    }
    
    private func configure() {
        view.backgroundColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func configureElements() {
        setLabels()
        configureNiceLabel()
        configureTimeLabel()
        configureDateLabel()
        configureHomeTeam()
        configureGuestTeam()
        configureButton()
        configureEnterAmount()
    }
    
    private func setLabels() {
        sportNiceLabel.text = bet.soccerMatch.sportNice
        
        timeLabel.text = bet.soccerMatch.commenceTime.getStringTime()
        dateLabel.text = bet.soccerMatch.commenceTime.getStringDate()
        
        homeTeamLabel.text = bet.soccerMatch.homeTeam
        guestTeamLabel.text = bet.soccerMatch.teams.first(where: ({$0 != bet.soccerMatch.homeTeam}))
    }
    
    private func configureNiceLabel() {
        view.addSubview(sportNiceLabel)
        sportNiceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sportNiceLabel.font = Fonts.pmFont?.withSize(42)
        sportNiceLabel.textColor = .white
        sportNiceLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            sportNiceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            sportNiceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            sportNiceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            sportNiceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTimeLabel() {
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = Fonts.pmFontBold?.withSize(90)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor, constant: padding),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            timeLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = Fonts.gilroyRegular
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureHomeTeam() {
        view.addSubview(homeTeamBackground)
        homeTeamBackground.translatesAutoresizingMaskIntoConstraints = false
        
        homeTeamBackground.addSubview(homeTeamLabel)
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        homeTeamLabel.textAlignment = .center
        homeTeamLabel.font = Fonts.pmFont?.withSize(30)
        homeTeamLabel.adjustsFontSizeToFitWidth = true
        homeTeamLabel.lineBreakMode = .byTruncatingTail
        homeTeamLabel.numberOfLines = 2
        homeTeamLabel.minimumScaleFactor = 0.5
        homeTeamLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            homeTeamBackground.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding + 5),
            homeTeamBackground.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamBackground.topAnchor, constant: padding),
            homeTeamLabel.bottomAnchor.constraint(equalTo: homeTeamBackground.bottomAnchor, constant: -padding * 2),
            homeTeamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            homeTeamLabel.trailingAnchor.constraint(equalTo: homeTeamBackground.trailingAnchor, constant: -padding * 3)
        ])
    }
    
    private func configureGuestTeam() {
        view.addSubview(guestTeamBackground)
        guestTeamBackground.translatesAutoresizingMaskIntoConstraints = false
        
        guestTeamBackground.addSubview(guestTeamLabel)
        guestTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guestTeamLabel.textAlignment = .center
        guestTeamLabel.numberOfLines = 2
        guestTeamLabel.adjustsFontSizeToFitWidth = true
        guestTeamLabel.lineBreakMode = .byTruncatingTail
        guestTeamLabel.minimumScaleFactor = 0.3
        guestTeamLabel.font = Fonts.pmFont?.withSize(30)
        guestTeamLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            guestTeamBackground.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            guestTeamBackground.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            guestTeamLabel.topAnchor.constraint(equalTo: guestTeamBackground.topAnchor, constant: padding * 2),
            guestTeamLabel.bottomAnchor.constraint(equalTo: guestTeamBackground.bottomAnchor, constant: -padding),
            guestTeamLabel.leadingAnchor.constraint(equalTo: guestTeamBackground.leadingAnchor, constant: padding * 2),
            guestTeamLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func configureButton() {
        view.addSubview(placeBetButton)
        
        NSLayoutConstraint.activate([
            placeBetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            placeBetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            placeBetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    private func configureEnterAmount() {
        view.addSubview(enterAmountView)
        enterAmountView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            enterAmountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            enterAmountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            enterAmountView.heightAnchor.constraint(equalToConstant: 44),
            enterAmountView.bottomAnchor.constraint(equalTo: placeBetButton.topAnchor, constant: -padding)
        ])
    }
    
    
}
