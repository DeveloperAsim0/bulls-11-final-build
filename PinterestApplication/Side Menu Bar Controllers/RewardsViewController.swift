//
//  RewardsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class RewardsViewController: UIViewController {

    @IBOutlet weak var myview       : UIView!
    @IBOutlet weak var secondView   : UIView!
    
    fileprivate func CustomizeView(){
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        myview.layer.shadowColor    = UIColor.gray.cgColor
        myview.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        myview.layer.shadowOpacity  = 0.5
        myview.layer.shadowRadius   = 2.0
       // myview.layer.cornerRadius = cornerRadius
        myview.layer.masksToBounds  = false
        
         secondView.layer.shadowColor   = UIColor.gray.cgColor
         secondView.layer.shadowOffset  = CGSize(width: 0, height: 1.0)
         secondView.layer.shadowOpacity = 0.5
         secondView.layer.shadowRadius  = 2.0
        // myview.layer.cornerRadius = cornerRadius
         secondView.layer.masksToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        title = "Rewards"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
         CustomizeView()
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
