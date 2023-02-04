//
//  ViewManager.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 31.01.23.
//

import Foundation
import UIKit

class ViewManager {
    
    let stackView: StackView = {
        let stackView = StackView()
        return stackView
    }()
    
    let backgroundView: ImageView = {
        let imageView = ImageView(frame: CGRect(origin: .zero, size: .zero))
        return imageView
    }()
    
    //MARK: All Constraints
    func setConstraints(view: UIView) {
        // imageView
        NSLayoutConstraint.activate([
            backgroundView.heightAnchor.constraint(equalToConstant: 102),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // stackView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}
