//
//  contestVC.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 10/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class contestVC: UIViewController {
    
    @IBOutlet weak var collectionv: UICollectionView!
    @IBOutlet weak var nextbtn: UIButton!
    @IBOutlet weak var value: UILabel!
    
    var mysavedTag = Int()
    
    var right_Answer = String()
        let Quiz_URL = "http://projectstatus.co.in/Bulls11/api/authentication/quiz"
        let Api_Key = "BULLS11@2020"
    
    var quesNumber = ["1", "2", "3"]
    var WhichResult = String()
    override func viewDidLoad() {
    super.viewDidLoad()
        Fetch_Data()
    }
    
    func Fetch_Data() {
//        self.myactivity.isHidden = false
//        self.myactivity.startAnimating()
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        AF.request(self.Quiz_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                let myresult = try? JSON(data: response.data!)
                print(myresult!["data"])
                let resultArray = myresult!["data"]
                for i in resultArray.arrayValue {
                print("y i value:- \(i)")
                let id = i["quiz_id"].stringValue
                model.id.append(id)
                let AOption = i["A"].stringValue
                model.firstoption.append(AOption)
                let BOption = i["B"].stringValue
                model.secondoption.append(BOption)
                let myQuestion = i["question"].stringValue
                model.ques.append(myQuestion)
                let COption = i["C"].stringValue
                model.thirdoption.append(COption)
                let DOption = i["D"].stringValue
                model.fourthoption.append(DOption)
                let right = i["right_ans"].stringValue
                model.rightans.append(right)
                                        
            }
                self.collectionv.reloadData()
                break
            case .failure(let eror):
                print(eror.errorDescription)
            }
        }
        
    }
    
    func getResult() {
        let header:HTTPHeaders = [
            "X-API-KEY": "\(self.Api_Key)"
        ]
        
        let parameter = [
            "user_id": KeychainWrapper.standard.string(forKey: "userID"),
            "result": WhichResult
        ]
        print(parameter)
        AF.request("http://projectstatus.co.in/Bulls11/api/authentication/quiz_result", method: .post, parameters: parameter,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
            switch response.result {
            case .success:
                print(response.result)
                
            case .failure:
                print(response.error?.errorDescription)
            }
        }
    }
    
    @IBAction func next(_ sender: Any) {
        self.nextbtn.tag += 1
        var one = 1
        one += 1
        model.value = one
        self.value.text = "\(model.value)/3"
        print("mytag:- \(self.nextbtn.tag)")
       // print("mytag:- \(model.chooseoption)")
        print("mychoose:- \(model.choose_Answer)")
        print("right:- \(model.rightans)")
        let visibleItems: NSArray = self.collectionv.indexPathsForVisibleItems as NSArray
                  let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
                  let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
               if nextItem.row < model.id.count {
                      self.collectionv.scrollToItem(at: nextItem, at: .left, animated: true)
                  }
        if self.nextbtn.tag == 4 {
            print("no more")
            
            if model.choose_Answer == model.rightans {
                print("winner")
                self.WhichResult = "pass"
                 print("re:- \(self.WhichResult)")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                self.WhichResult = "fail"
                print("re:- \(self.WhichResult)")
                print("buhhhhhhh")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "betterluck")
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            getResult()
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = Date()
            let dateString = dateFormatter.string(from: date)
            let interval = date.timeIntervalSince1970
            let isTimeSaved: Bool = KeychainWrapper.standard.set(dateString, forKey: "DateSaved")
            print("mydate:- \(dateString)")
            print("mytime:-\(interval)")
        } else {
            print("enjoy")
        }
//        if model.choose_Answer == model.rightans {
//            print("win")
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "congratulation")
//            vc.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(vc, animated: true)
//        } else {
//            print("loose")
//
//        }
    }
}


extension contestVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width, height: 250.0)
    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.id.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionv.dequeueReusableCell(withReuseIdentifier: "collcell", for: indexPath) as! CollectionViewCell
        cell.first.text = model.firstoption[indexPath.row]
        cell.second.text = model.secondoption[indexPath.row]
        cell.third.text = model.thirdoption[indexPath.row]
        cell.fourth.text = model.fourthoption[indexPath.row]
        cell.questiion.text = model.ques[indexPath.row]
        //cell.number.text = self.quesNumber[indexPath.row]
        return cell
    }
    
    
}

