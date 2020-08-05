//
//  BetsViewController.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class BetsViewController: UIViewController {
    
    let tableView = UITableView()
    
    var bets = [soccerBet1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My bets"
        
        configureColors()
        configureTableView()
        
    }
    
    private func configureColors() {
        navigationController?.navigationBar.barTintColor = Colors.mainYellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.backgroundColor = .black
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(BetTableViewCell.self, forCellReuseIdentifier: BetTableViewCell.reuseIdentifier)
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension BetsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BetTableViewCell.reuseIdentifier) as! BetTableViewCell
        cell.setSoccerBet(bet: bets[indexPath.row])
        
        return cell
    }
}

let soccerBet1 = SoccerBet(soccerMatch: match1, betOption: SoccerBetOption.W1, coefficient: 2.0, sum: 100)
let match1 = SoccerMatch(sportNice: "EPL", teams: ["Man U.", "Arsenal"], commenceTime: Date(timeIntervalSince1970: 1415637900), homeTeam: "Arsenal", sites: [site1])
let site1 = Site(siteKey: "PariMatch", siteNice: "Parimatch", odds: ["h2h":[2.0, 3.4, 4.5]])
