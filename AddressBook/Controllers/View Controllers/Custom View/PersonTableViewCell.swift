//
//  PersonTableViewCell.swift
//  AddressBook
//
//  Created by Matheus Oliveira on 9/28/22.
//

import UIKit

protocol PersonTableViewCellDelegate: AnyObject {
    func toggleFavoriteButtonWasTapped(cell: PersonTableViewCell)
}

class PersonTableViewCell: UITableViewCell {
//MARK: - IBOutlets
    @IBOutlet weak var customCellNameLabel: UILabel!
    @IBOutlet weak var customCellFavoriteButton: UIButton!

    //MARK: - Property
    weak var delegate: PersonTableViewCellDelegate?
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Methods
    func updateViews() {
        guard let person = person else {return}
        customCellNameLabel.text = person.name
        let favoriteImageName = person.isFavorite ? "star.fill" : "star"
        let favoriteImage = UIImage(systemName: favoriteImageName)
        customCellFavoriteButton.setImage(favoriteImage, for: .normal)
    }

    @IBAction func toggleFavoriteButtonWasTapped(_ sender: UIButton) {
        delegate?.toggleFavoriteButtonWasTapped(cell: self)
    }
}
