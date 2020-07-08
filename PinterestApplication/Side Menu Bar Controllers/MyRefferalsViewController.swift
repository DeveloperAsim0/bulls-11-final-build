//
//  MyRefferalsViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MyRefferalsViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myRefferalLbl: UILabel!
    let cornerRadius: CGFloat = 6.0
    
    fileprivate func CustomNavBar(){
        title = "My Referrals"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    fileprivate func CustomizeView(){
        myView.layer.shadowColor    = UIColor.gray.cgColor
        myView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        myView.layer.shadowOpacity  = 0.5
        myView.layer.shadowRadius   = 2.0
        myView.layer.cornerRadius   = cornerRadius
        myView.layer.masksToBounds  = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        CustomNavBar()
        CustomizeView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareRefferal(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.myRefferalLbl.text], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        print("hurray !!!!!!")
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
