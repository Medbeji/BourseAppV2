//
//  SubMenu.swift
//  BourseV2
//
//  Created by Med Beji on 24/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit


class SubMenu: UIView , UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.whiteColor()
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    let subMenuTitles = ["OBLIGATIONS", "DEVISES", "MATIERES PREMIERE"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.registerClass(MyCustomCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subMenuTitles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! MyCustomCell
        
        cell.textlabel.text = subMenuTitles[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(frame.width / CGFloat(subMenuTitles.count) , frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





class MyCustomCell: BaseCell {
    
    let textlabel: UILabel = {
        let iv = UILabel()
        iv.textColor = UIColor.rgb(156, green: 156, blue: 156)
        iv.font = UIFont.boldSystemFontOfSize(13.0)
        return iv
    }()
    
    override var highlighted: Bool {
        didSet {
            
            backgroundColor = highlighted ? UIColor.darkGrayColor() : UIColor.whiteColor()
            
        }
    }
    
    override var selected: Bool {
        didSet {
            textlabel.textColor = selected ? UIColor.blackColor() : UIColor.rgb(156, green: 156, blue: 156)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(textlabel)
        addConstraintsWithFormat("H:[v0]", views: textlabel)
        addConstraintsWithFormat("V:[v0(28)]", views: textlabel)
        
        addConstraint(NSLayoutConstraint(item: textlabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: textlabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
}
