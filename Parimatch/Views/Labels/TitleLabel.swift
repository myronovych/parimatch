//
//  TitleLabel.swift
//  Parimatch
//
//  Created by rs on 03.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(alignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        textAlignment = alignment
        self.font = Fonts.pmFont
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
        font = Fonts.pmFont
        textColor = Colors.mainYellow
    }
}
