//
//  ContestViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class ContestViewController: UIViewController {

    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var sideMenu: UIView!
    
    var sideMenu2 = false
    let Api_Key = "BULLS11@2020"
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "myinfosettings", "logout"]
    
    fileprivate func CustomNavBar(){
        title = "RESULT"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu.layer.borderColor = UIColor.darkGray.cgColor
        sideMenu.layer.borderWidth = 1
        sideMenu.layer.masksToBounds = true
         Fetch_Data()
         CustomNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Fetch_Data()
    }
    func Fetch_Data() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request("http://projectstatus.co.in/Bulls11/api/authentication/date-list", method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                model.date.removeAll()
                model.dateID.removeAll()
                model.totalSlots.removeAll()
                model.paidUsers.removeAll()
                model.freeUsers.removeAll()
                model.prizeAmount.removeAll()
                for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                    let details = i["small_content"].stringValue
                    model.date_details.append(details)
                    let id = i["d_id"].stringValue
                    print("id:- \(id)")
                    model.dateID.append(id)
                    let date = i["dates"].stringValue
                    model.date.append(date)
                    let prizeAmount = i["prize_amount"].stringValue
                    model.prizeAmount.append(prizeAmount)
                    let paidUsers = i["paid_users"].stringValue
                    model.paidUsers.append(paidUsers)
                    let freeUsers = i["free_users"].stringValue
                    model.freeUsers.append(freeUsers)
                    let totalSlots = i["total_slots"].stringValue
                    model.totalSlots.append(totalSlots)
                }
                self.tableView.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
    }
    
    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu2) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = .white
            })
        } else {
            leadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
            })
        }
        
        sideMenu2 = !sideMenu2
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

extension ContestViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1{
            return UITableView.automaticDimension
        }
        return 120
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return 8
        }else {
        return model.dateID.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1{
            let cell = tableView2.dequeueReusableCell(withIdentifier: "more") as! sidemenuCell
            cell.name.text = namearr[indexPath.row]
            cell.icon.image = UIImage(named: iconArr[indexPath.row])
            return cell
        } else{
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultcontestcell") as! ResultContestTableViewCell
        cell.price_Amount.text = "₹" + model.prizeAmount[indexPath.row]
        cell.price_Kitty.text = model.totalSlots[indexPath.row]
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 1{
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
               UserDefaults.standard.removeObject(forKey: "UserHasSubmittedPassword")
               KeychainWrapper.standard.removeAllKeys()
               print("userid:- \(KeychainWrapper.standard.string(forKey: "userID"))")
               let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                 let vc = storyboard.instantiateViewController(withIdentifier: "view")
                                 vc.modalPresentationStyle = .fullScreen
               vc.hidesBottomBarWhenPushed = true
               self.navigationController?.pushViewController(vc, animated: true)
                 
             }
        } else {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamresult") as! TeamResultViewController
        vc.d_ID = model.dateID[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
