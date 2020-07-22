//
//  ResultContestTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class ResultContestTableViewCell: UITableViewCell {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var middleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        firstView.layer.cornerRadius = 7
        firstView.layer.borderColor = UIColor.lightGray.cgColor
        firstView.layer.borderWidth = 1.3
        firstView.clipsToBounds = true
        
        middleView.layer.cornerRadius = 7
        middleView.clipsToBounds = true
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 1.0
        firstView.layer.shadowRadius = 3.0
        firstView.layer.masksToBounds = false
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
