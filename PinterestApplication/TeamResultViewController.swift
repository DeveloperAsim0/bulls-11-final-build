//
//  TeamResultViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 22/07/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class TeamResultViewController: UIViewController {

    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView     : UITableView!
    @IBOutlet weak var myusername    : UILabel!
    @IBOutlet weak var mypoints      : UILabel!
    @IBOutlet weak var myentryfee    : UILabel!
    @IBOutlet weak var mycaptain     : UILabel!
    @IBOutlet weak var mystarplayer1 : UILabel!
    @IBOutlet weak var mystarplayer2 : UILabel!
    @IBOutlet weak var mystarplayer3 : UILabel!
    @IBOutlet weak var firstView     : UIView!
    @IBOutlet weak var thirdView     : UIView!
    @IBOutlet weak var middleView    : UIView!
    @IBOutlet weak var rank          : UILabel!
    
    let Api_Key = "BULLS11@2020"
    var d_ID = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        Get_Details()
        customizeView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        Get_Details()
    }
    
    fileprivate func customizeView() {
        firstView.layer.cornerRadius = 7
        firstView.layer.borderColor = UIColor.lightGray.cgColor
        firstView.layer.borderWidth = 1.3
        firstView.clipsToBounds = true
        
        thirdView.layer.cornerRadius = 7
        thirdView.clipsToBounds = true
        
        middleView.layer.cornerRadius = 7
        middleView.clipsToBounds = true
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 1.0
        firstView.layer.shadowRadius = 3.0
        firstView.layer.masksToBounds = false
    }
    
    func Get_Details() {
        let header:HTTPHeaders = [
                   "X-API-KEY": "\(self.Api_Key)"
               ]
               
        let parameters = [
            "contest_id" : d_ID
        ]
               AF.request("https://projectstatus.co.in/Bulls11/api/authentication/my-team", method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                       print(response.result)
                       let myresult = try? JSON(data: response.data!)
                       print(myresult!["data"])
                       let resultArray = myresult!["data"]
                       Result.amount.removeAll()
                       Result.captain.removeAll()
                       Result.starPlayer3.removeAll()
                       Result.starPlayer2.removeAll()
                       Result.starPlayer1.removeAll()
                       Result.user_id.removeAll()
                       Result.amount.removeAll()
                       Result.result.removeAll()
                       Result.team_id.removeAll()
                       Result.rank.removeAll()
                       myPersonalData.captain.removeAll()
                       myPersonalData.myentryfee.removeAll()
                       myPersonalData.mypoints.removeAll()
                       myPersonalData.myuserName.removeAll()
                       myPersonalData.starplay3.removeAll()
                       myPersonalData.starplay2.removeAll()
                       myPersonalData.starplay1.removeAll()
                       myPersonalData.rank.removeAll()
                       for i in resultArray.arrayValue {
                        let userid = i["user_id"].stringValue
                        Result.user_id.append(userid)
                        let savedid = KeychainWrapper.standard.string(forKey: "userID")
                        
                        if userid == savedid {
                            print("myname:- \(i["user_name"])")
                            let myusername = i["user_name"].stringValue
                            myPersonalData.myuserName.append(myusername)
                            let mypoints = i["result"].stringValue
                            myPersonalData.mypoints.append(mypoints)
                            let mycaptain = i["captain"].stringValue
                            myPersonalData.captain.append(mycaptain)
                            let mystarplayer1 = i["star_player1"].stringValue
                            myPersonalData.starplay1.append(mystarplayer1)
                            let mystarplayer2 = i["star_player2"].stringValue
                            myPersonalData.starplay2.append(mystarplayer2)
                            let mystarplayer3 = i["star_player3"].stringValue
                            myPersonalData.starplay3.append(mystarplayer3)
                            let myentryfee = i["amount"].stringValue
                            myPersonalData.myentryfee.append(myentryfee)
                            let rank = i["rank"].stringValue
                            myPersonalData.rank.append(rank)
                            self.topConstraints.constant = 181
                            self.firstView.isHidden = false
                        } else {
                            self.firstView.isHidden = true
                            self.topConstraints.constant = 0
                            let userID = i["team_id"].stringValue
                            Result.team_id.append(userID)
                            let results = i["result"].stringValue
                            Result.result.append(results)
                            let Amount = i["amount"].stringValue
                            Result.amount.append(Amount)
                            let starplayer1 = i["star_player1"].stringValue
                            Result.starPlayer1.append(starplayer1)
                            print("starplayer1:-\(Result.starPlayer1)")
                            let starplayer2 = i["star_player2"].stringValue
                            Result.starPlayer2.append(starplayer2)
                            print("starplayer1:-\(Result.starPlayer2)")
                            let starplayer3 = i["star_player3"].stringValue
                            print("starplayer1:-\(Result.starPlayer3)")
                            Result.starPlayer3.append(starplayer3)
                            let captain = i["captain"].stringValue
                            Result.captain.append(captain)
                            let username = i["user_name"].stringValue
                            Result.userna.append(username)
                            let rank = i["rank"].stringValue
                            Result.rank.append(rank)
                        }
                       }
                       self.myusername.text = myPersonalData.myuserName
                       self.mypoints.text = myPersonalData.mypoints
                       self.myentryfee.text = "₹" + myPersonalData.myentryfee
                       self.mycaptain.text = myPersonalData.captain
                       self.mystarplayer1.text = myPersonalData.starplay1
                       self.mystarplayer2.text = myPersonalData.starplay2
                       self.mystarplayer3.text = myPersonalData.starplay3
                       self.rank.text = "#" + myPersonalData.rank
                       print("mywholedata:- \(myPersonalData.myuserName)")
                       self.tableView.reloadData()
                       break
                   case .failure(let eror):
                       print(eror.errorDescription)
                   }
               }
    }
}

extension TeamResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Result.team_id.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamresultcell")as! teamresultcell
        cell.captain.text   = Result.captain[indexPath.row]
        cell.starplay1.text = Result.starPlayer1[indexPath.row]
        cell.starplay2.text = Result.starPlayer2[indexPath.row]
        cell.starplay3.text = Result.starPlayer3[indexPath.row]
        cell.points.text    = Result.result[indexPath.row]
        cell.entryFee.text  = "₹" + Result.amount[indexPath.row]
        cell.username.text  = Result.userna[indexPath.row]
        cell.rank.text      = "#" + Result.rank[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    
}
