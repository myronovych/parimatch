//
//  BasketballViewController.swift
//  Parimatch
//
//  Created by rs on 02.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class BasketballViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureColors()
        title = "Basketball"
    }
    
    private func configureColors() {
        navigationController?.navigationBar.barTintColor = .black
        view.backgroundColor = .systemGray2
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]
    }
    


}
