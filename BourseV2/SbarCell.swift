//
//  sbarCell.swift
//  BourseV2
//
//  Created by Med Beji on 29/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class SbarCell : BaseCell {
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.textColor = UIColor.rgb(156, green: 156, blue: 156)
        
        return label
    }()
    
    var icon: UIImage = UIImage() {
        didSet {
            UIGraphicsBeginImageContext(CGSizeMake(25, 25))
            self.icon.drawInRect(CGRectMake(0, 0, 25, 25))
            self.icon = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.icon.imageWithRenderingMode(.AlwaysTemplate)
            
        }
    }
    let image :  UIImageView = {
        let img = UIImageView()
        img.contentMode = .ScaleToFill
        img.tintColor = UIColor.rgb(156, green: 156, blue: 156)
        return img
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(55, green: 55, blue: 55)
        return view
    }()
    
    override var highlighted: Bool {
        didSet {
            image.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            label.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            
        }
    }
    
    override var selected: Bool {
        didSet {
            image.tintColor = selected ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            label.tintColor = selected ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            
        }
    }
    
    
    override func setupViews() {
        
        addSubview(label)
        addSubview(image)
        addSubview(separatorView)
        
        addConstraintsWithFormat("H:|-16-[v0]-8-[v1]|", views:image, label)
        addConstraintsWithFormat("V:|[v0]|", views: label)
        addConstraintsWithFormat("V:[v0]", views: image)
        addConstraintsWithFormat("V:[v0(1)]|", views: separatorView)
        addConstraintsWithFormat("H:|[v0]|", views: separatorView)
        
        
        //        addConstraint(NSLayoutConstraint(item: image, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: image, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
        
    }
}
