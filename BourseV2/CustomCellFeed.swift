//
//  CustomCellFeed.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit
class CustomCellFeed : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    let verticalSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    let titleCol: UILabel = {
        let text = UILabel()
        text.text = "CAC 40"
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        return text
    }()
    let price: UILabel = {
        let text = UILabel()
        text.text = "5.188,80"
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        return text
    }()
    let datePlace: UILabel = {
        let text = UILabel()
        text.text  = "10:07:50 | Paris"
        text.font = UIFont.systemFontOfSize(FontSizes.s12)
        return text
    }()
    let percentage: UILabel = {
        let text = UILabel()
        text.text = "-3,80 (-0,03 %)"
        text.textColor = UIColor.redColor()
        text.font = UIFont.systemFontOfSize(FontSizes.s12)
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
        //        let spacing  = ( frame.height / 8 )
        //        let imageWidth = frame.width / 50
        //        let priceHeight = frame.height / 25
        //        let hightSpacing = frame.height / 3
        //        let titleHeight = frame.height  / 25
        //        let dateWidth = frame.width / 16
        
        
        
        let spacing  = frame.width / 51.75
        let imageWidth = frame.width / 8.28
        let priceHeight = frame.height / 2.0
        let hightSpacing = frame.height / 16.6666666666667
        let titleHeight = frame.height / 2.0
        let dateWidth = frame.width / 25.875
        let imageHeight = frame.height / 1.06382978723404
        
        addConstraintsWithFormat("H:[v0]-\(spacing)-[v1(1)]-1-[v2(\(imageWidth))]-0-|", views:price,verticalSeparator, imageView)
        addConstraintsWithFormat("V:|-\(hightSpacing)-[v0(\(priceHeight))][v1]", views: price,percentage)
        addConstraintsWithFormat("V:|-\(hightSpacing)-[v0]-\(hightSpacing)-|", views: verticalSeparator)
        
        addConstraintsWithFormat("V:|-\(hightSpacing)-[v0(\(imageHeight))]|", views: imageView)
        
        addConstraintsWithFormat("H:|-\(dateWidth)-[v0]", views: titleCol)
        addConstraintsWithFormat("V:|-\(hightSpacing)-[v0(\(titleHeight))][v1]", views: titleCol,datePlace)
        
        addConstraintsWithFormat("H:|-\(dateWidth)-[v0]", views: datePlace)
        
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]-0-|", views: separatorView)
        
        // align the percentage right w price right
        addConstraint(NSLayoutConstraint(item: percentage, attribute: .Right, relatedBy: .Equal, toItem: price, attribute: .Right, multiplier: 1, constant: 0))
        
    }
    
}

