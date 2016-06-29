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
        view.backgroundColor = UIColor.blackColor()
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
    
    let marcheSubMenu: MarcheSubMenu = {
        let smb = MarcheSubMenu()
        return smb 
    }()
    
    let actualiteSubMenu: ActualiteSubMenu = {
        let smb = ActualiteSubMenu()
        return smb
    }()
    
    
    let tabContent: ContentCollectionView = {
        let tc = ContentCollectionView()
        return tc
    }()
    
    let tabContent1: TestContent = {
        let tc = TestContent()
        return tc
    }()
    
    private func setupMenuBar() {
        
        
        marcheSubMenu.homeController = self
        menuBar.homeController  = self
        tabContent.hidden = false
        tabContent1.hidden = true
        menuBar.layer.borderWidth = 1
        menuBar.layer.borderColor = UIColor.blackColor().CGColor
        view.addSubview(menuBar)
        view.addSubview(actualiteSubMenu)
        view.addSubview(marcheSubMenu)
        view.addSubview(tabContent)
        view.addSubview(tabContent1)
        
        marcheSubMenu.hidden =  false
        actualiteSubMenu.hidden = true 
        tabContent.homeController = self
        tabContent1.homeController = self
        
        
        settingConstraint()
        
    }
    
    func settingConstraint () {
        if (!marcheSubMenu.hidden) {
            if ( !tabContent.hidden ) {
                print ( " tab content 1 is hidden")
                view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
                view.addConstraintsWithFormat("H:|[v0]|", views: marcheSubMenu)
                view.addConstraintsWithFormat("H:|[v0]|", views: tabContent)
                view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, marcheSubMenu,tabContent)
            } else  if (!tabContent1.hidden) {
                print ( " tab content 0 is hidden")
                view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
                view.addConstraintsWithFormat("H:|[v0]|", views: marcheSubMenu)
                view.addConstraintsWithFormat("H:|[v0]|", views: tabContent1)
                view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, marcheSubMenu,tabContent1)
            }
        }
        if ( !actualiteSubMenu.hidden) {
            
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: actualiteSubMenu)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]", views: menuBar, actualiteSubMenu)
            
            
        }
        
        
    }
    
    func changingTab( tabID : Int) {
        if tabID  == 0 {
            tabContent.hidden = false
            tabContent1.hidden = true
            settingConstraint()
        } else  if tabID == 1 {
            tabContent1.hidden = false
            tabContent.hidden = true
            settingConstraint()
        }
        
    }
    
    func switchingBetweenMenus(menuID : Int){
        if menuID == 1 {
            // Hide marche tab
            marcheSubMenu.hidden = true
            tabContent.hidden =  true
            tabContent1.hidden = true
            // Show Actualite tab 
            actualiteSubMenu.hidden = false
            settingConstraint()
        }
        
        if menuID == 0 {
            actualiteSubMenu.hidden = true
            marcheSubMenu.hidden = false
            tabContent.hidden =  false
            tabContent1.hidden = false
            
        }
    }
    
    func showAppDetailForApp() {
        //let layout = UICollectionViewFlowLayout()
        let appDetailController =  DetailViewController()
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    
}

