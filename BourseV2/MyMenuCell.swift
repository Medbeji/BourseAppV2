//
//  MyMenuCell.swift
//  BourseV2
//
//  Created by Med Beji on 25/06/2016.
//  Copyright © 2016 alphalab. All rights reserved.
//

import UIKit

class MyMenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "home")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.rgb(156, green: 156, blue: 156)
        return iv
    }()
    
    override var highlighted: Bool {
        didSet {
            imageView.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            
        }
    }
    
    override var selected: Bool {
        didSet {
            imageView.tintColor = selected ? UIColor.whiteColor() : UIColor.rgb(156, green: 156, blue: 156)
            
        }
    }
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintsWithFormat("H:[v0(28)]", views: imageView)
        addConstraintsWithFormat("V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
    }
    
}

