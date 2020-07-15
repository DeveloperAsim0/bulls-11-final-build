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
       imageViewRef.layer.borderWidth = 0.55
       imageViewRef.layer.masksToBounds = false
       imageViewRef.layer.borderColor = UIColor.white.cgColor
       imageViewRef.layer.cornerRadius = imageViewRef.frame.size.width / 2
       imageViewRef.clipsToBounds = true
        self.myactivity.isHidden = true
      //  picker.delegate = self
        // Do any additional setup after loading the view.
    }
    
      func Fetch_Data() {
//        self.myactivity.isHidden = false
//        self.myactivity.startAnimating()
        let image = UIImage.init(named: "1.png")
        let imgData = imageViewRef.image!.jpegData(compressionQuality: 0.2)!
       let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]

        let parameters = [
            "email": emailField.text,
            "password": passwordField.text,
            "phone": mobileNo.text
            ]
        
        AF.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imgData, withName: "profile_pic", fileName: "file.jpg", mimeType: "image/jpg")
            for (key, value) in parameters {
                multipartFormData.append(value!.data(using: String.Encoding.utf8)!, withName: key)
                }
        }, to:Registration_URL, method: .post, headers: header).authenticate(username: "admin", password: "1234").responseJSON { (response) in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print("my:- \(myresult?["status"])")
                if myresult?["status"] == false  {
                    let alert = UIAlertController(title: "Alert", message: "\(myresult!["message"])", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)

                    // change to desired number of seconds (in this case 5 seconds)
                    let when = DispatchTime.now() + 2
                    DispatchQueue.main.asyncAfter(deadline: when){
                      // your code with delay
                      alert.dismiss(animated: true, completion: nil)
                    }
                } else if myresult?["status"] == true{
                    let alert = UIAlertController(title: "Successfully Registered", message: "", preferredStyle: UIAlertController.Style.alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                                        UserDefaults.standard.set(true, forKey: "UserHasSubmittedPassword")
                                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                        let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
                                        vc.modalPresentationStyle = .fullScreen
                                        self.present(vc, animated: true, completion: nil)
                                    }))
                                    self.present(alert, animated: true, completion: nil)
                                    self.myactivity.stopAnimating()
                                    self.myactivity.isHidden = true
                }
//
            case .failure(let err):
                print(err.errorDescription)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickerImage = info[UIImagePickerController.InfoKey.editedImage,default: UIImagePickerController.InfoKey.editedImage] as? UIImage else {return}
        imageViewRef.image = pickerImage
        imageViewRef.contentMode = .scaleToFill
        self.dismiss(animated: true, completion: nil)
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func RegisterBTN(_ sender: Any){
        if emailField.text == "" || passwordField.text == "" || mobileNo.text == ""{
                   emailView.shake()
                   passwordView.shake()
                   mobileView.shake()
               } else {
                   Fetch_Data()
                   print("textField has some text")
               }
    }
    
    @IBAction func loginBtnSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "loginSegue")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func selectImage(_ sender: Any){
      let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
      alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
          self.openCamera()
      }))

      alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
          self.openGallery()
      }))

      alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

      self.present(alert, animated: true, completion: nil)
    }
        //MARK:UIImagePickerControllerDelegate
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
