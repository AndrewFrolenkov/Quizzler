//
//  ViewController.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 31.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain = QuizBrain()
    let manager = SuperView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view = manager
        updateUI()
        
    }
    
    @objc func answerButtonPressed(sender: UIButton) {
        
                guard let label = sender.titleLabel, let userAnswer = label.text else { return }
                let userGotItRight = quizBrain.checkAnswer(answer: userAnswer)
        
        
                if userGotItRight {
                    sender.backgroundColor = .green
                } else {
                    sender.backgroundColor = .red
                }
        
                quizBrain.nextQuestion()
        
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        manager.updateUI(quizBrain: quizBrain)
    }

}

