//
//  Constant.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 13.11.2020.
//

import Foundation
import UIKit

struct Constant {
    
    struct Label {
        struct Size {
            static let width: CGFloat = 150.0
            static let height: CGFloat = 150.0
        }
        struct Font {
            static let size: CGFloat = 50
        }
    }
    
    struct Cell {
        static let height: CGFloat = 40.0
    }
    
    struct TextField {
        struct Font {
            static let size: CGFloat = 40
        }
        struct Text {
            static let placeholderOfMinNumber = "Enter minimum"
            static let placeholderOfMaxNumber = "Enter maximum"
            static let textOfMinNumber = "1"
            static let textOfMaxNumber = "100"
        }
    }
    
    struct Section {
        struct Title {
            static let forFirst =  "Диапазон рандомного числа"
            static let forSecond = "История рандомных чисел"
        }
    }
    
    struct Number {
        static let min = 1
        static let max = 100
        static let zero = 0
    }
    
    struct Strings {
        static let emptyString = ""
    }
    
}
