//
//  UserSettings.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 21.11.2020.
//

import Foundation
import UIKit

final class UserSettings {
    
    private static let userDefaults = UserDefaults.standard
    
    enum Keys: String {
        case minNumber
        case maxNumber
    }
    
    static var numberMin: Int! {
        get {
            return userDefaults.integer(forKey: Keys.minNumber.rawValue)
        } set {
            if let minNumber = newValue {
                userDefaults.set(minNumber, forKey: Keys.minNumber.rawValue)
            }
        }
    }
    
    static var numberMinString: String {
        return  String(numberMin)
    }
    
    static var numberMax: Int! {
        get {
            return userDefaults.integer(forKey: Keys.maxNumber.rawValue)
        } set {
            if let maxNumber = newValue {
                userDefaults.set(maxNumber, forKey: Keys.maxNumber.rawValue)
            }
        }
    }
    
    static var numberMaxString: String {
        return  String(numberMax)
    }
    
    deinit {
        print("UserSettingsDeinit")
    }
    
}
