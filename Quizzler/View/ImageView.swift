//
//  imageView.swift
//  Quizzler
//
//  Created by Андрей Фроленков on 31.01.23.
//

import UIKit

class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "Background-Bubbles")
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
