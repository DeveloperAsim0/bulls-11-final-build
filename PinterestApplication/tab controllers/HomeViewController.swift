//
//  HomeViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import SDWebImage
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    //Home controller outlets:
    @IBOutlet weak var selectview: UIView!
    @IBOutlet weak var createview: UIView!
    @IBOutlet weak var joinview: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var sidemenuview: UIView!
    @IBOutlet weak var profilePic: UIImageView!
    
    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var firstinheritview: UIView!
    @IBOutlet weak var secondinheritview: UIView!
    @IBOutlet weak var thirdinheritview: UIView!
    
    //Next button outlet:
    @IBOutlet weak var Daily: UIButton!
    @IBOutlet weak var Weekly: UIButton!
    @IBOutlet weak var Quiz: UIButton!
    
    //Side Menu outlet:
    @IBOutlet weak var UserName: UILabel!
    
    var sideMenu4 = false
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    let Api_Key = "BULLS11@2020"
    var namearr = ["My Profile", "Weekly Leaderboard", "Hall of Fame", "My Balance", "My Rewards & Offer", "My Refferals", "Point Systems", "Logout"]
    
    var iconArr = ["myprofile", "my_contest_icon", "hall_of_fame", "mybalance", "myrewardsoffers", "myreferrals", "myinfosettings", "logout"]
    
    fileprivate func CustomNavBar(){
        title = "HOME"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    fileprivate func CustomizeViews(){
        
        self.profilePic.layer.cornerRadius = self.profilePic.frame.size.width/2
        
        sidemenuview.layer.borderColor = UIColor.darkGray.cgColor
        sidemenuview.layer.borderWidth = 1
        sidemenuview.layer.masksToBounds = true
        
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.clipsToBounds = true
        
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor = UIColor.white.cgColor
        createview.layer.borderWidth = 1.5
        createview.clipsToBounds = true
        
        joinview.layer.cornerRadius = joinview.frame.size.width/2
        joinview.layer.borderColor = UIColor.white.cgColor
        joinview.layer.borderWidth = 1.5
        joinview.clipsToBounds = true
        
        firstView.layer.cornerRadius = 7
        firstView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        firstView.layer.borderWidth = 1.3
        firstView.clipsToBounds = true
        
        firstView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 1.0
        firstView.layer.shadowRadius = 7.0
        firstView.layer.masksToBounds = false
        
        secondView.layer.cornerRadius = 7
        secondView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        secondView.layer.borderWidth = 1.3
        secondView.clipsToBounds = true
        
        secondView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        secondView.layer.shadowOffset = CGSize(width: 0, height: 3)
        secondView.layer.shadowOpacity = 1.0
        secondView.layer.shadowRadius = 7.0
        secondView.layer.masksToBounds = false
        
        thirdView.layer.cornerRadius = 7
        thirdView.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        thirdView.layer.borderWidth = 1.3
        thirdView.clipsToBounds = true
        
        thirdView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        thirdView.layer.shadowOffset = CGSize(width: 0, height: 3)
        thirdView.layer.shadowOpacity = 1.0
        thirdView.layer.shadowRadius = 7.0
        thirdView.layer.masksToBounds = false
        
        firstinheritview.layer.cornerRadius = 7
        firstinheritview.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        firstinheritview.layer.borderWidth = 1.3
        firstinheritview.clipsToBounds = true
        
        secondinheritview.layer.cornerRadius = 7
        secondinheritview.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        secondinheritview.layer.borderWidth = 1.3
        secondinheritview.clipsToBounds = true
        
        thirdinheritview.layer.cornerRadius = 7
        thirdinheritview.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        thirdinheritview.layer.borderWidth = 1.3
        thirdinheritview.clipsToBounds = true
    }
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON{ response in
            switch response.result {
                   case .success:
                    print("ok:-\(response.result)")
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                    print("firstname:- \(finalResult["first_name"]!.stringValue)")
                    let fullname = finalResult["first_name"]!.stringValue + finalResult["last_name"]!.stringValue
                    self.UserName.text = fullname
                    let profilepic = finalResult["profile_pic"]?.stringValue
                    self.profilePic.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fetch_Profile()
        //self.navigationController?.navigationBar.topItem?.title = "HOME"
        CustomNavBar()
        CustomizeViews()
        savedBatsmanTeams.CompanyName.removeAll()
        savedBatsmanTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyID.removeAll()
       // KeychainWrapper.standard.removeObject(forKey: "DateSaved")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.navigationItem.title="HOME"
        savedBatsmanTeams.CompanyName.removeAll()
        savedBatsmanTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyID.removeAll()
        savedBowlerTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyName.removeAll()
        savedWicketKeeperTeams.CompanyID.removeAll()
    }
    
    @IBAction func DailyBtnSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "trade") as! SelectYourTradeViewController
        vc.modalPresentationStyle = .fullScreen
        vc.Date_URL = "http://projectstatus.co.in/Bulls11/api/authentication/date-list"
        vc.NextApiUrl = "http://projectstatus.co.in/Bulls11/api/authentication/choose-player"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func WeeklyBtnSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let vc = storyboard.instantiateViewController(withIdentifier: "trade") as! SelectYourTradeViewController
               vc.modalPresentationStyle = .fullScreen
        vc.Date_URL = "http://projectstatus.co.in/Bulls11/api/authentication/weekly-date-list"
        vc.NextApiUrl = "http://projectstatus.co.in/Bulls11/api/authentication/list-weekwise-compnaies"
               self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func QuizBtnSegue(_ sender: Any) {
        let dateFormatter : DateFormatter = DateFormatter()
                   dateFormatter.dateFormat = "yyyy-MM-dd"
                   let date = Date()
                   let dateString = dateFormatter.string(from: date)
                   let interval = date.timeIntervalSince1970
                   print("mydate:- \(dateString)")
                   print("mytime:-\(interval)")
       let savedDate = KeychainWrapper.standard.string(forKey: "DateSaved")
        print("savedDate:- \(savedDate)")
        if dateString != savedDate {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "contestVC")
        vc.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("nikal yahan se")
        }
    }

    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu4) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                //self.view.backgroundColor = .white
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
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
          UserDefaults.standard.removeObject(forKey: "UserHasSubmittedPassword")
          KeychainWrapper.standard.removeAllKeys()
          print("userid:- \(KeychainWrapper.standard.string(forKey: "userID"))")
          let storyboard = UIStoryboard(name: "Main", bundle: nil)
          let vc = storyboard.instantiateViewController(withIdentifier: "view")
          vc.modalPresentationStyle = .fullScreen
          vc.hidesBottomBarWhenPushed = true
          self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
    
}
