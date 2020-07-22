//
//  ContestViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class ContestViewController: UIViewController {

    @IBOutlet weak var leadingConstraints: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var sideMenu2 = false
    
    fileprivate func CustomNavBar(){
        title = "RESULT"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         CustomNavBar()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func openSideMenu(_ sender: Any){
        if (sideMenu2) {
            leadingConstraints.constant = -260
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = .white
            })
        } else {
            leadingConstraints.constant = 0
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseIn, animations: {
                self.view.layoutIfNeeded()
                self.view.backgroundColor = UIColor(red: 155/255, green: 156/255, blue: 157/255, alpha: 1)
            })
        }
        
        sideMenu2 = !sideMenu2
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

extension ContestViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultcontestcell") as! ResultContestTableViewCell
        return cell
    }
    
    
}
