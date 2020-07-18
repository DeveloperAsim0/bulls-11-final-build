//
//  letsplayViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class letsplayViewController: UIViewController {

    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var createview: UIView!
    @IBOutlet weak var joinview: UIView!
    
    @IBOutlet weak var blackview: UIButton!
    @IBOutlet weak var pinkview: UIButton!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var thirdview: UIView!
    @IBOutlet weak var fourthview: UIView!
    
    // for particular buttons not using tableview for sorting the data
    @IBOutlet weak var firstfeeBtn: UIButton!
    @IBOutlet weak var secondfeeBtn: UIButton!
    @IBOutlet weak var thirdfeeBtn: UIButton!
    @IBOutlet weak var fourthfeeBtn: UIButton!
    
    @IBOutlet weak var firstprizeLbl1:UIButton!
    @IBOutlet weak var prittykitLbl1: UIButton!
    @IBOutlet weak var totalprizeLbl1:UIButton!
    
    @IBOutlet weak var firstprizeLbl2:UIButton!
    @IBOutlet weak var prittykitLbl2: UIButton!
    @IBOutlet weak var totalprizeLbl2:UIButton!
    
    @IBOutlet weak var firstprizeLbl3:UIButton!
    @IBOutlet weak var prittykitLbl3: UIButton!
    @IBOutlet weak var totalprizeLbl3:UIButton!
    
    @IBOutlet weak var firstprizeLbl4:UIButton!
    @IBOutlet weak var prittykitLbl4: UIButton!
    @IBOutlet weak var totalprizeLbl4:UIButton!
    
    var saveFees = [String]()
    var savefirstprize = [String]()
    var saveprittykit = [String]()
    var savetotalprize = [String]()
    var updated = [String]()
    var userIDMerge = [String]()
    var specialplayer = [String]()
    var selection = "paid"
    var currency = String()
    var userid = KeychainWrapper.standard.string(forKey: "userID")
    
    fileprivate func CustomizeView() {
        selectView.layer.cornerRadius = selectView.frame.size.width/2
        selectView.layer.borderColor = UIColor.white.cgColor
        selectView.layer.borderWidth = 1.5
        selectView.clipsToBounds = true
        
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor = UIColor.white.cgColor
        createview.layer.borderWidth = 1.5
        createview.clipsToBounds = true
        
        joinview.layer.cornerRadius = joinview.frame.size.width/2
        joinview.backgroundColor = .white
        joinview.clipsToBounds = true
        
        
        firstView.layer.cornerRadius = 5
        firstView.layer.shadowOffset = CGSize(width: 0, height: 3)
        firstView.layer.shadowOpacity = 0.6
        firstView.layer.shadowRadius = 3.0
        firstView.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        secondview.layer.cornerRadius = 5
        secondview.layer.shadowOffset = CGSize(width: 0, height: 3)
        secondview.layer.shadowOpacity = 0.6
        secondview.layer.shadowRadius = 3.0
        secondview.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        thirdview.layer.cornerRadius = 5
        thirdview.layer.shadowOffset = CGSize(width: 0, height: 3)
        thirdview.layer.shadowOpacity = 0.6
        thirdview.layer.shadowRadius = 3.0
        thirdview.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        fourthview.layer.cornerRadius = 5
        fourthview.layer.shadowOffset = CGSize(width: 0, height: 3)
        fourthview.layer.shadowOpacity = 0.6
        fourthview.layer.shadowRadius = 3.0
        fourthview.layer.shadowColor = UIColor.lightGray.cgColor
    }
    
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/game-price-details"
    let Api_Key = "BULLS11@2020"
    
    func get_Details() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Profile_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                    print(response.result)
                    let result = try? JSON(data: response.data!)
                    let sult = result!.dictionaryValue
//                    self.saveFees.append(fees)
                    print("fees:- \(sult["data"]!.arrayValue)")
                    let data = sult["data"]!.arrayValue
                    self.saveFees.removeAll()
                    self.savetotalprize.removeAll()
                    self.saveprittykit.removeAll()
                    self.savefirstprize.removeAll()
                    for i in data {
                        let fees = i["fee"].stringValue
                        self.saveFees.append(fees)
                        let firstprize = i["first_price"].stringValue
                        self.savefirstprize.append(firstprize)
                        let prittykit = i["price_kitty"].stringValue
                        self.saveprittykit.append(prittykit)
//                        let totalprize = i["total_slots"].stringValue
//                        self.savetotalprize.append(totalprize)
                    }
                    // for btn
                    self.firstfeeBtn.titleLabel?.text = "Fee - ₹" + self.saveFees[0]
                    self.secondfeeBtn.titleLabel?.text = "Fee - ₹" + self.saveFees[1]
                    self.thirdfeeBtn.titleLabel?.text = "Fee - ₹" + self.saveFees[2]
                    self.fourthfeeBtn.titleLabel?.text = "Fee - ₹" + self.saveFees[3]
                    
                    // for lbls
                    self.prittykitLbl1.titleLabel?.text = "Price Kitty -" + self.saveprittykit[0]
                    self.prittykitLbl2.titleLabel?.text = "Price Kitty -" + self.saveprittykit[1]
                    self.prittykitLbl3.titleLabel?.text = "Price Kitty -" + self.saveprittykit[2]
                    self.prittykitLbl4.titleLabel?.text = "Price Kitty -" + self.saveprittykit[3]

//                    self.totalprizeLbl1.titleLabel?.text = "Total Slots -" + model.totalSlots[0]
//                    self.totalprizeLbl2.titleLabel?.text = "Total Slots -" + model.totalSlots[1]
//                    self.totalprizeLbl3.titleLabel?.text = "Total Slots -" + model.totalSlots[2]
//                    self.totalprizeLbl4.titleLabel?.text = "Total Slots -" + model.totalSlots[3]

                    self.firstprizeLbl1.titleLabel?.text = "1st Prize -" + self.savefirstprize[0]
                    self.firstprizeLbl2.titleLabel?.text = "1st Prize -" + self.savefirstprize[1]
                    self.firstprizeLbl3.titleLabel?.text = "1st Prize -" + self.savefirstprize[2]
                    self.firstprizeLbl4.titleLabel?.text = "1st Prize -" + self.savefirstprize[3]
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    func Send_Details() {
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
        let parameter = [
            "user_id": userid!,
            "paid_unpaid": selection,
            "amount_type": currency,
            "amount": "100",
            "c_id": userIDMerge,
            "captain": semiFinalBatsmanModel.Captains,
            "sp_player": specialplayer,
            "contest_id": model.actualDateID
            ] as [String : Any]
            print("params:- \(parameter)")
            AF.request("http://projectstatus.co.in/Bulls11/api/authentication/create-team", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                       switch response.result {
                       case .success:
                        print(response.result)
                        let result = try? JSON(data: response.data!)
                       print("result:- \(result)")
                        break
                       case .failure:
                        print(response.error?.errorDescription)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeView()
        get_Details()
        self.userIDMerge = savedBatsmanTeams.CompanyID + savedBowlerTeams.CompanyID + savedWicketKeeperTeams.CompanyID
        self.specialplayer = semiFinalWicketModel.starplayer + semiFinalBowlerModel.starplayer + semiFinalBatsmanModel.starplayer
       print("updated:- \(semiFinalBatsmanModel.Captains)")
      
       print("allusers:- \(userIDMerge)")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func paid(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
            self.selection = "paid"
            self.currency = "coin"
        }
    }
    
    @IBAction func unpaid(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
               } else {
                   sender.isSelected = true
                   self.selection = "unpaid"
            self.currency = "points"
               }
    }
    
    @IBAction func LetsPlay(_ sender: Any) {
        Send_Details()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }

}
