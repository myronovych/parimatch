//
//  Site.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct Site: Decodable {
    let siteKey: String
    let siteNice: String
    let odds: [String: Double]
}
