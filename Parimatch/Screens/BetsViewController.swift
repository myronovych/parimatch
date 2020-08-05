//
//  BetsViewController.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class BetsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My bets"
        
        configureColors()
    }
    
    private func configureColors() {
        navigationController?.navigationBar.barTintColor = Colors.mainYellow
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.backgroundColor = .black
    }
}
