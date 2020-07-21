//
//  UnpaidViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 20/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class UnpaidViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mybutton: UIButton!
    @IBOutlet weak var pointlbl: UILabel!
    @IBOutlet weak var fixedpoint: UILabel!
    
    fileprivate func customizeView() {
        myView.layer.cornerRadius = 7
        myView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        myView.layer.borderWidth = 1.3
        myView.clipsToBounds = true
        
        mybutton.layer.cornerRadius = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
