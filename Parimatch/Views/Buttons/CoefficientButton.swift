//
//  CoefficientButton.swift
//  Parimatch
//
//  Created by rs on 03.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class CoefficientButton: UIButton {
    
    let winnerLabel = UILabel()
    let coefficientLabel = UILabel()
    var betOption: SoccerBetOption!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureWinnerLabel()
        configureCoefficientLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(betOption: SoccerBetOption) {
        self.init(frame: .zero)
        self.betOption = betOption
        winnerLabel.text = betOption.rawValue
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setCoefficient(coefficient: Double) {
        coefficientLabel.text = String(coefficient)
    }
    
    
    private func configureWinnerLabel() {
        addSubview(winnerLabel)
        
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        winnerLabel.textAlignment = .right
        winnerLabel.textColor = Colors.subGray
                
        NSLayoutConstraint.activate([
            winnerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            winnerLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            winnerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            winnerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCoefficientLabel() {
        addSubview(coefficientLabel)
        
        coefficientLabel.translatesAutoresizingMaskIntoConstraints = false
        coefficientLabel.textAlignment = .left
        coefficientLabel.textColor = Colors.subGray
        coefficientLabel.font = Fonts.pmFont
        
        NSLayoutConstraint.activate([
            coefficientLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            coefficientLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            coefficientLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            coefficientLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
