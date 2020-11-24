//
//  Enums.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 20.11.2020.
//

import Foundation

enum TypeByCellContent: Int, CaseIterable {
    case labelMin = 0
    case textFieldMin
    case labelMax
    case textFieldMax
}

enum TypeLabel: Int {
    case minimum = 0
    case maximum
}

enum TypeTextField: Int {
    case minimum = 0
    case maximum
}

enum TypeSection: Int {
    case first = 0
    case second
}
