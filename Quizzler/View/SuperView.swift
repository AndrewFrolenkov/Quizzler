//
//  SuperView.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 31.01.23.
//

import UIKit

class SuperView: UIView {

    let viewManager: ViewManager = {
        let manager = ViewManager()
        return manager
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        allAddSubview()
        viewManager.setConstraints(view: self)
        backgroundColor = #colorLiteral(red: 0.1923559308, green: 0.2327082157, blue: 0.3624993563, alpha: 1)
    }
    
    // MARK: All add Subview
    private func allAddSubview() {
        // backgroundView
        addSubview(viewManager.backgroundView)
        // stackView
        addSubview(viewManager.stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(quizBrain: QuizBrain) {
        
        viewManager.stackView.updateUI(quizBrain: quizBrain)
    }
}
