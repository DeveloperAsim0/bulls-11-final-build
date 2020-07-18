//
//  MyProfileViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftKeychainWrapper
import Alamofire
import SwiftyJSON

class MyProfileViewController: UIViewController {

    @IBOutlet weak var firstView    : UIView!
    @IBOutlet weak var secondView   : UIView!
    @IBOutlet weak var thirdView    : UIView!
    @IBOutlet weak var shareBtn     : UIButton!
    @IBOutlet weak var bullspointvalue: UILabel!
    @IBOutlet weak var User_name    : UILabel!
    @IBOutlet weak var profilepic   : UIImageView!
    @IBOutlet weak var bullscoinValue: UILabel!
    @IBOutlet weak var phoneNumber   : UILabel!
    @IBOutlet weak var quizContests  : UILabel!
    
    let Profile_URL = "http://projectstatus.co.in/Bulls11/api/authentication/user/"
    let Api_Key = "BULLS11@2020"
    
    let cornerRadius: CGFloat = 3.0
    
    fileprivate func CustomizeView() {
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        firstView.layer.shadowColor     = UIColor.gray.cgColor
        firstView.layer.shadowOffset    = CGSize(width: 0, height: 1.0)
        firstView.layer.shadowOpacity   = 0.5
        firstView.layer.shadowRadius    = 2.0
        firstView.layer.cornerRadius    = cornerRadius
        firstView.layer.masksToBounds   = false
        
        secondView.layer.shadowColor    = UIColor.lightGray.cgColor
        secondView.layer.shadowOffset   = CGSize(width: 0, height: 1.0)
        secondView.layer.shadowOpacity  = 0.5
        secondView.layer.shadowRadius   = 1.0
       // secondView.layer.cornerRadius = cornerRadius
        secondView.layer.masksToBounds  = false
        shareBtn.layer.cornerRadius     = cornerRadius
        shareBtn.layer.masksToBounds    = true
    }
    
    
    
    func Fetch_Profile() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Profile_URL + KeychainWrapper.standard.string(forKey: "userID")!, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                   switch response.result {
                   case .success:
                    print(response.result)
                    let result = try? JSON(data: response.data!)
                    print("myResult:- \(result!.dictionaryValue)")
                    let finalResult = result!.dictionaryValue
                    print("firstname:- \(finalResult["first_name"]!.stringValue)")
                    let fullname = finalResult["first_name"]!.stringValue + finalResult["last_name"]!.stringValue
                    self.User_name.text = fullname
                    let profilepic = finalResult["profile_pic"]?.stringValue
                    self.profilepic.sd_setImage(with: URL(string: profilepic!), placeholderImage: UIImage(named: "user icon"))
                    let bullspoints = finalResult["bull_points"]?.stringValue
                    self.bullspointvalue.text = bullspoints
                    let bullscoins = finalResult["bulls_coin"]?.stringValue
                    self.bullscoinValue.text = bullscoins
                    let phoneNo = finalResult["phone"]?.stringValue
                    self.phoneNumber.text = phoneNo
                    let quiz = finalResult["quiz"]?.stringValue
                    self.quizContests.text = quiz
                    break
                   case .failure:
                    print(response.error.debugDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Fetch_Profile()
//        self.profilepic.sd_setImage(with: URL(string: Login_Model.profile_pic), placeholderImage: UIImage(named: "user icon"))
//        self.User_name.text = KeychainWrapper.standard.string(forKey: "userID")
         CustomizeView()
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "My Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 203/255, green: 41/255, blue: 122/255, alpha: 1)

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
