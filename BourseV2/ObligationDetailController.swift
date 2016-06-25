//
//  ObligationDetailController.swift
//  BourseV2
//
//  Created by Med Beji on 24/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class ObligationDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout  {
    
    private let headerId = "headerId"
    private let chartCellId = "chartCell"
    private let infoCellId = "infoCellId"
    private let actualityBarCell = "actualityBarCell"
    private let actualityCell = "actualityCell"
    
    override func viewDidLoad() {
        collectionView?.alwaysBounceVertical = true
        collectionView?.backgroundColor = UIColor.redColor()
        
        // Registering my Cells
        collectionView?.registerClass(OppDetailHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.registerClass(DetailChartCell.self, forCellWithReuseIdentifier: chartCellId )
        collectionView?.registerClass(DetailInfoCell.self, forCellWithReuseIdentifier: infoCellId )
        collectionView?.registerClass(ActBarCell.self, forCellWithReuseIdentifier: actualityBarCell )
        collectionView?.registerClass(ActCell.self, forCellWithReuseIdentifier: actualityCell )
        
    }
    
    // Header Settings
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerId, forIndexPath: indexPath) as! OppDetailHeader
        return header
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSizeMake(collectionView.frame.width, 135)
    }
    
    // Cell Settings
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
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
            return CGSizeMake(view.frame.width, 30)
        }
        if indexPath.item == 3 {
            return CGSizeMake(view.frame.width, 80)
            
        }
        return CGSizeMake(view.frame.width, 200)
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
}





















