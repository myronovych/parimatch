//
//  ViewController.swift
//  Parimatch
//
//  Created by rs on 01.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class SoccerViewController: UIViewController {
    
    let tableView = UITableView()
    var matches = [match1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Soccer"
        configureColors()
        configureTableView()
    }
    
    private func configureColors() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
        view.backgroundColor = .systemGray2
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(SoccerTableViewCell.self, forCellReuseIdentifier: SoccerTableViewCell.reuseIdentifier)
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray2
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension SoccerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SoccerTableViewCell.reuseIdentifier) as! SoccerTableViewCell
        cell.setSoccerMatch(matches[indexPath.row])
        
        return cell
    }
}

let match1 = SoccerMatch(sportNice: "EPL", teams: ["Man U.", "Arsenal"], commenceTime: Date(timeIntervalSince1970: 1415637900), homeTeam: "Arsenal", sites: [site1])
let site1 = Site(siteKey: "PariMatch", siteNice: "Parimatch", odds: ["h2h":[2.0, 3.4, 4.5]])
