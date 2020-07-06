//
//  SavedBatsmanTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 29/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class SavedBatsmanTableViewCell: UITableViewCell {

    @IBOutlet weak var batsmanSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       contentView.layer.cornerRadius     = 10
       contentView.layer.borderColor      = UIColor.black.cgColor
       contentView.layer.borderWidth      = 0.15
       contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
                   }
    }
    
}

class SavedBowlerTableViewCell: UITableViewCell {
    @IBOutlet weak var bowlerSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
              contentView.layer.cornerRadius     = 10
              contentView.layer.borderColor      = UIColor.black.cgColor
              contentView.layer.borderWidth      = 0.15
              contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
                   }
    }
}

class SavedWicketkeeperTableViewCell: UITableViewCell {
    @IBOutlet weak var wicketKeeperSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius     = 10
              contentView.layer.borderColor      = UIColor.black.cgColor
              contentView.layer.borderWidth      = 0.15
              contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
                   }
    }
}

class SavedAllRounderTableViewCell: UITableViewCell {
    @IBOutlet weak var allrounderSaved: UILabel!
    @IBOutlet weak var captionButton: UIButton!
    @IBOutlet weak var starPlayerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
              contentView.layer.cornerRadius     = 10
              contentView.layer.borderColor      = UIColor.black.cgColor
              contentView.layer.borderWidth      = 0.15
              contentView.clipsToBounds          = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func captain(_ sender: UIButton) {
        if sender.isSelected {
                    sender.isSelected = false
                } else {
                    sender.isSelected = true
                }
    }
    
    @IBAction func star(_ sender: UIButton) {
           if sender.isSelected {
                       sender.isSelected = false
                   } else {
                       sender.isSelected = true
                   }
    }
}
