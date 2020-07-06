//
//  MYBalanceViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MYBalanceViewController: UIViewController {

    @IBOutlet weak var firstView            : UIView!
    @IBOutlet weak var recentTransaction    : UIButton!
    @IBOutlet weak var managePayments       : UIView!
    @IBOutlet weak var verifyBTN            : UIButton!
    @IBOutlet weak var addCashBTN           : UIButton!
    
    let cornerRadius: CGFloat = 6.0
    
    fileprivate func CustomNavBar(){
        title = "My Balance"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)
    }
    
    fileprivate func CustomizeUIVIEW() {
        firstView.layer.shadowColor     = UIColor.gray.cgColor
        firstView.layer.shadowOffset    = CGSize(width: 0, height: 1.0)
        firstView.layer.shadowOpacity   = 0.5
        firstView.layer.shadowRadius    = 2.0
        firstView.layer.cornerRadius    = cornerRadius
        firstView.layer.masksToBounds   = false
        
        recentTransaction.layer.shadowColor     = UIColor.gray.cgColor
        recentTransaction.layer.shadowOffset    = CGSize(width: 0, height: 1.0)
        recentTransaction.layer.shadowOpacity   = 0.5
        recentTransaction.layer.shadowRadius    = 2.0
        recentTransaction.layer.cornerRadius    = cornerRadius
        recentTransaction.layer.masksToBounds   = false
        
        
        managePayments.layer.shadowColor    = UIColor.gray.cgColor
        managePayments.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        managePayments.layer.shadowOpacity  = 0.5
        managePayments.layer.shadowRadius   = 2.0
        managePayments.layer.cornerRadius   = cornerRadius
        managePayments.layer.masksToBounds  = false
    }
    
    fileprivate func CustomizeUIBUTTON() {
        verifyBTN.layer.cornerRadius    = 5
        verifyBTN.layer.borderColor     = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1).cgColor
        verifyBTN.layer.borderWidth     = 1.4
        verifyBTN.layer.masksToBounds   = true
        
        addCashBTN.layer.cornerRadius   = 5
        addCashBTN.layer.borderColor    = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1).cgColor
        addCashBTN.layer.borderWidth    = 1.4
        addCashBTN.layer.masksToBounds  = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = ""
        CustomizeUIVIEW()
        CustomizeUIBUTTON()
        CustomNavBar()
    }
    
    @IBAction func addCash(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash")
        vc.modalPresentationStyle = .fullScreen
        //vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension UIView {
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    self.layer.mask = mask
  }
}
