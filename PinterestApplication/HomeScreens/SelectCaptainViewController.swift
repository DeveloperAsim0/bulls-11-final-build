//
//  SelectCaptainViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 18/05/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit

class SelectCaptainViewController: UIViewController {

    @IBOutlet weak var tabel1      : UITableView!
    @IBOutlet weak var table2      : UITableView!
    @IBOutlet weak var tabel3      : UITableView!
    @IBOutlet weak var table4      : UITableView!
    
    @IBOutlet weak var captainbtn: UIButton!
    @IBOutlet weak var starbtn: UIButton!
    
    @IBOutlet weak var selectview       : UIView!
    @IBOutlet weak var createview       : UIView!
    @IBOutlet weak var joinview         : UIView!
    
    
    fileprivate func CustomizeViews2(){
        selectview.backgroundColor      = .clear
        selectview.layer.cornerRadius   = selectview.frame.size.width/2
        selectview.layer.borderColor    = UIColor.white.cgColor
        selectview.layer.borderWidth    = 1.5
        selectview.clipsToBounds        = true
        
        createview.backgroundColor      = .white
        createview.layer.cornerRadius   = createview.frame.size.width/2
        createview.layer.borderColor    = UIColor.white.cgColor
        createview.layer.borderWidth    = 1.5
        createview.clipsToBounds        = true
        
        joinview.backgroundColor        = .clear
        joinview.layer.cornerRadius     = joinview.frame.size.width/2
        joinview.layer.borderColor      = UIColor.white.cgColor
        joinview.layer.borderWidth      = 1.5
        joinview.clipsToBounds          = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  CustomizeViews()
//               self.tabel1.estimatedRowHeight = 20
//               self.tabel1.rowHeight = UITableView.automaticDimension
//               self.table2.estimatedRowHeight = 20
//               self.table2.rowHeight = UITableView.automaticDimension
//               self.tabel3.estimatedRowHeight = 20
//               self.tabel3.rowHeight = UITableView.automaticDimension
//               self.table4.estimatedRowHeight = 20
//               self.table4.rowHeight = UITableView.automaticDimension
        CustomizeViews2()
        //CustomizeButton()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func captain(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }
//
//    @IBAction func star(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }
//
//    @IBAction func secstar(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }
//
//    @IBAction func thirdstar(_ sender: UIButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        } else {
//            sender.isSelected = true
//        }
//    }
    
    @IBAction func next(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "letsplay")
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SelectCaptainViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if tableView.tag == 1 {
//             return UITableView.automaticDimension
//        } else if tableView.tag == 2 {
//             return UITableView.automaticDimension
//        } else if tableView.tag == 3 {
//             return UITableView.automaticDimension
//        } else if tableView.tag == 4 {
//             return UITableView.automaticDimension
//        }
//         return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if tableView.tag == 1{
               return savedBatsmanTeams.CompanyName.count
               } else if tableView.tag == 2{
               return savedBowlerTeams.CompanyName.count
               }else if tableView.tag == 4{
               return savedWicketKeeperTeams.CompanyName.count
               }
               return savedBatsmanTeams.CompanyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          if tableView.tag == 1 {
                let cell = tabel1.dequeueReusableCell(withIdentifier: "batsman") as! SavedBatsmanTableViewCell
            cell.batsmanSaved.text = savedBatsmanTeams.CompanyName[indexPath.row]
                return cell
                } else if tableView.tag == 2 {
                       let cell = table2.dequeueReusableCell(withIdentifier: "bowler") as! SavedBowlerTableViewCell
            cell.bowlerSaved.text = savedBowlerTeams.CompanyName[indexPath.row]
                       return cell
                } else  if tableView.tag == 4 {
                       let cell = table4.dequeueReusableCell(withIdentifier: "wicketkeepar") as! SavedWicketkeeperTableViewCell
            cell.wicketKeeperSaved.text = savedWicketKeeperTeams.CompanyName[indexPath.row]
                       return cell
                }
                return UITableViewCell()
    }
    
    
}
