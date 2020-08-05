//
//  AmountTextField.swift
//  Parimatch
//
//  Created by rs on 05.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class AmountTextField: UIView {
    
    let amountField = UITextField()
    let enterAmountLabel = UILabel()
    let currencyLabel = UILabel()
    
    let padding: CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureEnterAmountLabel()
        configureCurrency()
        configureAmountField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
    }
    
    private func configureEnterAmountLabel() {
        addSubview(enterAmountLabel)
        enterAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        enterAmountLabel.text = "Enter amount:"
        enterAmountLabel.font = Fonts.pmFont
        enterAmountLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            enterAmountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            enterAmountLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            enterAmountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
    
    private func configureCurrency() {
        addSubview(currencyLabel)
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        currencyLabel.text = "UAH "
        currencyLabel.font = Fonts.pmFont
        currencyLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            currencyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            currencyLabel.topAnchor.constraint(equalTo: enterAmountLabel.topAnchor),
            currencyLabel.bottomAnchor.constraint(equalTo: enterAmountLabel.bottomAnchor),
            currencyLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureAmountField() {
        addSubview(amountField)
        amountField.translatesAutoresizingMaskIntoConstraints = false
        
        amountField.font = Fonts.pmFont
        amountField.textColor = Colors.mainGray
        amountField.textAlignment = .right
        amountField.text = "100"
        
        NSLayoutConstraint.activate([
            amountField.leadingAnchor.constraint(equalTo: enterAmountLabel.trailingAnchor, constant: padding),
            amountField.trailingAnchor.constraint(equalTo: currencyLabel.leadingAnchor, constant: -padding),
            amountField.topAnchor.constraint(equalTo: enterAmountLabel.topAnchor),
            amountField.bottomAnchor.constraint(equalTo: enterAmountLabel.bottomAnchor)
        ])
    }
    
}
