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
        setupMenuBar()
        setupBarButtons()
        
    }
    
    func setupBarButtons(){
        let sideBar = UIBarButtonItem(image: UIImage(named: "menu")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        //     self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        navigationItem.leftBarButtonItem =  sideBar
    }
    
    
    
    func handleMore() {
        print ("hello world ")
    }
    
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    let subMenuBar: SubMenu = {
        let smb = SubMenu()
        return smb 
    }()
    
    
    let tabContent: ContentCollectionView = {
        let tc = ContentCollectionView()
        return tc
    }()
    
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addSubview(subMenuBar)
        view.addSubview(tabContent)
        tabContent.homeController = self
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: subMenuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: tabContent)
        view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, subMenuBar,tabContent)
    }
    
    
    func showAppDetailForApp() {
        let layout = UICollectionViewFlowLayout()
        let appDetailController = ObligationDetailController(collectionViewLayout: layout)
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
}

