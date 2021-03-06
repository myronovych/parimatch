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
    
    var bets = [SoccerBet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My bets"
        
        configureColors()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchBets()
        tableView.reloadData()
    }
    
    private func fetchBets() {
        let defaults = UserDefaults.standard
        
        guard let betsData = defaults.object(forKey: "bets") as? Data else {
            return
        }
        
        do {
            let decoder = JSONDecoder()
            bets = try decoder.decode([SoccerBet].self, from: betsData)
        } catch {
            print("Error occured while fetching.")
        }
        
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

