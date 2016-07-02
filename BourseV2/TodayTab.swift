//
//  TodayTab.swift
//  BourseV2
//
//  Created by Med Beji on 01/07/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//


import UIKit

class TodayTab : UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(236, green: 236, blue: 236)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.registerClass(CalendrierCustomCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath) as! CalendrierCustomCell
        //        cell.titleCol.adjustsFontSizeToFitWidth = true
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(collectionView.frame.width, collectionView.frame.height / 5.10909090909091)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("View detail from row \(indexPath.row)")
        
    }
    
}

