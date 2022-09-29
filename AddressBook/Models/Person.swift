//
//  Person.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import Foundation

class Person: Codable {
    
    let id: UUID
    var name: String
    var address: String
    var isFavorite: Bool
    
    init(id: UUID = UUID(), name: String, address: String, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.address = address
        self.isFavorite = isFavorite
    }
}

//Adopt and conform to the Equatable Protocol
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.address == rhs.address
    }
}

