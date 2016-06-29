//
//  DetailVC.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = UIColor.rgb(250, green: 250, blue: 250)
        view.backgroundColor = UIColor.greenColor()
        setupViews()
        navigationItem.backBarButtonItem?.tintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor =  UIColor.blackColor()
    }
    
    let header :MenuHeader = {
        let he = MenuHeader()
        return he
    }()
    
    let menuBar: DetailSubMenu = {
        let mb = DetailSubMenu()
        return mb
    }()
    
    let detailContent : DetailContent = {
        let dc = DetailContent()
        return dc
    }()
    
    func setupViews() {
        view.addSubview(header)
        view.addSubview(menuBar)
        view.addSubview(detailContent)
        view.addConstraintsWithFormat("H:|[v0]|", views: header)
        view.addConstraintsWithFormat("H:|[v0]|", views: detailContent)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(135)][v1(40)][v2]|", views: header,menuBar,detailContent)
    }
    
    
}
