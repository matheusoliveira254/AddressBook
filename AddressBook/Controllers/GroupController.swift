//
//  GroupController.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import Foundation

class GroupController {
    //MARK: - Single source of truth
    static let sharedInstance = GroupController()
    
    //MARK: - Source of truth
    var groups: [Group] = []
    
    //MARK: - Initializers
    init() {
        loadContactsFromDisk()
    }
    
    //MARK: - CRUD
    func createGroup(name: String = "Untitled Group", people: [Person] = []) {
        let groupCreated = Group(name: name, people: people)
        groups.append(groupCreated)
        saveContactsToDisk()
    }
    
    func updateGroup(groupToUpdate: Group, newName: String, newPeople: [Person] = []) {
        groupToUpdate.name = newName
        groupToUpdate.people = newPeople
        saveContactsToDisk()
    }
    
    func deleteGroup(groupToBeDeleted: Group) {
        guard let indexOfGroupToBeDeletd = groups.firstIndex(of: groupToBeDeleted) else {return}
        groups.remove(at: indexOfGroupToBeDeletd)
        saveContactsToDisk()
    }
    
    //MARK: - Persistence
    
    func saveContactsToDisk() {
        
    }
    
    func loadContactsFromDisk() {
        
    }
} // End of Class
