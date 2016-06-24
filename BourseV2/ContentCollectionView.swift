//
//  ContentCollectionView.swift
//  BourseV2
//
//  Created by Med Beji on 24/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class ContentCollectionView: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.registerClass(CustomCellFeed.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width, 65)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
}

class CustomCellFeed : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    let titleCol: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFontOfSize(13)
        return text
    }()
    let price: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFontOfSize(13)
        return text
    }()
    let datePlace: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFontOfSize(12)
        return text
    }()
    let percentage: UILabel = {
        let text = UILabel()
        text.font = UIFont.systemFontOfSize(12)
        return text
    }()
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "flech")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.lightGrayColor()
        return iv
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.whiteColor()
        addSubview(separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]-0-|", views: separatorView)
    }
    
}

