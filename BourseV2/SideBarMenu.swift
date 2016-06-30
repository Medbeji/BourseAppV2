//
//  SideBarMenu.swift
//  BourseV2
//
//  Created by Med Beji on 29/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit


class SideBarMenu: UIView ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(71, green: 72, blue: 71)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let sbarCell = "sbarCell"
    let emptyCell = "emptyCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.registerClass(SbarCell.self, forCellWithReuseIdentifier: sbarCell)
        collectionView.registerClass(EmptyCell.self, forCellWithReuseIdentifier: emptyCell)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(emptyCell, forIndexPath: indexPath) as! EmptyCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(sbarCell, forIndexPath: indexPath) as! SbarCell
            //Customizing our cell view
            
            
            switch indexPath.row {
            case 0:
                cell.icon = UIImage(named:"home")!
                cell.label.text = "Marchés"
                
            case 1:
                cell.icon = UIImage(named:"actualite")!
                cell.label.text = "Actualités"
                
            case 2 :
                cell.icon = UIImage(named:"calendrier")!
                cell.label.text = "Calendrier"
                
            case 3:
                cell.icon = UIImage(named:"portefeuille")!
                cell.label.text = "Portefeuille"
            case 5:
                cell.icon = UIImage(named:"config")!
                cell.label.text = "Paramètres"
                
            default :
                print("incorrect cell")
                
            }
            cell.image.image = cell.icon
            cell.image.image = cell.image.image!.imageWithRenderingMode(.AlwaysTemplate)
            
            return cell
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if ( indexPath.row == 4) {
            return CGSizeMake(frame.width,frame.height - ( 50 * 5))
        }
        return CGSizeMake(frame.width,  50)
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return  1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


class EmptyCell : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    override func setupViews() {
        addSubview(separatorView)
        addConstraintsWithFormat("V:[v0(1)]|", views: separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
    }
}