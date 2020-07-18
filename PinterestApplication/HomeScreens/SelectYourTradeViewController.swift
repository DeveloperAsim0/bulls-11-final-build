//
//  SelectYourTradeViewController.swift
//  
//
//  Created by Mihir Vyas on 18/05/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class SelectYourTradeViewController: UIViewController {

    @IBOutlet weak var tableView   : UITableView!
    @IBOutlet weak var selectview  : UIView!
    @IBOutlet weak var createview  : UIView!
    @IBOutlet weak var joinview    : UIView!
    
    var Date_URL = String()
    let Api_Key = "BULLS11@2020"
    var NextApiUrl = String()
    fileprivate func CustomizeViews(){
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
        
        joinview.layer.cornerRadius     = joinview.frame.size.width/2
        joinview.layer.borderColor      = UIColor.white.cgColor
        joinview.layer.borderWidth      = 1.5
        joinview.clipsToBounds          = true
    }
    
    
    func Fetch_Data() {
            let header:HTTPHeaders = [
                "X-API-KEY": "\(self.Api_Key)"
            ]
            
            AF.request(self.Date_URL, method: .get, parameters: nil,encoding: JSONEncoding.default, headers: header).authenticate(username: "admin", password: "1234").responseJSON { response in
                switch response.result {
                case .success:
                    print(response.result)
                    let myresult = try? JSON(data: response.data!)
                    print(myresult!["data"])
                    let resultArray = myresult!["data"]
                    for i in resultArray.arrayValue {
                    print("y i value:- \(i)")
                        let details = i["small_content"].stringValue
                        model.date_details.append(details)
                        let id = i["d_id"].stringValue
                        print("id:- \(id)")
                        model.dateID.append(id)
                        let date = i["dates"].stringValue
                        model.date.append(date)
                        let prizeAmount = i["prize_amount"].stringValue
                        model.totalSlots.append(prizeAmount)
                       // print("mydate:- \(model.date)")
                }
                    self.tableView.reloadData()
                    break
                case .failure(let eror):
                    print(eror.errorDescription)
                }
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeViews()
        Fetch_Data()
        self.navigationController?.navigationBar.topItem?.title = "Back"

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
}


extension SelectYourTradeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.dateID.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tradecell") as! SelectTradeTableViewCell
        cell.DateLabel.text = model.date[indexPath.row]
        cell.DetailLabel.text = model.date_details[indexPath.row]
       // cell.DetailLabel.text = model.date_details[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "choose") as! ChooseTeamViewController
        vc.ApiURL = self.NextApiUrl
        vc.myDateID = model.dateID
        model.actualDateID = model.dateID
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
