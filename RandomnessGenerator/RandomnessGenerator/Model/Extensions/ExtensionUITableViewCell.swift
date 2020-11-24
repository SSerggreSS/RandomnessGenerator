//
//  ExtensionUITableViewCell.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 17.11.2020.
//

import Foundation
import UIKit

extension UIView {
    
    func getTextField() -> UITextField? {
        var textField: UITextField? = nil
        for view in self.subviews {
            if view.isKind(of: UITextField.self) {
                textField = view as? UITextField
            }
        }
        return textField
      }
    
}
