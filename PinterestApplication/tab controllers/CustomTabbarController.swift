//
//  CustomTabbarController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 13/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController, UITabBarControllerDelegate{

           var homeViewController     : HomeViewController!
           var myContestViewController: ContestViewController!
           var walletViewController   : WalletViewController!
           var moreViewController     : MoreViewController!
           
           
           override func viewDidLoad() {
               super.viewDidLoad()
            self.tabBar.unselectedItemTintColor = .white
               self.delegate = self
               homeViewController      = HomeViewController()
               myContestViewController = ContestViewController()
               walletViewController    = WalletViewController()
               moreViewController      = MoreViewController()
            
           }
           
           
           func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
             if viewController.isKind(of: HomeViewController.self) {
                let vc =  HomeViewController()
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: true, completion: nil)
                return false
             }
             return true
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
