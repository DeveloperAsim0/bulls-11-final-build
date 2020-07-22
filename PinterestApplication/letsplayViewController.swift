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
    @IBOutlet weak var pointsview: UIView!
    @IBOutlet weak var unpaidView: UIView!
    @IBOutlet weak var pointslbl: UILabel!
    @IBOutlet weak var butt : UIButton!
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    
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
    @IBOutlet weak var priceKittylbl1: UILabel!
    @IBOutlet weak var totalprizeLbl1:UIButton!
    
    @IBOutlet weak var firstprizeLbl2:UIButton!
    @IBOutlet weak var priceKittylbl2: UILabel!
    @IBOutlet weak var totalprizeLbl2:UIButton!
    
    @IBOutlet weak var firstprizeLbl3:UIButton!
    @IBOutlet weak var priceKittylbl13: UILabel!
    @IBOutlet weak var totalprizeLbl3:UIButton!
    
    @IBOutlet weak var firstprizeLbl4:UIButton!
    @IBOutlet weak var priceKittylbl14: UILabel!
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
    var currencyType = "coins"
    var userid = KeychainWrapper.standard.string(forKey: "userID")
    
    fileprivate func CustomizeView() {
        pointsview.layer.cornerRadius = 7
        pointsview.layer.borderColor = UIColor(red: 212/255, green: 71/255, blue: 141/255, alpha: 1.0).cgColor
        pointsview.layer.borderWidth = 1.3
        pointsview.clipsToBounds = true
        
        pointsview.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.40).cgColor
        pointsview.layer.shadowOffset = CGSize(width: 0, height: 3)
        pointsview.layer.shadowOpacity = 1.0
        pointsview.layer.shadowRadius = 7.0
        pointsview.layer.masksToBounds = false
        
        butt.layer.cornerRadius = 5
        
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 10
        
        lbl2.layer.masksToBounds = true
        lbl2.layer.cornerRadius = 10
        
        lbl3.layer.masksToBounds = true
        lbl3.layer.cornerRadius = 10
        
        lbl4.layer.masksToBounds = true
        lbl4.layer.cornerRadius = 10
        
        priceKittylbl1.layer.masksToBounds = true
        priceKittylbl1.layer.cornerRadius = 10
        
        priceKittylbl2.layer.masksToBounds = true
        priceKittylbl2.layer.cornerRadius = 10
        
        priceKittylbl13.layer.masksToBounds = true
        priceKittylbl13.layer.cornerRadius = 10
        
        priceKittylbl14.layer.masksToBounds = true
        priceKittylbl14.layer.cornerRadius = 10
        
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
                    self.lbl.text = "Fee - ₹" + self.saveFees[0]
                    self.lbl2.text = "Fee - ₹" + self.saveFees[1]
                    self.lbl3.text = "Fee - ₹" + self.saveFees[2]
                    self.lbl4.text = "Fee - ₹" + self.saveFees[3]
                    
                    // for lbls
                    self.priceKittylbl1.text = "Price Kitty -" + self.saveprittykit[0]
                    self.priceKittylbl2.text = "Price Kitty -" + self.saveprittykit[1]
                    self.priceKittylbl13.text = "Price Kitty -" + self.saveprittykit[2]
                    self.priceKittylbl14.text = "Price Kitty -" + self.saveprittykit[3]

                    self.totalprizeLbl1.titleLabel?.text = "Total Slots -" + model.totalSlots[0]
                    self.totalprizeLbl2.titleLabel?.text = "Total Slots -" + model.totalSlots[1]
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
            "amount_type": currencyType,
            "amount": currency,
            "c_id": userIDMerge,
            "captain": finalModel.Captain,
            "sp_player": finalModel.starPlayer,
            "contest_id": model.actualDateID
            
            ] as [String : Any]
            print("params:- \(parameter)")
            AF.request("http://projectstatus.co.in/Bulls11/api/authentication/create-team", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                       switch response.result {
                       case .success:
                        print(response.result)
                        let result = try? JSON(data: response.data!)
                        print("result:- \(String(describing: result))")
                        break
                       case .failure:
                        print(response.error?.errorDescription)
                }
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unpaidView.isHidden = true
        self.pinkview.isSelected = true
        CustomizeView()
        get_Details()
        self.userIDMerge = savedBatsmanTeams.CompanyID + savedBowlerTeams.CompanyID + savedWicketKeeperTeams.CompanyID
       print("updated:- \(semiFinalBatsmanModel.Captains)")
        print("totalslotsvalue:- \(model.totalSlots[0])")
       print("allusers:- \(userIDMerge)")
       print("usersid:- \(String(describing: userid))")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func paid(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            blackview.isSelected = false
        } else {
            sender.isSelected = true
            blackview.isSelected = false
            self.unpaidView.isHidden = true
            self.currencyType = "coins"
        //    self.unpaidView.isHidden = false
            self.firstView.isHidden = false
            self.secondview.isHidden = false
            self.thirdview.isHidden = false
            self.fourthview.isHidden = false
            self.selection = "paid"
            self.currency = "coin"
        }
    }
    
    @IBAction func unpaid(_ sender: UIButton) {
        if sender.isSelected {
                   sender.isSelected = false
            pinkview.isSelected = false
               } else {
            sender.isSelected = true
            self.currencyType = "points"
            pinkview.isSelected = false
            self.unpaidView.isHidden = false
            self.firstView.isHidden = true
            self.secondview.isHidden = true
            self.thirdview.isHidden = true
            self.fourthview.isHidden = true
            self.selection = "unpaid"
            self.currency = "points"
       }
    }
    
    @IBAction func pointsBtn(_ sender: Any){
        self.currency = "100"
        print("pointcurrency:-\(self.currency)")
    }
    
    @IBAction func firstBtn(_ sender: Any){
        self.currency = "10"
        print("currenct1-\(self.currency)")
    }
    
    @IBAction func secondBtn(_ sender: Any){
        self.currency = "50"
        print("currenct2-\(self.currency)")
    }
    
    @IBAction func thirdBtn(_ sender: Any){
        self.currency = "100"
        print("currenct3-\(self.currency)")
    }
    
    @IBAction func fourthBtn(_ sender: Any){
        self.currency = "500"
        print("currenct4-\(self.currency)")
    }
    
    @IBAction func LetsPlay(_ sender: Any) {
        Send_Details()
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true, completion: nil)
    }

}
