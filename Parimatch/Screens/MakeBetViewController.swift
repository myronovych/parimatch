//
//  MakeBetViewController.swift
//  Parimatch
//
//  Created by rs on 05.08.2020.
//  Copyright © 2020 Oleksandr Myronovych. All rights reserved.
//

import UIKit

class MakeBetViewController: UIViewController {
    
    var bet: SoccerBet!
    
    let sportNiceLabel = UILabel()
    let timeLabel = UILabel()
    let dateLabel = UILabel()
    
    let homeTeamBackground = UIImageView(image: UIImage(named: "homeTeamBackground"))
    let homeTeamLabel = UILabel()
    let guestTeamBackground = UIImageView(image: UIImage(named: "guestTeamBackground"))
    let guestTeamLabel = UILabel()
    
    let resultLabel = TitleLabel()
    let coefficientLabel = TitleLabel()
    
    let possibleWinLabel = UILabel()
    let possibleAmountLabel = UILabel()
    
    let enterAmountView = AmountTextField()
    
    let placeBetButton = PlaceBetButton()
    
    let padding: CGFloat = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        configureElements()
        configureKeyboard()
    }
    
    private func configure() {
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem?.tintColor = Colors.mainYellow
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func configureElements() {
        setLabels()
        configureNiceLabel()
        configureTimeLabel()
        configureDateLabel()
        configureHomeTeam()
        configureGuestTeam()
        configureButton()
        configureEnterAmount()
        configurePossibleWin()
        configureResultCoeffLabels()
    }
    
    private func setLabels() {
        sportNiceLabel.text = bet.soccerMatch.sportNice
        
        timeLabel.text = bet.soccerMatch.commenceTime.getStringTime()
        dateLabel.text = bet.soccerMatch.commenceTime.getStringDate()
        
        homeTeamLabel.text = bet.soccerMatch.homeTeam
        guestTeamLabel.text = bet.soccerMatch.teams.first(where: ({$0 != bet.soccerMatch.homeTeam}))
    }
    
    private func configureNiceLabel() {
        view.addSubview(sportNiceLabel)
        sportNiceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sportNiceLabel.font = Fonts.pmFont?.withSize(42)
        sportNiceLabel.textColor = .white
        sportNiceLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            sportNiceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            sportNiceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            sportNiceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            sportNiceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureTimeLabel() {
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = Fonts.pmFontBold?.withSize(90)
        timeLabel.textColor = .white
        timeLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: sportNiceLabel.bottomAnchor, constant: padding),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            timeLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = Fonts.gilroyRegular
        dateLabel.textColor = .white
        dateLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureHomeTeam() {
        view.addSubview(homeTeamBackground)
        homeTeamBackground.translatesAutoresizingMaskIntoConstraints = false
        
        homeTeamBackground.addSubview(homeTeamLabel)
        homeTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        homeTeamLabel.textAlignment = .center
        homeTeamLabel.font = Fonts.pmFont?.withSize(30)
        homeTeamLabel.adjustsFontSizeToFitWidth = true
        homeTeamLabel.lineBreakMode = .byTruncatingTail
        homeTeamLabel.numberOfLines = 2
        homeTeamLabel.minimumScaleFactor = 0.5
        homeTeamLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            homeTeamBackground.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding + 5),
            homeTeamBackground.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            
            homeTeamLabel.topAnchor.constraint(equalTo: homeTeamBackground.topAnchor, constant: padding),
            homeTeamLabel.bottomAnchor.constraint(equalTo: homeTeamBackground.bottomAnchor, constant: -padding * 2),
            homeTeamLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            homeTeamLabel.trailingAnchor.constraint(equalTo: homeTeamBackground.trailingAnchor, constant: -padding * 3)
        ])
    }
    
    private func configureGuestTeam() {
        view.addSubview(guestTeamBackground)
        guestTeamBackground.translatesAutoresizingMaskIntoConstraints = false
        
        guestTeamBackground.addSubview(guestTeamLabel)
        guestTeamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guestTeamLabel.textAlignment = .center
        guestTeamLabel.numberOfLines = 2
        guestTeamLabel.adjustsFontSizeToFitWidth = true
        guestTeamLabel.lineBreakMode = .byTruncatingTail
        guestTeamLabel.minimumScaleFactor = 0.3
        guestTeamLabel.font = Fonts.pmFont?.withSize(30)
        guestTeamLabel.textColor = Colors.mainGray
        
        NSLayoutConstraint.activate([
            guestTeamBackground.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: padding),
            guestTeamBackground.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            guestTeamLabel.topAnchor.constraint(equalTo: guestTeamBackground.topAnchor, constant: padding * 2),
            guestTeamLabel.bottomAnchor.constraint(equalTo: guestTeamBackground.bottomAnchor, constant: -padding),
            guestTeamLabel.leadingAnchor.constraint(equalTo: guestTeamBackground.leadingAnchor, constant: padding * 2),
            guestTeamLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func configureButton() {
        view.addSubview(placeBetButton)
        placeBetButton.addTarget(self, action: #selector(placeBet), for: .touchUpInside)
        NSLayoutConstraint.activate([
            placeBetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            placeBetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            placeBetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    @objc func placeBet() {
        let defaults = UserDefaults.standard
        var myBets = [SoccerBet]()
        if let myBetsData = defaults.object(forKey: "bets") as? Data {
            do {
                let decoder = JSONDecoder()
                myBets = try decoder.decode([SoccerBet].self, from: myBetsData)
            } catch {
                print("Error occured while fetching bets from UserDefaults")
            }
        }
        
        guard let amount = enterAmountView.amountField.text, !amount.isEmpty else {
            return
        }
        myBets.append(SoccerBet(soccerMatch: bet.soccerMatch, betOption: bet.betOption, coefficient: bet.coefficient, sum: Int(amount)!))
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(myBets)
            defaults.set(data, forKey: "bets")
        } catch {
            print("Error occured while saving bet to UserDefaults")
        }
        dismissVC()
    }
    
    private func configureEnterAmount() {
        view.addSubview(enterAmountView)
        enterAmountView.translatesAutoresizingMaskIntoConstraints = false
        
        enterAmountView.amountField.delegate = self
        enterAmountView.amountField.addTarget(self, action: #selector(changedAmount(_:)), for: .editingChanged)
        
        NSLayoutConstraint.activate([
            enterAmountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            enterAmountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            enterAmountView.heightAnchor.constraint(equalToConstant: 44),
            enterAmountView.bottomAnchor.constraint(equalTo: placeBetButton.topAnchor, constant: -padding)
        ])
    }
    
    @objc func changedAmount(_ textField: UITextField) {
        if textField.text!.isEmpty {
            possibleAmountLabel.text = String(bet.coefficient * 0.0) + " UAH "
            return
        }
        possibleAmountLabel.text = String(bet.coefficient * Double(textField.text ?? "0")!) + " UAH "
    }
    
    private func configurePossibleWin() {
        view.addSubviews(possibleWinLabel, possibleAmountLabel)
        
        possibleWinLabel.text = "Possible win: "
        possibleWinLabel.font = Fonts.pmFont
        possibleWinLabel.textColor = Colors.mainYellow
        
        possibleAmountLabel.text = String(format: "%.2f",bet.coefficient * Double(enterAmountView.amountField.text!)!) + " UAH "
        possibleAmountLabel.font = Fonts.pmFont
        possibleAmountLabel.textColor = Colors.mainYellow
        
        NSLayoutConstraint.activate([
            possibleWinLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            possibleWinLabel.bottomAnchor.constraint(equalTo: enterAmountView.topAnchor, constant: -padding),
            
            possibleAmountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            possibleAmountLabel.bottomAnchor.constraint(equalTo: possibleWinLabel.bottomAnchor)
            
        ])
    }
    
    private func configureResultCoeffLabels() {
        view.addSubviews(resultLabel, coefficientLabel)
        
        var expectedWinner = bet.soccerMatch.homeTeam
        
        if bet.betOption == SoccerBetOption.X {
            expectedWinner = "Draw"
        } else if bet.betOption == SoccerBetOption.W2 {
            expectedWinner = guestTeamLabel.text!
        }
        
        resultLabel.text = expectedWinner
        
        coefficientLabel.text = String(bet.coefficient)
        coefficientLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: possibleWinLabel.topAnchor, constant: -padding),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            
            coefficientLabel.bottomAnchor.constraint(equalTo: resultLabel.bottomAnchor),
            coefficientLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    private func configureKeyboard() {
        addDoneButtonOnKeyboard()
        addKeyBoardObservers()
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        
        enterAmountView.amountField.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction(){
        enterAmountView.amountField.resignFirstResponder()
    }
    
    private func addKeyBoardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}

extension MakeBetViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
