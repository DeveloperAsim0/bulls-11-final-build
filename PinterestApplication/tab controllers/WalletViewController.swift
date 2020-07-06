//
//  WalletViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var recentTransaction: UIButton!
    @IBOutlet weak var managePayments: UIView!
    @IBOutlet weak var verifyBTN: UIButton!
    @IBOutlet weak var addCashBTN: UIButton!
    @IBOutlet weak var sidemenuView: UIView!
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    
    let cornerRadius: CGFloat = 6.0
    
    var sideMenu4 = false
    
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "My Info Setting", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "myinfosettings", "pointsystem", "logout"]
    
    fileprivate func CustomizeUIVIEW() {
       sidemenuView.layer.borderColor = UIColor.darkGray.cgColor
       sidemenuView.layer.borderWidth = 1
       sidemenuView.layer.masksToBounds = true
        
        firstView.layer.shadowColor = UIColor.gray.cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        firstView.layer.shadowOpacity = 0.5
        firstView.layer.shadowRadius = 2.0
        firstView.layer.cornerRadius = cornerRadius
        firstView.layer.masksToBounds = false
        
        recentTransaction.layer.shadowColor = UIColor.gray.cgColor
        recentTransaction.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        recentTransaction.layer.shadowOpacity = 0.5
        recentTransaction.layer.shadowRadius = 2.0
        recentTransaction.layer.cornerRadius = cornerRadius
        recentTransaction.layer.masksToBounds = false
        
        
        managePayments.layer.shadowColor = UIColor.gray.cgColor
        managePayments.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        managePayments.layer.shadowOpacity = 0.5
        managePayments.layer.shadowRadius = 2.0
        managePayments.layer.cornerRadius = cornerRadius
        managePayments.layer.masksToBounds = false
    }
    
    fileprivate func CustomizeUIBUTTON() {
        verifyBTN.layer.cornerRadius = 5
        verifyBTN.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1).cgColor
        verifyBTN.layer.borderWidth = 1.4
        verifyBTN.layer.masksToBounds = true
        
        addCashBTN.layer.cornerRadius = 5
        addCashBTN.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1).cgColor
        addCashBTN.layer.borderWidth = 1.4
        addCashBTN.layer.masksToBounds = true
    }
    
    fileprivate func CustomNavBar(){
        title = "WALLET"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNavBar()
        CustomizeUIBUTTON()
        CustomizeUIVIEW()
        CustomNavBar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddCash(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "addcash")
        vc.modalPresentationStyle = .fullScreen
       // vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSideMenu(_ sender: Any) {
     if (sideMenu4) {
               leadingConstraints.constant = -260
               UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                   self.view.layoutIfNeeded()
                  // self.view.backgroundColor = .white
               })
           } else {
               leadingConstraints.constant = 0
               UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                   self.view.layoutIfNeeded()
                  // self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
               })
           }
           
           sideMenu4 = !sideMenu4
    }

}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "more") as! sidemenuCell
        cell.name.text = namearr[indexPath.row]
        cell.icon.image = UIImage(named: iconArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "profileview")
        vc.modalPresentationStyle = .fullScreen
        vc.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "weeklyleaderboard")
            vc.modalPresentationStyle = .fullScreen
                vc.navigationController?.navigationBar.topItem?.title = " "
                self.navigationController?.pushViewController(vc, animated: true)
        
        } else if indexPath.row == 2 {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                 let vc = storyboard.instantiateViewController(withIdentifier: "halloffame")
              vc.modalPresentationStyle = .fullScreen
                 self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 3 {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "balance")
               vc.modalPresentationStyle = .fullScreen
                  self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == 4 {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "rewards")
               vc.modalPresentationStyle = .fullScreen
                  self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else if indexPath.row == 5 {
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
                         let vc = storyboard.instantiateViewController(withIdentifier: "refferal")
                         vc.modalPresentationStyle = .fullScreen
                         self.navigationController?.pushViewController(vc, animated: true)
                  
            
        } else if indexPath.row == 6 {
           
        
        } else if indexPath.row == 7 {
        // controler
        } else if indexPath.row == 8 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                              let vc = storyboard.instantiateViewController(withIdentifier: "view")
                              vc.modalPresentationStyle = .fullScreen
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
                       
            
        }
    }
    
    
    
}
