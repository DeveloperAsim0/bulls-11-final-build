//
//  MyProfileViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var firstView    : UIView!
    @IBOutlet weak var secondView   : UIView!
    @IBOutlet weak var thirdView    : UIView!
    @IBOutlet weak var shareBtn     : UIButton!
    @IBOutlet weak var bullspointvalue: UILabel!
    
    let cornerRadius: CGFloat = 3.0
    
    fileprivate func CustomizeView() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        firstView.layer.shadowColor     = UIColor.gray.cgColor
        firstView.layer.shadowOffset    = CGSize(width: 0, height: 1.0)
        firstView.layer.shadowOpacity   = 0.5
        firstView.layer.shadowRadius    = 2.0
        firstView.layer.cornerRadius    = cornerRadius
        firstView.layer.masksToBounds   = false
        
        secondView.layer.shadowColor    = UIColor.lightGray.cgColor
        secondView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        secondView.layer.shadowOpacity  = 0.5
        secondView.layer.shadowRadius   = 1.0
       // secondView.layer.cornerRadius = cornerRadius
        secondView.layer.masksToBounds  = false
        shareBtn.layer.cornerRadius     = cornerRadius
        shareBtn.layer.masksToBounds    = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         CustomizeView()
        if model.bullsPoint != nil {
            self.bullspointvalue.text = model.bullsPoint
        } else {
            self.bullspointvalue.text = "0"
        }
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "My Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)

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
