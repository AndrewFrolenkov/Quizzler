//
//  StackView.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 31.01.23.
//

import UIKit

class StackView: UIStackView {
    
    let labelScore: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Question Text"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var choiceOne: UIButton = {
        return settingButton(title: "Choice 1")
    }()
    
    lazy var choiceTwo: UIButton = {
        return settingButton(title: "Choice 2")
    }()
    
    lazy var choiceThree: UIButton = {
        return settingButton(title: "Choice 3")
    }()
    
    let barProgressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progressTintColor = #colorLiteral(red: 1, green: 0.4588235294, blue: 0.6588235294, alpha: 1)
        progressView.trackTintColor = .white
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.spacing = 10
        self.axis = .vertical
        self.distribution = .fillProportionally
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addNewSubview()
        constraintsButton()
    }
    
    private func addNewSubview() {
        
        self.addArrangedSubview(labelScore)
        self.addArrangedSubview(label)
        self.addArrangedSubview(choiceOne)
        self.addArrangedSubview(choiceTwo)
        self.addArrangedSubview(choiceThree)
        self.addArrangedSubview(barProgressView)
    }
    
    
    // Setting Button
    private func settingButton(title: String) -> UIButton {
        
        let button = UIButton()
        button.configuration = buttonConfiguration(title: title)
        button.addTarget(nil, action: #selector(ViewController.answerButtonPressed(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    func updateUI(quizBrain: QuizBrain) {
        self.label.text = quizBrain.getQuestionText()
        labelScore.text = "Score \(quizBrain.getScore())"
        let textButton = quizBrain.getQuestionTextButton()
        choiceOne.configuration = buttonConfiguration(title: textButton[0])
        choiceTwo.configuration = buttonConfiguration(title: textButton[1])
        choiceThree.configuration = buttonConfiguration(title: textButton[2])
        choiceOne.backgroundColor = .clear
        choiceTwo.backgroundColor = .clear
        choiceThree.backgroundColor = .clear
        barProgressView.progress = quizBrain.getProgress()
        
    }
    
    // Button Configuration
    private func buttonConfiguration(title: String) -> UIButton.Configuration {
        
        var background = UIBackgroundConfiguration.clear()
        background.image = UIImage(named: "Rectangle")
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        configuration.attributedTitle?.font = UIFont.systemFont(ofSize: 25)
        configuration.attributedTitle?.foregroundColor = .white
        configuration.background = background
        
        
        return configuration
    }
    
    private func constraintsButton() {
        NSLayoutConstraint.activate([
            choiceOne.heightAnchor.constraint(equalToConstant: 80),
            choiceTwo.heightAnchor.constraint(equalToConstant: 80),
            choiceThree.heightAnchor.constraint(equalToConstant: 80),
            barProgressView.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
