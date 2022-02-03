//
//  ModelController.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-03.
//

import CoreData

protocol ModelControllerProtocol {
    associatedtype DataType
    var sections: [DataType] { get }
}

class ModelController: ModelControllerProtocol {
    
    private var coreDataManager = CoreDataManager.shared
    
    var sections: [Hands] = []
    
    var didUpdateData: Bool = false {
        didSet {
             print("*** Did Add Data ***")
        }
    }
    
    func deleteItem() {
        let sectionCount = sections.count
        guard sectionCount > 0, sections[sectionCount - 1].data.count > 0 else { return }
        let hand = sections[sectionCount - 1].data.removeLast()
        coreDataManager.persistentContainer.viewContext.delete(hand)
        coreDataManager.saveContext()
        didUpdateData = false
    }
    
    func createItem() {
        let context = coreDataManager.persistentContainer.viewContext
        let hand = Hand(context: context)
        hand.title = String(Int.random(in: 0...100))
        coreDataManager.saveContext()
        sections[sections.count - 1].data.append(hand)
        didUpdateData = false
    }
    
    func fetchData()  {
        let context = coreDataManager.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest = Hand.fetchRequest()
        
        let sortDescriptorCreationDate = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptorCreationDate]
        
        var hands: [Hands]?
        
        do {
            let fetchObjects = try context.fetch(fetchRequest)
            hands = [Hands(data: fetchObjects)]
        } catch {
            fatalError("Error fetching hands ")
        }
        sections = hands ?? []
    }
}
