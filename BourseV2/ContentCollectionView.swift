//
//  ContentCollectionView.swift
//  BourseV2
//
//  Created by Med Beji on 24/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class ContentCollectionView: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
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
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width, 50)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("View detail from row \(indexPath.row)")
        homeController?.showAppDetailForApp()
    }
    
}

class CustomCellFeed : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        return view
    }()
    
    let verticalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGrayColor()
        return view
    }()
    
    let titleCol: UILabel = {
        let text = UILabel()
        text.text = "CAC 40"
        text.font = UIFont.systemFontOfSize(15)
        return text
    }()
    let price: UILabel = {
        let text = UILabel()
        text.text = "5.188,80"
        text.font = UIFont.systemFontOfSize(15)
        return text
    }()
    let datePlace: UILabel = {
        let text = UILabel()
        text.text  = "10:07:50 | Paris"
        text.font = UIFont.systemFontOfSize(12)
        return text
    }()
    let percentage: UILabel = {
        let text = UILabel()
        text.text = "-3,80 (-0,03 %)"
        text.textColor = UIColor.redColor()
        text.font = UIFont.systemFontOfSize(12)
        return text
    }()
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "next")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(250, green: 250, blue: 250)
        addSubview(separatorView)
        addSubview(verticalSeparator)
        addSubview(titleCol)
        addSubview(imageView)
        addSubview(price)
        addSubview(datePlace)
        addSubview(percentage)
        
        addConstraintsWithFormat("H:[v0]-8-[v1(1)]-1-[v2(50)]-0-|", views:price,verticalSeparator, imageView)
        addConstraintsWithFormat("V:|-3-[v0(25)][v1]", views: price,percentage)
        addConstraintsWithFormat("V:|-3-[v0]-3-|", views: verticalSeparator)
        
        addConstraintsWithFormat("V:|-3-[v0]|", views: imageView)
        
        addConstraintsWithFormat("H:|-16-[v0]", views: titleCol)
        addConstraintsWithFormat("V:|-3-[v0(25)][v1]", views: titleCol,datePlace)
        
        addConstraintsWithFormat("H:|-16-[v0]", views: datePlace)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]-0-|", views: separatorView)
        
        // align the percentage right w price right 
        addConstraint(NSLayoutConstraint(item: percentage, attribute: .Right, relatedBy: .Equal, toItem: price, attribute: .Right, multiplier: 1, constant: 0))
        
    }
    
}

