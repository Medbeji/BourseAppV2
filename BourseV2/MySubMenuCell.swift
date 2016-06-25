//
//  MySubMenuCell.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit


class MySubMenuCell: BaseCell {
    
    let textlabel: UILabel = {
        let iv = UILabel()
        iv.textColor = UIColor.rgb(156, green: 156, blue: 156)
        iv.font = UIFont.boldSystemFontOfSize(12.0)
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
