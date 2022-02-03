//
//  Hands.swift
//  GenericDataSource
//
//  Created by Jonni Akesson on 2022-02-03.
//

import Foundation

protocol ModelProtocol: Hashable {
    var uuid: UUID { get }
    static func == (lhs: Self, rhs: Self) -> Bool
    func hash(into hasher: inout Hasher)
}

extension ModelProtocol {
    var uuid: UUID {
        UUID()
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

protocol SectionProtocol: ModelProtocol { }

class Hands: SectionProtocol {
    var data: [Hand]
    
    init(data: [Hand]) {
        self.data = data
    }
}
