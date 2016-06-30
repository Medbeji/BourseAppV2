//
//  SettingVC.swift
//  BourseV2
//
//  Created by Med Beji on 30/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//
import UIKit

class SettingVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = UIColor.rgb(250, green: 250, blue: 250)
        view.backgroundColor = UIColor.greenColor()
        setupViews()
        navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor =  UIColor.blackColor()
    }
    
    
    func setupViews() {
        
    }
    
    
}
