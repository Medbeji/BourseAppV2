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
        return label
    }()
    
    
    override func setupViews() {
        
        backgroundColor = UIColor.blueColor()
        
        addSubview(label)
        addConstraintsWithFormat("H:|[v0]|", views: label)
        addConstraintsWithFormat("V:|[v0]|", views: label)
    }
}
