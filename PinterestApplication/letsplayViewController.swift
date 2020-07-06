//
//  letsplayViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 11/06/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class letsplayViewController: UIViewController {

    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var createview: UIView!
    @IBOutlet weak var joinview: UIView!
    
    @IBOutlet weak var blackview: UIView!
    @IBOutlet weak var pinkview: UIView!
    @IBOutlet weak var purpleview: UIView!
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet weak var thirdview: UIView!
    @IBOutlet weak var fourthview: UIView!
    @IBOutlet weak var fifthview: UIView!
    
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
        
        blackview.layer.cornerRadius = blackview.frame.size.width/2
        blackview.clipsToBounds = true
        
        pinkview.layer.cornerRadius = pinkview.frame.size.width/2
        pinkview.clipsToBounds = true
        
        purpleview.layer.cornerRadius = purpleview.frame.size.width/2
        purpleview.clipsToBounds = true
        
        
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
        
        
        fifthview.layer.cornerRadius = 5
        fifthview.layer.shadowOffset = CGSize(width: 0, height: 3)
        fifthview.layer.shadowOpacity = 0.6
        fifthview.layer.shadowRadius = 3.0
        fifthview.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomizeView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func LetsPlay(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "customtab")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
