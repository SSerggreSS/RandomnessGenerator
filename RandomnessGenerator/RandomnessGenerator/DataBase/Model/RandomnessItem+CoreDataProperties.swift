//
//  RandomnessItem+CoreDataProperties.swift
//  RandomnessGenerator
//
//  Created by Сергей  Бей on 07.12.2020.
//
//

import Foundation
import CoreData


extension RandomnessItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RandomnessItem> {
        return NSFetchRequest<RandomnessItem>(entityName: "RandomnessItem")
    }

    @NSManaged public var date: Date?
    @NSManaged public var number: Int64

}

extension RandomnessItem : Identifiable {

}
