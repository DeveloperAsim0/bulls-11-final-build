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
    
    var releaseDate: Date?
    
//    @objc func countDownDate() {
//        let date = Date()
//        let calendar = Calendar.current
//        let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: date, to: releaseDate!)
//        let countdown = "Days \(String(describing: diffDateComponents.day!)),  Hours: \(String(describing: diffDateComponents.hour!)), Minutes: \(String(describing: diffDateComponents.minute!)), Seconds: \(String(describing: diffDateComponents.second!))"
//        print(countdown)
//        self.timeLabel.text = countdown
//        print("mytime:- \(self.timeLabel.text)")
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//       let releaseDateFormatter = DateFormatter()
//        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let releaseDateString = "2018-09-16 08:00:00"
//        releaseDate = releaseDateFormatter.date(from:releaseDateString)!
//        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDownDate), userInfo: nil, repeats: true)
        myview.layer.cornerRadius = 7
        myview.layer.borderColor  = UIColor.black.cgColor
        myview.layer.borderWidth  = 0.15
        myview.clipsToBounds      = true
    }

}
