//
//  PeopleTableViewController.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var groupNameTextField: UITextField!
    
    
    //MARK: - Receiver
    var groupReceiver: Group?

    //MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupNameTextField.text = groupReceiver?.name
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        guard let groupReceiver = groupReceiver,
        let newName = groupNameTextField.text
        else {return}
        GroupController.sharedInstance.updateGroup(groupToUpdate: groupReceiver, newName: newName)
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groupReceiver?.people.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = groupReceiver?.people[indexPath.row]
        cell.textLabel?.text = person?.name
        return cell
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let groupReceiver = groupReceiver else {return}
                  let person = groupReceiver.people[indexPath.row]
                    PersonController.delete(personToDelete: person, group: groupReceiver)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toPersonDetailScreen",
              let personDetailViewController = segue.destination as? PersonDetailViewController,
              let selectedRow = tableView.indexPathForSelectedRow?.row else {return}
        let person = groupReceiver?.people[selectedRow]
        personDetailViewController.personReceiver = person
    }
    
    @IBAction func addPeopleButtonPressed(_ sender: UIBarButtonItem) {
        guard let group = groupReceiver else { return }
        PersonController.create(group: group)
        tableView.reloadData()
    }
}
