//
//  MenuVC.swift
//  BourseV2
//
//  Created by Med Beji on 24/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.greenColor()
        setupViews()
    }
    
    let sideBarMenu: SideBarMenu =  {
        let sbm = SideBarMenu()
        return sbm
    }()
    
    
    func setupViews() {
        
        view.addSubview(sideBarMenu)
        
        view.addConstraintsWithFormat("H:|[v0]|", views: sideBarMenu)
        view.addConstraintsWithFormat("V:|[v0]|", views: sideBarMenu)
        
        
        
    }
}
