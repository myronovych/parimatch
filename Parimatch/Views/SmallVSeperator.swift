//
//  SmallVSeperator.swift
//  Parimatch
//
//  Created by rs on 04.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit


class SmallVSeperator: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .black
        
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 16),
            widthAnchor.constraint(equalToConstant: 2)
        ])
    }
}
