//
//  ActualiteFeedCell.swift
//  BourseV2
//
//  Created by Med Beji on 30/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class ActualiteFeedCell : BaseCell {
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(230, green: 230, blue: 230)
        return view
    }()
    
    
    let titleCol: UILabel = {
        let text = UILabel()
        text.text = "Royaume Uni: -0,4 % de production industrielle en juin"
        
        text.font = UIFont.systemFontOfSize(FontSizes.s15)
        
        text.numberOfLines = 2
        return text
    }()
    
    let datePlace: UILabel = {
        let text = UILabel()
        text.text  = "Aug 06, 2015 10:00"
        text.font = UIFont.systemFontOfSize(FontSizes.s12)
        
        text.textColor = UIColor.grayColor()
        return text
    }()
    
    let imageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.clearColor()
        iv.tintColor = UIColor.lightGrayColor()
        iv.contentMode = .ScaleAspectFill
        return iv
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.rgb(250, green: 250, blue: 250)
        addSubview(separatorView)
        addSubview(titleCol)
        addSubview(imageView)
        addSubview(datePlace)
        
        //        print("Actualite View Cell ")
        //        print("spacing width = \(frame.width / 8 )")
        //        print ("Image height par rapport total  height\(frame.width/80)")
        //        print("title height par rapport total height\(frame.height / 50 ) et date Place = \(frame.height / 24) ")
        //
        let spacingHeight = frame.height / 13.75
        let spacingWidth = frame.width / 51.75
        //        let imageHeight = frame.height  / 1.375
        let imageWidth = frame.width / 5.175
        let titleHeight = frame.height  / 2.2
        let dateHeight = frame.height / 4.58333333333333
        //        let titleWidth = frame
        addConstraintsWithFormat("H:|-\(spacingWidth)-[v0(\(imageWidth))]-\(spacingWidth)-[v1]-\(spacingWidth)-|", views: imageView, titleCol)
        addConstraintsWithFormat("H:[v0]-\(spacingWidth)-|", views: datePlace)
        addConstraintsWithFormat("V:|-\(spacingHeight)-[v0]-\(spacingHeight)-|", views: imageView)
        addConstraintsWithFormat("V:|-\(spacingHeight)-[v0(\(titleHeight))][v1(\(dateHeight))]", views: titleCol,datePlace)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        addConstraintsWithFormat("V:[v0(1)]-0-|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: datePlace, attribute: .Left, relatedBy: .Equal, toItem: titleCol, attribute: .Left, multiplier: 1, constant: 0))
    }
    
}