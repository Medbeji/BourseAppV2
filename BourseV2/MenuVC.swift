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
        self.automaticallyAdjustsScrollViewInsets = false;
        view.backgroundColor = UIColor.whiteColor()
        setupViews()
    }
    
    let sideBarMenu: SideBarMenu =  {
        let sbm = SideBarMenu()
        return sbm
    }()
    
    let menuTitle : Title = {
        
        return Title()
    }()
    
    
    func setupViews() {
        view.addSubview(sideBarMenu)
        view.addSubview(menuTitle)
        view.addConstraintsWithFormat("H:|[v0]|", views: sideBarMenu)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuTitle)
        view.addConstraintsWithFormat("V:|-20-[v0(30)]-0-[v1]|", views:menuTitle, sideBarMenu)
    }
}


class Title : BaseCell  {
    
    
    let title: UILabel = {
        let t = UILabel()
        t.text = "Les marchés en direct"
        t.textColor = UIColor.rgb(128, green: 126, blue: 128)
        return t
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(55, green: 55, blue: 55)
        addSubview(title)
        addConstraintsWithFormat("H:|-16-[v0]|", views: title)
        addConstraintsWithFormat("V:|[v0]|", views: title)
        
    }
}
