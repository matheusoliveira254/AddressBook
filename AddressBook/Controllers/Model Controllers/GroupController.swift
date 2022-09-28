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
    private(set)var groups: [Group] = []
    
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
    
    func updateGroup(groupToUpdate: Group, newName: String) {
        groupToUpdate.name = newName
        saveContactsToDisk()
    }
    
    func deleteGroup(groupToBeDeleted: Group) {
        guard let indexOfGroupToBeDeletd = groups.firstIndex(of: groupToBeDeleted) else {return}
        groups.remove(at: indexOfGroupToBeDeletd)
        saveContactsToDisk()
    }
    
    //MARK: - Persistence
    
    func saveContactsToDisk() {
        //get the address and make sure is not nil
        guard let url = fileURL else {return}
        //convert to swift struct or class into raw data
        do {
            let data = try JSONEncoder().encode(groups)
            // save the data to the address from url
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func loadContactsFromDisk() {
        //make sure file location !=nil and going to the location
        guard let loadLocation = fileURL else {return}
            
        do {
            let data = try Data(contentsOf: loadLocation)
            let decodeData = try JSONDecoder().decode([Group].self, from: data)
            self.groups = decodeData
        } catch let error {
            print(error)
        }
    }
    
    //Computed Property
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        let finalUrl = documentsDirectory.appendingPathComponent("groups.json")
        return finalUrl
    }
} // End of Class
