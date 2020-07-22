//
//  AddCashViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit


class AddCashViewController: UIViewController {
  
    @IBOutlet weak var myview       : UIView!
    @IBOutlet weak var firstBtn     : UIButton!
    @IBOutlet weak var secondBtn    : UIButton!
    @IBOutlet weak var thirdBtn     : UIButton!
    @IBOutlet weak var cashfield    : UITextField!
    
    fileprivate func CustomizeView(){
        myview.layer.shadowColor = UIColor.gray.cgColor
        myview.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        myview.layer.shadowOpacity = 0.5
        myview.layer.shadowRadius = 2.0
       // myview.layer.cornerRadius = cornerRadius
        myview.layer.masksToBounds = false
    }
    
    fileprivate func CustomizeButton(){
        cashfield.layer.borderColor = UIColor.lightGray.cgColor
        cashfield.layer.borderWidth = 1
        cashfield.layer.masksToBounds = true
        
        firstBtn.layer.borderColor = UIColor.lightGray.cgColor
        firstBtn.layer.borderWidth = 1
       // myview.layer.cornerRadius = cornerRadius
        firstBtn.layer.masksToBounds = true
        
        secondBtn.layer.borderColor = UIColor.lightGray.cgColor
        secondBtn.layer.borderWidth = 1
        // myview.layer.cornerRadius = cornerRadius
         secondBtn.layer.masksToBounds = true
        
        thirdBtn.layer.borderColor = UIColor.lightGray.cgColor
        thirdBtn.layer.borderWidth = 1
        // myview.layer.cornerRadius = cornerRadius
         thirdBtn.layer.masksToBounds = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""

        title = "Add Cash"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
         CustomizeButton()
         CustomizeView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setcashValue1(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "₹" + "100"
    }
    
    @IBAction func setcashValue2(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "₹" + "200"
    }

    @IBAction func setcashValue3(_ sender: Any) {
        self.cashfield.text = nil
        self.cashfield.text = "₹" + "500"
    }
    
    @IBAction func addCashRedirect(_ sender: Any){
        
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
