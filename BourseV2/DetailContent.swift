//
//  DetailContent.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//


import UIKit

class DetailContent: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var homeController: HomeController?
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(236, green: 236, blue: 236)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    private let chartCellId = "chartCell"
    private let infoCellId = "infoCellId"
    private let actualityBarCell = "actualityBarCell"
    private let actualityCell = "actualityCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.registerClass(DetailChartCell.self, forCellWithReuseIdentifier: chartCellId )
        collectionView.registerClass(DetailInfoCell.self, forCellWithReuseIdentifier: infoCellId )
        collectionView.registerClass(ActBarCell.self, forCellWithReuseIdentifier: actualityBarCell )
        collectionView.registerClass(ActCell.self, forCellWithReuseIdentifier: actualityCell)
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(infoCellId, forIndexPath: indexPath) as! DetailInfoCell
            return cell
        }
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(actualityBarCell, forIndexPath: indexPath) as! ActBarCell
            return cell
        }
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(chartCellId, forIndexPath: indexPath) as! DetailChartCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(actualityCell, forIndexPath: indexPath) as! ActCell
        
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.item == 2 {
            print("Pourcentage height for Chart / 30 = \(collectionView.frame.height / 30 )")
            return CGSizeMake(collectionView.frame.width, collectionView.frame.height / 16.5666666666667)
        }
        if indexPath.item == 3 {
            print("Pourcentage height for Chart / 80 = \(collectionView.frame.height / 80 )")
            
            return CGSizeMake(collectionView.frame.width, collectionView.frame.height  / 6.2125)
            
        }
        print("Pourcentage height for Chart / 200 = \(collectionView.frame.height / 200 )")
        // regler avec iphone 6s plus resolutions
        return CGSizeMake(collectionView.frame.width, collectionView.frame.height / 2.485)    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    
    
}









