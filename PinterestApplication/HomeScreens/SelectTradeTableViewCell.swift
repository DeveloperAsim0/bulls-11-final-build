//
//  SelectTradeTableViewCell.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class SelectTradeTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLabel  : UILabel!
    @IBOutlet weak var DetailLabel: UILabel!
    @IBOutlet weak var timeLabel  : UILabel!
    @IBOutlet weak var myview     : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myview.layer.cornerRadius = 7
        myview.layer.borderColor  = UIColor.black.cgColor
        myview.layer.borderWidth  = 0.15
        myview.clipsToBounds      = true
    }

}
