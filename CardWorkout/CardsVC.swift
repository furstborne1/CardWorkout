//
//  ViewController.swift
//  CardWorkout
//
//  Created by MARC on 4/15/20.
//  Copyright © 2020 MARC. All rights reserved.
//

import UIKit

class CardsVC: UIViewController {
    @IBOutlet var cardImageiew: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    lazy var cards: [UIImage] = {
        return Cards.deck
    }()
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonViews()
        setTimer()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    

    @IBAction func stopButtonPressed(_ sender: Any) {
        timer.invalidate()
        
    }
    
    @IBAction func restartButtonPressed(_ sender: Any) {
        timer.invalidate()
        setTimer()
        
    }
    
    func setTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(setRandomCards), userInfo: nil, repeats: true)
    }
    
    @objc func setRandomCards() {
        cardImageiew.image = cards.randomElement()
    }
        
    func setupButtonViews() {
        for button in buttons {
            button.layer.cornerRadius = 7
        }
    }
}

