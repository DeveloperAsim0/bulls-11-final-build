//
//  RegisterViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import IQKeyboardManager
import Alamofire
import MHLoadingButton
import ALCameraViewController
import SwiftyJSON

class RegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var myactivity: UIActivityIndicatorView!
    @IBOutlet weak var imageViewRef: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var inviteCode: UITextField!
    @IBOutlet weak var mobileNo: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let picker = UIImagePickerController()
    var myfirstimage = UIImage(named: "1.png")
    let Registration_URL = "https://projectstatus.co.in/Bulls11/api/authentication/registration"
    let Api_Key = "BULLS11@2020"
    
    fileprivate func CustomNavBar(){
        title = "Register"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    fileprivate func CustomizeTextField() {
            passwordField.attributedPlaceholder = NSAttributedString(string: "  Enter Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            emailField.attributedPlaceholder = NSAttributedString(string: "  Enter Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            mobileNo.attributedPlaceholder = NSAttributedString(string: "  Enter Mobile No", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            inviteCode.attributedPlaceholder = NSAttributedString(string: "  Enter Invite code", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    
    fileprivate func CustomizeRegisterBtn() {
        registerButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        registerButton.layer.shadowOpacity = 1.0
        registerButton.layer.shadowRadius = 10.0
        registerButton.layer.masksToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeTextField()
        CustomizeRegisterBtn()
        CustomNavBar()
        //  picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterBTN(_ sender: Any){
        if emailField.text == "" || passwordField.text == "" || mobileNo.text == ""{
                   emailView.shake()
                   passwordView.shake()
                   mobileView.shake()
               } else {
//                   Fetch_Data()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "signupprofile") as! SignUpProfileViewController
            vc.modalPresentationStyle = .fullScreen
            vc.phoneNumber = self.mobileNo.text!
            vc.emailString = self.emailField.text!
            vc.passwordString = self.passwordField.text!
            self.navigationController?.pushViewController(vc, animated: true)
                   print("textField has some text")
               }
    }
    
    @IBAction func loginBtnSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginSegue")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
