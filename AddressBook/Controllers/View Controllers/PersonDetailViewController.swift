//
//  PersonDetailViewController.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/27/22.
//

import UIKit

class PersonDetailViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var personAddressTextField: UITextField!
    @IBOutlet weak var favoriteBarButtonItem: UIBarButtonItem!
    
    
    //MARK: - Receiver
    var personReceiver: Person?
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    //MARK: - Methods
    func updateViews() {
        guard let person = personReceiver else {return}
        personNameTextField.text = person.name
        personAddressTextField.text = person.address
    }
    
    func updateFavoriteButton() {
        guard let personReceiver = personReceiver else {return}
        let favoriteImageName = personReceiver.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        favoriteBarButtonItem.image = favoriteImage

    }
    
    //MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let person = personReceiver,
              let name = personNameTextField.text,
              let address = personAddressTextField.text else {return}
        PersonController.update(personToUpdate: person, newName: name, newAddress: address)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func favoriteBarButtonItemTapped(_ sender: UIBarButtonItem) {
        guard let personReceiver = personReceiver else {return}
        PersonController.toggleIsFavorite(contact: personReceiver)
        updateFavoriteButton()
    }
}
