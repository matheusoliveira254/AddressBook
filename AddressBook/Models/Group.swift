//
//  Group.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import Foundation

class Group: Codable {
    
    let id: UUID
    var name: String
    var people: [Person]
    
    init(id: UUID = UUID(), name: String, people: [Person] = []) {
        self.id = id
        self.name = name
        self.people = people
    }
}

//Adopt and conform to the Equatable Protocol
extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.people == rhs.people
    }
}
