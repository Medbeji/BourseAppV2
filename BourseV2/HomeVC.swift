//
//  ViewController.swift
//  BourseV2
//
//  Created by Med Beji on 23/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    var _isConnected = true
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blackColor()
        navigationItem.title = "Home"
        navigationController?.navigationBar.translucent = false
        setupMenuBar()
        setupBarButtons()
        
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
        
        view.addSubview(menuBar)
        // view.addSubview(actualiteSubMenu)
        view.addSubview(marcheSubMenu)
        view.addSubview(COTATION)
        view.addSubview(PALMARES)
        view.addSubview(INFOSOCIETE)
        
        
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
    
    
    func settingConstraint () {
        if (!marcheSubMenu.hidden) {
            if ( !COTATION.hidden ) {
                print ( " tab content 1 is hidden")
                view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
                view.addConstraintsWithFormat("H:|[v0]|", views: marcheSubMenu)
                view.addConstraintsWithFormat("H:|[v0]|", views: COTATION)
                view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, marcheSubMenu,COTATION)
            } else  if (!PALMARES.hidden) {
                print ( " tab content 0 is hidden")
                view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
                view.addConstraintsWithFormat("H:|[v0]|", views: marcheSubMenu)
                view.addConstraintsWithFormat("H:|[v0]|", views: PALMARES)
                view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, marcheSubMenu,PALMARES)
            }
        }
        if ( !actualiteSubMenu.hidden) {
            
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: actualiteSubMenu)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]", views: menuBar, actualiteSubMenu)
            view.addConstraintsWithFormat("H:|[v0]|", views: INFOSOCIETE)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, actualiteSubMenu,INFOSOCIETE)
            
        }
        if ( !calendrierSubMenu.hidden) {
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: calendrierSubMenu)
            view.addConstraintsWithFormat("H:|[v0]|", views: CALENDRIERCONTENT)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]-0-[v2]|", views: menuBar, calendrierSubMenu,CALENDRIERCONTENT)
            
        }
        if  (!portefeuilleSubMenu.hidden) {
            view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
            view.addConstraintsWithFormat("H:|[v0]|", views: portefeuilleSubMenu)
            view.addConstraintsWithFormat("V:|[v0(65)]-0-[v1(45)]", views: menuBar, portefeuilleSubMenu)
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
    
    func switchingBetweenMenus(menuID : Int){
        
        if menuID == 0 {
            
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
            
            // Show Marche Tab
            marcheSubMenu.hidden = false
            COTATION.hidden =  false
            PALMARES.hidden = false
            
            view.addSubview(marcheSubMenu)
            view.addSubview(COTATION)
            view.addSubview(PALMARES)
            
        }
        
        
        if menuID == 1 {
            // Hide marche tab
            marcheSubMenu.hidden = true
            COTATION.hidden =  true
            PALMARES.hidden = true
            
            marcheSubMenu.removeFromSuperview()
            COTATION.removeFromSuperview()
            PALMARES.removeFromSuperview()
            
            // Hide Calendrier tab
            CALENDRIERCONTENT.hidden = true
            CALENDRIERCONTENT.removeFromSuperview()
            calendrierSubMenu.hidden = true
            calendrierSubMenu.removeFromSuperview()
            
            // Hide Portefeuille Tab
            portefeuilleSubMenu.hidden = true
            portefeuilleSubMenu.removeFromSuperview()
            
            // Show Actualite tab 
            actualiteSubMenu.hidden = false
            INFOSOCIETE.hidden = false
            view.addSubview(actualiteSubMenu)
            view.addSubview(INFOSOCIETE)
        }
        
        
        
        if menuID == 2{
            // Hide marche tab
            marcheSubMenu.hidden = true
            COTATION.hidden =  true
            PALMARES.hidden = true
            
            marcheSubMenu.removeFromSuperview()
            COTATION.removeFromSuperview()
            PALMARES.removeFromSuperview()
            // Hide Actualité tab
            INFOSOCIETE.hidden = true
            actualiteSubMenu.hidden = true
            INFOSOCIETE.removeFromSuperview()
            actualiteSubMenu.removeFromSuperview()
            
            
            // Hide Portefeuille Tab
            portefeuilleSubMenu.hidden = true
            portefeuilleSubMenu.removeFromSuperview()
            
            
            // Show Calendrier Tab
            calendrierSubMenu.hidden = false
            CALENDRIERCONTENT.hidden = false
            view.addSubview(CALENDRIERCONTENT)
            view.addSubview(calendrierSubMenu)
            
        }
        
        if menuID == 3 {
            // Hide marche tab
            marcheSubMenu.hidden = true
            COTATION.hidden =  true
            PALMARES.hidden = true
            
            marcheSubMenu.removeFromSuperview()
            COTATION.removeFromSuperview()
            PALMARES.removeFromSuperview()
            // Hide Actualité tab
            INFOSOCIETE.hidden = true
            actualiteSubMenu.hidden = true
            INFOSOCIETE.removeFromSuperview()
            actualiteSubMenu.removeFromSuperview()
            
            // Hide Calendrier tab
            CALENDRIERCONTENT.hidden = true
            CALENDRIERCONTENT.removeFromSuperview()
            calendrierSubMenu.hidden = true
            calendrierSubMenu.removeFromSuperview()
            
            
            // Show Portefeuille Tab
            if ( _isConnected ){
                portefeuilleSubMenu.hidden = false
                view.addSubview(portefeuilleSubMenu)
            }else {
                print("his not connected")
            }
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

