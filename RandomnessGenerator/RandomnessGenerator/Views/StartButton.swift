//
//  StartButton.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 13.11.2020.
//

import UIKit

class StartButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.2 : 1
        }
    }
    
}
