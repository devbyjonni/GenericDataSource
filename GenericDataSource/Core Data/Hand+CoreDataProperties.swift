//
//  Hand+CoreDataProperties.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-02.
//
//

import Foundation
import CoreData


extension Hand {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hand> {
        return NSFetchRequest<Hand>(entityName: "Hand")
    }

    @NSManaged public var title: String?
    @NSManaged public var creationDate: Date?

}

extension Hand: Identifiable, ModelProtocol {

}
