//
//  RandomGenerator.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 15.11.2020.
//

import Foundation

struct RandomGenerator {
    
    private let maxPossibleNumber = Int.max
    private let minPossibleNumber = 0
    
    var minimumNumber = 1
    var maximumNumber = 100
    
    private var counterRandomNumbers = 0
    private var numbers = Set<Int>()
    private var isArrayWasFull = false
    
//    mutating func generatedRandomNumberTest(from fromNum: Int, to toNum: Int, withoutRepeat: Bool) -> Int? {
//        var randomNumber = 0
//
//        if withoutRepeat {
//
//        repeat {
//            randomNumber = Int.random(in: fromNum...toNum)
//            print(randomNumber)
//        } while numbers.contains(randomNumber)
//            numbers.insert(randomNumber)
//
//        } else {
//            randomNumber = Int.random(in: fromNum...toNum)
//        }
//
//        counterRandomNumbers += 1
//
//        return randomNumber
//    }

    mutating func generatedRandomNumber() -> Int {
        var randomNumber = 0
        
    
            randomNumber = Int.random(in: minimumNumber...maximumNumber)
        print("minimumNumber = \(minimumNumber), maximumNumber = \(maximumNumber), randomNumber = \(randomNumber)")
        
        return randomNumber
    }

}
