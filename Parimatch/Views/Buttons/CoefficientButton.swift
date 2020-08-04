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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainer()
        configureWinnerLabel()
        configureCoefficientLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(winnerLabelText: String) {
        self.init(frame: .zero)
        winnerLabel.text = winnerLabelText
    }
    
    func setCoefficient(coefficient: Double) {
        coefficientLabel.text = String(coefficient)
    }
    
    private func configureContainer() {

        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.systemGray.cgColor
        
    }
    
    private func configureWinnerLabel() {
        addSubview(winnerLabel)
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        winnerLabel.textAlignment = .right
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            winnerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            winnerLabel.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -padding),
            winnerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            winnerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCoefficientLabel() {
        addSubview(coefficientLabel)
        coefficientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coefficientLabel.textAlignment = .left
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            coefficientLabel.leadingAnchor.constraint(equalTo: centerXAnchor, constant: padding),
            coefficientLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            coefficientLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            coefficientLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
