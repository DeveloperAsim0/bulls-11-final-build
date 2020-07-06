//
//  BetterluckViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 23/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class BetterluckViewController: UIViewController {

    @IBOutlet weak var betterlucklabel: UILabel!
    @IBOutlet weak var finishbtn: UIButton!
    @IBOutlet weak var myimage: UIImageView!
    
    fileprivate func customBtn() {
        finishbtn.layer.cornerRadius = 5
        finishbtn.layer.borderWidth = 2
        finishbtn.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       myimage.layer.cornerRadius = myimage.frame.size.width / 2
       myimage.clipsToBounds = true
       customBtn()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
