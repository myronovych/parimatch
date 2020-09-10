//
//  ViewController.swift
//  Parimatch
//
//  Created by rs on 01.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit
import Alamofire

class SoccerViewController: DataLoadingViewController {
    
    let tableView = UITableView()
    var matches = [SoccerMatch]()
    
    var selectedBet: SoccerBet?
    var selectedButton: CoefficientButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Soccer"
        
        configureColors()
        configureTableView()
        fetchSoccerMatches()
    }
    
    private func fetchSoccerMatches() {
        showLoadingScreen()
        let request = AF.request("https://api.the-odds-api.com/v3/odds/?apiKey=\(Api.apiKey)&sport=soccer&region=eu&mkt=h2h")
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        request.responseDecodable(of: SoccerMatches.self, decoder: decoder) { response in
            guard let matches = response.value else {
                print(response.error!.localizedDescription)
                self.stopLoadingScreen()
                return }
            
            self.matches = matches.data
            self.stopLoadingScreen()
            self.tableView.reloadData()
        }
    }
    
    private func configureColors() {
        navigationController?.navigationBar.barTintColor = Colors.mainYellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.backgroundColor = .black
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.register(SoccerMatchTableViewCell.self, forCellReuseIdentifier: SoccerMatchTableViewCell.reuseIdentifier)
        
        tableView.frame = view.bounds
        tableView.separatorStyle = .none
        tableView.backgroundColor = .black
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SoccerViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SoccerMatchTableViewCell.reuseIdentifier) as! SoccerMatchTableViewCell
        cell.setSoccerMatch(matches[indexPath.row])
        cell.betDelegate = self
        
        return cell
    }
}

extension SoccerViewController: MatchBetDelegate {
    
    func didSelectBet(soccerMatch: SoccerMatch, sender: CoefficientButton) {
        let makeBetVC = MakeBetViewController()
        makeBetVC.bet = SoccerBet(soccerMatch: soccerMatch, betOption: sender.betOption, coefficient: Double(sender.coefficientLabel.text!)!, sum: 100)
        
        let destVC = UINavigationController(rootViewController: makeBetVC)
        present(destVC, animated: true)
    }
}


