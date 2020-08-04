//
//  CoefficientButton.swift
//  Parimatch
//
//  Created by rs on 03.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class CoefficientButton: UIButton {
    
    let containerView = UIView()
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
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.cornerRadius = 5
        containerView.layer.backgroundColor = UIColor.systemGray.cgColor
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 44),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func configureWinnerLabel() {
        containerView.addSubview(winnerLabel)
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        winnerLabel.textAlignment = .right
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            winnerLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            winnerLabel.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -padding),
            winnerLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            winnerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCoefficientLabel() {
        containerView.addSubview(coefficientLabel)
        coefficientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coefficientLabel.textAlignment = .left
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            coefficientLabel.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: padding),
            coefficientLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            coefficientLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            coefficientLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    
}
