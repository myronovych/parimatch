//
//  File.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import Foundation

struct SoccerMatch: Decodable {
    let sportNice: String
    let teams: [String]
    let commenceTime: Date
    let homeTeam: String
    let sites: [Site]
    
    enum CodingKeys: String, CodingKey {
        case sportNice = "sport_nice"
        case teams
        case commenceTime = "commence_time"
        case homeTeam = "home_team"
        case sites
    }
}
