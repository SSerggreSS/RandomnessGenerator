//
//  ExtensionUILabel.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 22.11.2020.
//

import Foundation
import UIKit

class LabelNumberRandom: UILabel {
    
    override func draw(_ rect: CGRect) {

        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setFill()
        path.fill()
        super.draw(rect)
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        super.drawText(in: rect.inset(by: insets))
    }
    
}
