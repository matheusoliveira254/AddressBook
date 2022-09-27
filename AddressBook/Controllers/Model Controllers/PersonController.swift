//
//  PersonController.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import Foundation

class PersonController {
    //MARK: - CRUD
    
    static func create(name: String = "New Contact", address: String = "", group: Group) {
        let createdPerson = Person(name: name, address: address)
        group.people.append(createdPerson)
        GroupController.sharedInstance.saveContactsToDisk()
    }
    
    static func update(personToUpdate: Person, newName: String, newAddress: String) {
        personToUpdate.name = newName
        personToUpdate.address = newAddress
        GroupController.sharedInstance.saveContactsToDisk()
    }
    
    static func delete(personToDelete: Person, group: Group) {
        guard let indexOfPersonToBeDeleted = group.people.firstIndex(of: personToDelete) else {return}
        group.people.remove(at: indexOfPersonToBeDeleted)
        GroupController.sharedInstance.saveContactsToDisk()
    }
} // End of class
