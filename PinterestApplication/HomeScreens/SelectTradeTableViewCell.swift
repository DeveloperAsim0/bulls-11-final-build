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
    @IBOutlet weak var totalPrize : UILabel!
    @IBOutlet weak var PaidUsers  : UILabel!
    @IBOutlet weak var freeUsers  : UILabel!
    @IBOutlet weak var totalSlots : UILabel!
    
    
    
    // for timer
    var ActualTimer = String()
     var timer: Timer?
     var totalTime = 120
     
     private func startOtpTimer() {
        
        let xyz = ActualTimer.secondFromString
        self.totalTime = xyz
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }

    @objc func updateTimer() {
            print(self.totalTime)
            self.timeLabel.text = self.timeFormatted(self.totalTime) // will show timer
            if totalTime != 0 {
                totalTime -= 1  // decrease counter timer
            } else {
                if let timer = self.timer {
                    timer.invalidate()
                    self.timer = nil
                }
            }
        }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //startOtpTimer()
        myview.layer.cornerRadius = 7
        myview.layer.borderColor  = UIColor.black.cgColor
        myview.layer.borderWidth  = 0.15
        myview.clipsToBounds      = true
    }

}

extension String{

    var integer: Int {
        return Int(self) ?? 0
    }

    var secondFromString : Int{
        var components: Array = self.components(separatedBy: ":")
        let hours = components[0].integer
        let minutes = components[1].integer
        let seconds = components[2].integer
        return Int((hours * 60 * 60) + (minutes * 60) + seconds)
    }
}
