//
//  MatchCard.swift
//  Parimatch
//
//  Created by rs on 04.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class MatchCard: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
