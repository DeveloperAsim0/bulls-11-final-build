//
//  MyProfileViewController.swift
//  PinterestApplication
//
//  Created by Mihir Vyas on 14/05/20.
//  Copyright © 2020 Gary Tokman. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    @IBOutlet weak var firstView      : UIView!
    @IBOutlet weak var secondView     : UIView!
    @IBOutlet weak var thirdView      : UIView!
    @IBOutlet weak var shareBtn       : UIButton!
    @IBOutlet weak var bullspointvalue: UILabel!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
         CustomizeView()
        if model.bullsPoint != nil {
            self.bullspointvalue.text = model.bullsPoint
        } else {
            self.bullspointvalue.text = "0"
        }
        self.navigationController?.navigationBar.topItem?.title = ""
        title = "My Profile"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 71/255, blue: 140/255, alpha: 1)
    }
    
    @IBAction func shareScreenshot(_ sender: Any) {
        var image :UIImage?
        let currentLayer = UIApplication.shared.keyWindow!.layer
        let currentScale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(currentLayer.frame.size, false, currentScale);
        guard let currentContext = UIGraphicsGetCurrentContext() else {return}
        currentLayer.render(in: currentContext)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let img = image else { return }
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
    }
}
