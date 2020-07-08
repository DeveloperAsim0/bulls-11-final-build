//
//  ChooseTeamViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChooseTeamViewController: UIViewController {

    @IBOutlet var batsmanImages: [UIImageView]!
    @IBOutlet var bowlerImages: [UIImageView]!
    @IBOutlet var wicketImages: [UIImageView]!
    @IBOutlet var allrounderImages: [UIImageView]!
    
    @IBOutlet weak var firstcircle      : UIImageView!
    @IBOutlet weak var secondcircle     : UIImageView!
    @IBOutlet weak var thirdcircle      : UIImageView!
    @IBOutlet weak var fourthcircle     : UIImageView!
    @IBOutlet weak var fifthcircle      : UIImageView!
    @IBOutlet weak var sixthcircle      : UIImageView!
    @IBOutlet weak var seventhcircle    : UIImageView!
    @IBOutlet weak var eightcircle      : UIImageView!
    @IBOutlet weak var ninthcircle      : UIImageView!
    @IBOutlet weak var tenthcircle      : UIImageView!
    @IBOutlet weak var eleventhcircle   : UIImageView!
    
    @IBOutlet weak var selectview       : UIView!
    @IBOutlet weak var createview       : UIView!
    @IBOutlet weak var joinview         : UIView!
    
    @IBOutlet weak var playerPointView  : UIView!
    @IBOutlet weak var teamView         : UIView!
    @IBOutlet weak var table1            : UITableView!
     @IBOutlet weak var table2           : UITableView!
     @IBOutlet weak var table3            : UITableView!
     @IBOutlet weak var table4            : UITableView!
    @IBOutlet weak var batsmen          : UIButton!
    @IBOutlet weak var bowler           : UIButton!
    @IBOutlet weak var allRounder       : UIButton!
    @IBOutlet weak var wicketKeeper     : UIButton!
    @IBOutlet weak var special          : UIButton!
    @IBOutlet weak var selected         : UIButton!

    var batsmantag = Int()
    var bowlertag = Int()
    var allroundertag = Int()
    var wicketkeepartag = Int()
    
    var ApiURL = String()
    let Api_Key = "BULLS11@2020"
    
    var myimagesNames = [UIImage(named: "wicket_keeper"), UIImage(named: "boll"), UIImage(named: "All-rounder"),UIImage(named: "bate")]
    var mywicket = UIImage(named: "wicket_keeper")
    var mybatsman = UIImage(named: "bate")
    var mybowler = UIImage(named: "boll")
    var myallrounder = UIImage(named: "All-rounder")
    
    fileprivate func circularbutton(){
        firstcircle.layer.cornerRadius  = 12.5
        firstcircle.layer.borderColor   = UIColor.gray.cgColor
        firstcircle.layer.borderWidth   = 0.5
        firstcircle.layer.masksToBounds = true
        
        secondcircle.layer.cornerRadius = 12.5
        secondcircle.layer.borderColor  = UIColor.gray.cgColor
        secondcircle.layer.borderWidth  = 0.5
        secondcircle.layer.masksToBounds = true
        
        thirdcircle.layer.cornerRadius  = 12.5
        thirdcircle.layer.borderColor   = UIColor.gray.cgColor
        thirdcircle.layer.borderWidth   = 0.5
        thirdcircle.layer.masksToBounds = true
        
        fourthcircle.layer.cornerRadius  = 12.5
        fourthcircle.layer.borderColor   = UIColor.gray.cgColor
        fourthcircle.layer.borderWidth   = 0.5
        fourthcircle.layer.masksToBounds = true
        
        fifthcircle.layer.cornerRadius   = 12.5
        fifthcircle.layer.borderColor    = UIColor.gray.cgColor
        fifthcircle.layer.borderWidth    = 0.5
        fifthcircle.layer.masksToBounds  = true
        
        sixthcircle.layer.cornerRadius   = 12.5
        sixthcircle.layer.borderColor    = UIColor.gray.cgColor
        sixthcircle.layer.borderWidth    = 0.5
        sixthcircle.layer.masksToBounds  = true
        
        seventhcircle.layer.cornerRadius  = 12.5
        seventhcircle.layer.borderColor   = UIColor.gray.cgColor
        seventhcircle.layer.borderWidth   = 0.5
        seventhcircle.layer.masksToBounds = true
        
        eightcircle.layer.cornerRadius  = 12.5
        eightcircle.layer.borderColor   = UIColor.gray.cgColor
        eightcircle.layer.borderWidth   = 0.5
        eightcircle.layer.masksToBounds = true
        
        ninthcircle.layer.cornerRadius  = 12.5
        ninthcircle.layer.borderColor   = UIColor.gray.cgColor
        ninthcircle.layer.borderWidth   = 0.5
        ninthcircle.layer.masksToBounds = true
        
        tenthcircle.layer.cornerRadius  = 12.5
        tenthcircle.layer.borderColor   = UIColor.gray.cgColor
        tenthcircle.layer.borderWidth   = 0.5
        tenthcircle.layer.masksToBounds = true
        
        eleventhcircle.layer.cornerRadius  = 12.5
        eleventhcircle.layer.borderColor   = UIColor.gray.cgColor
        eleventhcircle.layer.borderWidth   = 0.5
        eleventhcircle.layer.masksToBounds = true
    }
    
    fileprivate func CustomizeViews2(){
        selectview.backgroundColor    = .clear
        selectview.layer.cornerRadius = selectview.frame.size.width/2
        selectview.layer.borderColor  = UIColor.white.cgColor
        selectview.layer.borderWidth  = 1.5
        selectview.clipsToBounds      = true
        
        createview.backgroundColor    = .white
        createview.layer.cornerRadius = createview.frame.size.width/2
        createview.layer.borderColor  = UIColor.white.cgColor
        createview.layer.borderWidth  = 1.5
        createview.clipsToBounds      = true
        
        joinview.backgroundColor     = .clear
        joinview.layer.cornerRadius  = joinview.frame.size.width/2
        joinview.layer.borderColor   = UIColor.white.cgColor
        joinview.layer.borderWidth   = 1.5
        joinview.clipsToBounds       = true
    }
    
    fileprivate func editButton(){
            
        teamView.layer.cornerRadius  = 8
        teamView.layer.borderColor   = UIColor.gray.cgColor
        teamView.layer.borderWidth   = 0.5
        teamView.layer.masksToBounds = true

        playerPointView.layer.cornerRadius  = 8
        playerPointView.layer.borderColor   = UIColor.gray.cgColor
        playerPointView.layer.borderWidth   = 0.5
        playerPointView.layer.masksToBounds = true
        
        selected.layer.cornerRadius  = 15
        selected.layer.masksToBounds = true
        
        special.layer.cornerRadius  = 15
        special.layer.masksToBounds = true
        
        batsmen.layer.cornerRadius  = 12.5
        batsmen.layer.borderColor   = UIColor.gray.cgColor
        batsmen.layer.borderWidth   = 0.5
        batsmen.layer.masksToBounds = true
        
        bowler.layer.cornerRadius  = 12.5
        bowler.layer.borderColor   = UIColor.gray.cgColor
        bowler.layer.borderWidth   = 0.5
        bowler.layer.masksToBounds = true
        
        allRounder.layer.cornerRadius  = 12.5
        allRounder.layer.borderColor   = UIColor.gray.cgColor
        allRounder.layer.borderWidth   = 0.5
        allRounder.layer.masksToBounds = true
        
        wicketKeeper.layer.cornerRadius  = 12.5
        wicketKeeper.layer.borderColor   = UIColor.gray.cgColor
        wicketKeeper.layer.borderWidth   = 0.5
        wicketKeeper.layer.masksToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton()
        CustomizeViews2()
        circularbutton()
        Fetch_Data()
        self.table1.estimatedRowHeight = 80
        self.table1.rowHeight = UITableView.automaticDimension
        self.table2.estimatedRowHeight = 80
        self.table2.rowHeight = UITableView.automaticDimension
        self.table3.estimatedRowHeight = 80
        self.table3.rowHeight = UITableView.automaticDimension
        self.table4.estimatedRowHeight = 80
        self.table4.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func Fetch_Data() {
    //        self.myactivity.isHidden = false
    //        self.myactivity.startAnimating()
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
            
            let parameters = [
            "comp_type": "batsman",
            "date_id": "1"
            ]
        
            request(self.ApiURL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(user: "admin", password: "1234").responseJSON { response in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print(myresult!["data"])
                    let resultArray = myresult!["data"]
                    batsmanTeam.Company_Details.removeAll()
                    batsmanTeam.Company_Name.removeAll()
                    batsmanTeam.Company_ID.removeAll()
                    for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                        let id = i["c_id"].stringValue
                        batsmanTeam.Company_ID.append(id)
                        let companyName  = i["c_name"].stringValue
                        batsmanTeam.Company_Name.append(companyName)
                        print("company:- \(batsmanTeam.Company_Name)")
                        let companyDetails = i["c_detail"].stringValue
                        batsmanTeam.Company_Details.append(companyDetails)
                }
                    self.table1.reloadData()
                    break
                case .failure(let eror):
                    print(eror.localizedDescription)
                }
            }
            
        }
    
    func Fetch_Data_Bowler() {
    //        self.myactivity.isHidden = false
    //        self.myactivity.startAnimating()
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
            
            let parameters = [
            "comp_type": "bowler",
            "date_id": "1"
            ]
        
            request(self.ApiURL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(user: "admin", password: "1234").responseJSON { response in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print(myresult!["data"])
                    let resultArray = myresult!["data"]
                    bowlerTeam.Company_Details.removeAll()
                    bowlerTeam.Company_Name.removeAll()
                    bowlerTeam.Company_ID.removeAll()
                    for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                        let id = i["c_id"].stringValue
                        bowlerTeam.Company_ID.append(id)
                        let companyName  = i["c_name"].stringValue
                        bowlerTeam.Company_Name.append(companyName)
                        print("company:- \(bowlerTeam.Company_Name)")
                        let companyDetails = i["c_detail"].stringValue
                        bowlerTeam.Company_Details.append(companyDetails)
                }
                    self.table2.reloadData()
                    break
                case .failure(let eror):
                    print(eror.localizedDescription)
                }
            }
            
        }
    
    func Fetch_Data_Wicket_Keepar() {
    //        self.myactivity.isHidden = false
    //        self.myactivity.startAnimating()
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
            
            let parameters = [
            "comp_type": "wicket_keeper",
            "date_id": "1"
            ]
        
            request(self.ApiURL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(user: "admin", password: "1234").responseJSON { response in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print(myresult!["data"])
                    let resultArray = myresult!["data"]
                    wicketkeeparTeam.Company_Details.removeAll()
                    wicketkeeparTeam.Company_Name.removeAll()
                    wicketkeeparTeam.Company_ID.removeAll()
                    for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                        let id = i["c_id"].stringValue
                        wicketkeeparTeam.Company_ID.append(id)
                        let companyName  = i["c_name"].stringValue
                        wicketkeeparTeam.Company_Name.append(companyName)
                        print("company:- \(wicketkeeparTeam.Company_Name)")
                        let companyDetails = i["c_detail"].stringValue
                        wicketkeeparTeam.Company_Details.append(companyDetails)
                }
                    self.table4.reloadData()
                    break
                case .failure(let eror):
                    print(eror.localizedDescription)
                }
            }
            
        }
    
    func Fetch_Data_All_Rounder() {
    //        self.myactivity.isHidden = false
    //        self.myactivity.startAnimating()
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
            
            let parameters = [
            "comp_type": "all_rounder",
            "date_id": "1"
            ]
        
            request(self.ApiURL, method: .post, parameters: parameters,encoding: JSONEncoding.default, headers: header).authenticate(user: "admin", password: "1234").responseJSON { response in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print(myresult!["data"])
                    let resultArray = myresult!["data"]
                    allrounderTeam.Company_Details.removeAll()
                    allrounderTeam.Company_Name.removeAll()
                    allrounderTeam.Company_ID.removeAll()
                    for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                        let id = i["c_id"].stringValue
                        allrounderTeam.Company_ID.append(id)
                        let companyName  = i["c_name"].stringValue
                        allrounderTeam.Company_Name.append(companyName)
                        print("company:- \(allrounderTeam.Company_Name)")
                        let companyDetails = i["c_detail"].stringValue
                        allrounderTeam.Company_Details.append(companyDetails)
                }
                    self.table3.reloadData()
                    break
                case .failure(let eror):
                    print(eror.localizedDescription)
                }
            }
            
        }
    
    @IBAction func Batsman(_ sender: Any){
        table1.isHidden = false
        table3.isHidden = true
        table4.isHidden = true
        table2.isHidden = true
        Fetch_Data() // 226 40 140
        self.batsmantag = batsmen.tag
        print("batsmanTag:- \(self.batsmen.tag)")
        self.batsmen.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.bowler.backgroundColor = .clear
        self.allRounder.backgroundColor = .clear
        self.wicketKeeper.backgroundColor = .clear
    }
    
    @IBAction func Bowler(_ sender: Any){
      Fetch_Data_Bowler()
        table1.isHidden = true
        table3.isHidden = true
        table4.isHidden = true
        table2.isHidden = false
        self.bowlertag = bowler.tag
        print("mybolertag:- \(self.bowlertag)")
        print("batsmanTag:- \(self.bowler.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.allRounder.backgroundColor = .clear
        self.wicketKeeper.backgroundColor = .clear
    }
    
    @IBAction func AllRounder(_ sender: Any){
        table1.isHidden = true
        table2.isHidden = true
        table4.isHidden = true
        table3.isHidden = false
        Fetch_Data_All_Rounder()
        self.allroundertag = allRounder.tag
        print("batsmanTag:- \(self.allRounder.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = .clear
        self.allRounder.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
        self.wicketKeeper.backgroundColor = .clear
    }  
    
    @IBAction func WicketKeeper(_ sender: Any){
        table4.isHidden = false
        table1.isHidden = true
        table3.isHidden = true
        table2.isHidden = true
        Fetch_Data_Wicket_Keepar()
        self.wicketkeepartag = wicketKeeper.tag
        print("batsmanTag:- \(self.wicketKeeper.tag)")
        self.batsmen.backgroundColor = .clear
        self.bowler.backgroundColor = .clear
        self.allRounder.backgroundColor = .clear
        self.wicketKeeper.backgroundColor = UIColor(red: 226/255, green: 40/255, blue: 140/255, alpha: 1.0)
    }
    
    @IBAction func chooseSpecialPlayer(_ sender: Any){
        let alert = UIAlertController(title: "Please choose 11 players to create Team", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
                  let vc = storyboard.instantiateViewController(withIdentifier: "moreplayer")
                  self.navigationController?.pushViewController(vc, animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func viewSelectedPlayer(_ sender: Any){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "selectedPlayer")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChooseTeamViewController: showStatus{
    func didTapForStatus(Title: String) {
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later List"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
 */
    }
}

extension ChooseTeamViewController: showStatus2{
    func didTapForStatus2(Title: String) {
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later List"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
 */
    }
}

extension ChooseTeamViewController: showStatus3{
    func didTapForStatus3(Title: String) {
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later List"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
 */
    }
}

extension ChooseTeamViewController: showStatus4{
    func didTapForStatus4(Title: String) {
        let showAlert = UIAlertController(title: "Demo Alert", message: nil, preferredStyle: .alert)
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 230))
        imageView.image = UIImage(named: "graph") // Your image here...
        showAlert.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: showAlert.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
        let width = NSLayoutConstraint(item: showAlert.view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        showAlert.view.addConstraint(height)
        showAlert.view.addConstraint(width)
        showAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            // your actions here...
        }))
        self.present(showAlert, animated: true, completion: nil)
        /*let alertTitle = "Watch Later"
        let message = "\(title) added to Watch Later List"
        
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
 */
    }
}

extension ChooseTeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
             return UITableView.automaticDimension
        } else if tableView.tag == 2 {
             return UITableView.automaticDimension
        } else if tableView.tag == 3 {
             return UITableView.automaticDimension
        } else if tableView.tag == 4 {
             return UITableView.automaticDimension
        }
         return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1{
        return batsmanTeam.Company_ID.count
        } else if tableView.tag == 2{
        return bowlerTeam.Company_ID.count
        } else if tableView.tag == 3{
        return allrounderTeam.Company_ID.count
        } else if tableView.tag == 4{
        
            return wicketkeeparTeam.Company_ID.count
        }
        return batsmanTeam.Company_ID.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? ChooseTeamTableViewCell {
             print(cell.CompanyNameLbl)
            savedBatsmanTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
        }
        if let cell = tableView.cellForRow(at: indexPath) as? secondTableViewCell {
             print(cell.CompanyNameLbl)
            savedBowlerTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
        }
        if let cell = tableView.cellForRow(at: indexPath) as? thirdTableViewCell {
             print(cell.CompanyNameLbl)
            savedAllRounderTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
        }
        if let cell = tableView.cellForRow(at: indexPath) as? fourthTableViewCell {
             print(cell.CompanyNameLbl)
            savedWicketKeeperTeams.CompanyName.append(cell.CompanyNameLbl.text ?? "defaults")
        }
        if tableView.tag == 1 {
            batsmanImages[indexPath.row].image = mybatsman
           // let selectedIndex = table1.indexPathsForSelectedSections
        } else if tableView.tag == 2 {
            bowlerImages[indexPath.row].image = mybowler
        } else if tableView.tag == 3 {
            wicketImages[indexPath.row].image = myallrounder
        } else if tableView.tag == 4 {
            allrounderImages[indexPath.row].image = mywicket
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        myImages[indexPath.row].image = nil
        if let cell = tableView.cellForRow(at: indexPath) as? ChooseTeamTableViewCell {
            print(cell.CompanyNameLbl)
            savedBatsmanTeams.CompanyName.removeAll()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? secondTableViewCell {
            print(cell.CompanyNameLbl)
            savedBowlerTeams.CompanyName.removeAll()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? thirdTableViewCell {
            print(cell.CompanyNameLbl)
            savedAllRounderTeams.CompanyName.removeAll()
        }
        if let cell = tableView.cellForRow(at: indexPath) as? fourthTableViewCell {
            print(cell.CompanyNameLbl)
            savedWicketKeeperTeams.CompanyName.removeAll()
        }
        if tableView.tag == 1 {
            batsmanImages[indexPath.row].image = nil
            // let selectedIndex = table1.indexPathsForSelectedSections
        } else if tableView.tag == 2 {
            bowlerImages[indexPath.row].image = nil
        } else if tableView.tag == 3 {
            wicketImages[indexPath.row].image = nil
        } else if tableView.tag == 4 {
            allrounderImages[indexPath.row].image = nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
        let cell = table1.dequeueReusableCell(withIdentifier: "choose") as! ChooseTeamTableViewCell
        cell.delegate = self as showStatus
        cell.conView.layer.cornerRadius = 5.0
        cell.conView.layer.borderColor = UIColor.gray.cgColor
        cell.conView.layer.borderWidth = 0.5
        cell.CompanyNameLbl.text = batsmanTeam.Company_Name[indexPath.row]
        cell.CompanyDetailLbl.text = batsmanTeam.Company_Details[indexPath.row]
        return cell
        } else if tableView.tag == 2 {
               let cell = table2.dequeueReusableCell(withIdentifier: "choose2") as! secondTableViewCell
//              cell.delegate = self as showStatus2
             cell.delegate = self as showStatus2
               cell.conView.layer.cornerRadius = 5.0
               cell.conView.layer.borderColor = UIColor.gray.cgColor
               cell.conView.layer.borderWidth = 0.5
               cell.CompanyNameLbl.text = bowlerTeam.Company_Name[indexPath.row]
               cell.CompanyDetailLbl.text = bowlerTeam.Company_Details[indexPath.row]
               return cell
        } else  if tableView.tag == 3 {
               let cell = table3.dequeueReusableCell(withIdentifier: "choose3") as! thirdTableViewCell
               cell.delegate = self as showStatus3
               cell.conView.layer.cornerRadius = 5.0
               cell.conView.layer.borderColor = UIColor.gray.cgColor
               cell.conView.layer.borderWidth = 0.5
               cell.CompanyNameLbl.text = allrounderTeam.Company_Name[indexPath.row]
               cell.CompanyDetailLbl.text = allrounderTeam.Company_Details[indexPath.row]
               return cell
        } else  if tableView.tag == 4 {
               let cell = table4.dequeueReusableCell(withIdentifier: "choose4") as! fourthTableViewCell
               cell.delegate = self as showStatus4
               cell.conView.layer.cornerRadius = 5.0
               cell.conView.layer.borderColor = UIColor.gray.cgColor
               cell.conView.layer.borderWidth = 0.5
               cell.CompanyNameLbl.text = wicketkeeparTeam.Company_Name[indexPath.row]
               cell.CompanyDetailLbl.text = wicketkeeparTeam.Company_Details[indexPath.row]
               return cell
        }
        return UITableViewCell()
    }
}
