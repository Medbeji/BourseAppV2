//
//  ViewController.swift
//  BourseV2
//
//  Created by Med Beji on 23/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    var _isConnected = false
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false
        setupMenuBar()
        setupBarButtons()
        hideBarOnSlide()
    }
    func hideBarOnSlide() {
        
        menuBar.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        
    }
    func setupBarButtons(){
        let sideBar = UIBarButtonItem(image: UIImage(named: "menu")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(HomeController.openMenu(_:)))
        navigationItem.leftBarButtonItem =  sideBar
    }
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    func openMenu(sender: UIBarButtonItem) {
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left,animated: true, completion: nil)
    }
    
    
    
    
    func handleMore() {
        print ("hello world ")
    }
    
    
    
    
    private func setupMenuBar() {
        
        marcheSubMenu.homeController = self
        menuBar.homeController  = self
        COTATION.hidden = false
        PALMARES.hidden = true
        menuBar.layer.borderWidth = 1
        menuBar.layer.borderColor = UIColor.blackColor().CGColor
        navigationController?.hidesBarsOnSwipe = true
        
        view.addSubview(menuBar)
        // view.addSubview(actualiteSubMenu)
        view.addSubview(marcheSubMenu)
        view.addSubview(COTATION)
        view.addSubview(PALMARES)
        view.addSubview(INFOSOCIETE)
        
        loginPage.hidden = true
        INFOSOCIETE.hidden = false
        marcheSubMenu.hidden =  false
        actualiteSubMenu.hidden = true
        calendrierSubMenu.hidden = true
        portefeuilleSubMenu.hidden = true
        CALENDRIERCONTENT.hidden  = true
        COTATION.homeController = self
        PALMARES.homeController = self
        marcheSubMenu.homeController = self
        
        settingConstraint()
        
    }
    // changing between views 
    
    func layoutTab(submenu: UIView,content: UIView) {
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: submenu)
        view.addConstraintsWithFormat("H:|[v0]|", views: content)
        view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, submenu,content)
    }
    
    
    func settingConstraint () {
        
        if (!marcheSubMenu.hidden) {
            if ( !COTATION.hidden ) {
                layoutTab(marcheSubMenu, content: COTATION)
            } else  if (!PALMARES.hidden) {
                layoutTab(marcheSubMenu, content: PALMARES)
            }
        }
        if ( !actualiteSubMenu.hidden) {
            layoutTab(actualiteSubMenu, content: INFOSOCIETE)
        }
        if ( !calendrierSubMenu.hidden) {
            layoutTab(calendrierSubMenu, content: CALENDRIERCONTENT)
        }
        if  (!portefeuilleSubMenu.hidden) {
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: portefeuilleSubMenu)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]", views: menuBar, portefeuilleSubMenu)
        }
        if (!loginPage.hidden){
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: loginPage)
            view.addConstraintsWithFormat("V:|[v0(65)][v1]|", views: menuBar, loginPage)
        }
        
        
    }
    
    func switchingBetweenSubMenus(menuID: Int){
        
        if (!marcheSubMenu.hidden){
            if menuID == 0 {
                
                // Hide others tab
                PALMARES.hidden = true
                // Show Cotation tab
                COTATION.hidden = false
            }
            
            if menuID == 1 {
                
                // Hide others tab
                COTATION.hidden = true
                // Show Palmare tab
                PALMARES.hidden = false
            }
            settingConstraint()
            
        }
    }
    
    func hidesOthersTabBarItems() {
        
        // Hide marche tab
        marcheSubMenu.hidden = true
        COTATION.hidden =  true
        PALMARES.hidden = true
        
        
        // Hide Actualité tab
        INFOSOCIETE.hidden = true
        actualiteSubMenu.hidden = true
        //   INFOSOCIETE.removeFromSuperview()
        actualiteSubMenu.removeFromSuperview()
        
        
        // Hide Calendrier tab
        CALENDRIERCONTENT.hidden = true
        CALENDRIERCONTENT.removeFromSuperview()
        calendrierSubMenu.hidden = true
        calendrierSubMenu.removeFromSuperview()
        
        // Hide Portefeuille Tab
        portefeuilleSubMenu.hidden = true
        portefeuilleSubMenu.removeFromSuperview()
        loginPage.hidden = true
        
    }
    
    func switchingBetweenMenus(menuID : Int){
        hidesOthersTabBarItems()
        
        switch ( menuID ){
        case 0:
            
            // Show Marche Tab
            marcheSubMenu.hidden = false
            COTATION.hidden =  false
            PALMARES.hidden = false
            
            
            view.addSubview(marcheSubMenu)
            view.addSubview(COTATION)
            view.addSubview(PALMARES)
            
        case 1:
            // Show Actualite tab
            actualiteSubMenu.hidden = false
            INFOSOCIETE.hidden = false
            view.addSubview(actualiteSubMenu)
            view.addSubview(INFOSOCIETE)
            
        case 2:
            
            // Show Calendrier Tab
            calendrierSubMenu.hidden = false
            CALENDRIERCONTENT.hidden = false
            view.addSubview(CALENDRIERCONTENT)
            view.addSubview(calendrierSubMenu)
            
        case 3:
            
            // Show Portefeuille Tab
            if ( _isConnected ){
                portefeuilleSubMenu.hidden = false
                view.addSubview(portefeuilleSubMenu)
            }else {
                loginPage.hidden = false
                view.addSubview(loginPage)
                print("his not connected")
            }
        default :
            print("default switch")
            
        }
        
        
        settingConstraint()
    }
    
    func showAppDetailForApp() {
        //let layout = UICollectionViewFlowLayout()
        let appDetailController =  DetailViewController()
        navigationController?.pushViewController(appDetailController, animated: true)
    }
    func showSettings() {
        //let layout = UICollectionViewFlowLayout()
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left,animated: false, completion: nil)
        
        
        let settingsVC =  SettingVC()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    var deletedLast  : Bool = true
    func switchFromMenu(id : NSIndexPath) {
        appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left,animated: true, completion: nil)
        menuBar.collectionView(menuBar.collectionView, didSelectItemAtIndexPath: id)
        menuBar.lastSelected = id
        menuBar.shouldDeleteLastCellSelection = true 
    }
}

