//
//  HomeSubMenu.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit


class MarcheSubMenu: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var homeController: HomeController?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    let  subMenuTitles = ["COTATION ","PALMARES ","INDICES ","OBLIGATIONS ","DEVISES ","MATIERES PREMIERES "]
    
    
    override init(frame: CGRect ) {
        super.init(frame: frame)
        
        collectionView.registerClass(MySubMenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        setupHorizontalBar()
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
    }
    
    
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.blackColor()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraintEqualToAnchor(self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.active = true
        
        horizontalBarView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        horizontalBarView.widthAnchor.constraintEqualToAnchor(self.widthAnchor, multiplier: 1/3).active = true
        horizontalBarView.heightAnchor.constraintEqualToConstant(4).active = true
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subMenuTitles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MySubMenuCell
        
        cell.textlabel.text = subMenuTitles[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(frame.width / 3, frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 3
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animateWithDuration(0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
            self.layoutIfNeeded()
            self.homeController?.switchingBetweenSubMenus(Int(indexPath.row))
            }, completion: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}