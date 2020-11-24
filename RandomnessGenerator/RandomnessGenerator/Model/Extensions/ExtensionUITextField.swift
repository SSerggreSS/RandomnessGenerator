//
//  ExtensionUITextField.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 21.11.2020.
//

import Foundation
import UIKit

extension UITextField {
    
    func addInputAccessoryViewWith(title: String, target: Any, selector: Selector) {

        let toolbar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.width,
                                              height: UIScreen.main.bounds.height / 20))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)
        toolbar.setItems([flexible, barButton], animated: true)
        self.inputAccessoryView = toolbar
        
    }
    
    var type: TypeTextField {
        var t = TypeTextField.minimum
        switch tag {
        case 0:
            t = .minimum
        case 1:
            t = .maximum
        default:
            break
        }
        return t
    }
    
}
