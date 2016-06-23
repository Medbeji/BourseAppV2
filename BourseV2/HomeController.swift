//
//  ViewController.swift
//  BourseV2
//
//  Created by Med Beji on 23/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false
        
        // Button  
        
        //        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        //        btn.backgroundColor = .greenColor()
        //        btn.setBackgroundImage(UIImage(named: "menu"), forState: UIControlState.Normal)
        //        btn.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        //        
        // Home Title
        //        let titleLabel = UILabel(frame: CGRectMake(0, 0, view.frame.width - 32, view.frame.height))
        //        titleLabel.text = "Home"
        //        titleLabel.textColor = UIColor.blackColor()
        //        titleLabel.font = UIFont.systemFontOfSize(20)
        //        navigationItem.titleView = titleLabel
        
        setupMenuBar()
        setupBarButtons()
    }
    
    func setupBarButtons(){
        let sideBar = UIBarButtonItem(image: UIImage(named: "menu")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(handleMore))
        navigationItem.leftBarButtonItem =  sideBar
    }
    
    func handleMore() {
        print ("hello world ")
    }
    
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(65)]", views: menuBar)
    }
    
}

