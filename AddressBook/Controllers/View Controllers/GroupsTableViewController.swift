//
//  GroupsTableViewController.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/26/22.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return GroupController.sharedInstance.groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupNameCell", for: indexPath)
        let group = GroupController.sharedInstance.groups[indexPath.row]
        cell.textLabel?.text = group.name
        cell.detailTextLabel?.text = "\(group.people.count) People"
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let group = GroupController.sharedInstance.groups[indexPath.row]
            GroupController.sharedInstance.deleteGroup(groupToBeDeleted: group)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //MARK: - IIDOO
        if segue.identifier == "toGroupDetailScreen" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PeopleTableViewController {
                    let groupToSend = GroupController.sharedInstance.groups[index.row]
                    destination.groupReceiver = groupToSend
                }
            }
        }
    }
    
    @IBAction func addGroupButtonTapped(_ sender: UIBarButtonItem) {
        GroupController.sharedInstance.createGroup()
        tableView.reloadData()
    }
}
