//
//  ViewController.swift
//  Parimatch
//
//  Created by rs on 01.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit
import Alamofire

class SoccerViewController: UIViewController {
    
    let tableView = UITableView()
    var matches = [SoccerMatch]()
    
    var selectedBet: SoccerBet?
    var selectedButton: CoefficientButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Soccer"
        
        fetchSoccerMatches()
        configureColors()
        configureTableView()
    }
    
    private func fetchSoccerMatches() {
        let request = AF.request("https://api.the-odds-api.com/v3/odds/?apiKey=\(Api.apiKey)&sport=soccer&region=eu&mkt=h2h")
        request.responseDecodable(of: SoccerMatches.self) { response in
            guard let matches = response.value else {
                print(response.error!.localizedDescription)
                return }
            
            self.matches = matches.data
            self.tableView.reloadData()
        }
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
        cell.betDelegate = self
        
        return cell
    }
}

extension SoccerViewController: MatchBetDelegate {
    
    func didSelectBet(soccerMatch: SoccerMatch, sender: CoefficientButton) {
        if let selectedButton = selectedButton {
            selectedButton.layer.backgroundColor = UIColor.systemGray.cgColor
            selectedBet = nil
            self.selectedButton = nil
            if selectedButton == sender { return }
        }
        
        selectedButton = sender
        selectedBet = SoccerBet(soccerMatch: soccerMatch, betOption: sender.betOption, coefficient: Double(sender.coefficientLabel.text ?? "1.0")!)
        selectedButton!.layer.backgroundColor = UIColor.cyan.cgColor
    }
}


//test data
//let match1 = SoccerMatch(sportNice: "EPL", teams: ["Man U.", "Arsenal"], commenceTime: Date(timeIntervalSince1970: 1415637900), homeTeam: "Arsenal", sites: [site1])
//let site1 = Site(siteKey: "PariMatch", siteNice: "Parimatch", odds: ["h2h":[2.0, 3.4, 4.5]])
